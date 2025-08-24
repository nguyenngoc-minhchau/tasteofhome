import { NextResponse } from "next/server";
import { PrismaClient } from "@prisma/client";
import { convertBigInt } from "@/src/server/utils/convertBigInt";

const prisma = new PrismaClient();

export async function GET(
  request: Request,
  context: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await context.params;
    const productId = BigInt(id);

    // Get the product
    const product = await prisma.product_pro.findUnique({
      where: { id: productId },
    });

    if (!product) {
      return NextResponse.json(
        { message: "Product not found" },
        { status: 404 }
      );
    }

    // Fetch related category (if any)
    const category = await prisma.product_cat.findUnique({
      where: { id: Number(product.cat_id) },
      select: { id: true, title: true, re_name: true },
    });

    // Fetch related capacity (if any)
	let capacityTitle = product.capacity;
	if (!capacityTitle && product.capacity_id) {
	  const cap = await prisma.product_capacity.findUnique({
		where: { id: product.capacity_id },
		select: { title: true },
	  });
	  capacityTitle = cap?.title || null;
	}

	let capacityLookup: string | null = null;
	if (product.capacity_id) {
	  const cap = await prisma.product_capacity.findUnique({
		where: { id: product.capacity_id },
		select: { title: true },
	  });
	  capacityLookup = cap?.title || null;
	}

    // Fetch related datepackage (if any)
    const datepackage =
      product.datepackage_id && product.datepackage_id > 0
        ? await prisma.product_datepackage.findUnique({
            where: { id: Number(product.datepackage_id) },
            select: { id: true, title: true },
          })
        : null;

	// Fetch related taggables
	const taggables = await prisma.taggables.findMany({
	  where: { taggable_id: product.id, taggable_type: "product_pro" },
	});

	// Fetch actual tags for each taggable
	const tags = await prisma.tags.findMany({
	  where: {
		id: { in: taggables.map((t) => t.tags_id) },
	  },
	  select: { id: true, tag_name: true, re_name: true },
	});
	//Fetch brief from product detail
	const detail = await prisma.product_detail.findFirst({
	  where: { pro_id: product.id },
	  select: { brief: true },
	  orderBy: { priority: "asc" },
	});
    // Format for frontend
    const formattedProduct = {
      id: product.id,
      title: product.title,
      image: product.image,
      price: product.price,
      price_discount: product.price_discount,
      capacity: capacityTitle,
	  capacityTitle: capacityLookup,
	  capacity: product.capacity,
      datepackage: datepackage?.title ?? null,
      category: category?.title ?? "Not defined",
      categorySlug: category?.re_name ?? "",
	  brief: detail?.brief ?? product.brief,
	  tags: tags.map((tag) => ({
	  id: tag.id,
	  name: tag.tag_name,
	  slug: tag.re_name,
	})),
      content: product.content,
      brief: product.brief,
      tips: product.tips,
      keyword: product.keyword,
      meta_description: product.meta_description,
      ishot: product.ishot,
      isnew: product.isnew,
      isdefault: product.isdefault,
      priority: product.priority,
      isactive: product.isactive,
      updated_at: product.updated_at,
      created_at: product.created_at,
    };

    return NextResponse.json(convertBigInt(formattedProduct), { status: 200 });
  } catch (error) {
    console.error("Error fetching product:", error);
    return NextResponse.json(
      { message: "Internal Server Error" },
      { status: 500 }
    );
  } finally {
    await prisma.$disconnect();
  }
}
