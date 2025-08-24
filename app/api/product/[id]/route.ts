import { NextResponse } from "next/server";
import { PrismaClient } from "@prisma/client";
import { convertBigInt } from "@/src/server/utils/convertBigInt";

const prisma = new PrismaClient();

export async function GET(
  request: Request,
  context: { params: { id: string } } // Sửa lại kiểu dữ liệu
) {
  try {
    const { id } = context.params;
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
    let capacityTitle: string | null = null;
    if (product.capacity_id) {
      const cap = await prisma.product_capacity.findUnique({
        where: { id: product.capacity_id },
        select: { title: true },
      });
      capacityTitle = cap?.title || null;
    } else if (product.capacity) {
      capacityTitle = product.capacity;
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
        id: { in: taggables.map((t: { tags_id: bigint }) => Number(t.tags_id)) },
      },
      select: { id: true, tag_name: true, re_name: true },
    });

    //Fetch brief from product detail
    const detail = await prisma.product_detail.findFirst({
      where: { pro_id: product.id },
      select: { brief: true },
      orderBy: { priority: "asc" },
    });

    // Fetch related products (by category, max 8)
    let relatedProducts: any[] = [];
    if (product.cat_id) {
      const related = await prisma.product_pro.findMany({
        where: {
          cat_id: Number(product.cat_id),
          id: { not: product.id }, // exclude current product
        },
        take: 8,
        orderBy: { created_at: "desc" },
      });

      // Fetch category info for related products
      const categoryObj = await prisma.product_cat.findUnique({
        where: { id: Number(product.cat_id) },
        select: { title: true, re_name: true },
      });

      relatedProducts = related.map((p: any) => ({
        id: p.id,
        title: p.title,
        image: p.image,
        price: p.price,
        category: categoryObj?.title ?? "",
        categorySlug: categoryObj?.re_name ?? "",
      }));
    }

    // Format for frontend
    const formattedProduct = {
      id: product.id,
      title: product.title,
      image: product.image,
      price: product.price,
      price_discount: product.price_discount,
      capacity: capacityTitle,
      capacityTitle: capacityTitle,
      datepackage: datepackage?.title ?? null,
      category: category?.title ?? "Not defined",
      categorySlug: category?.re_name ?? "",
      brief: detail?.brief ?? product.brief,
      tags: tags.map((tag: { id: bigint; tag_name: string; re_name: string | null }) => ({
        id: Number(tag.id),
        name: tag.tag_name,
        slug: tag.re_name ?? "",
      })),
      relatedProducts,
      content: product.content,
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