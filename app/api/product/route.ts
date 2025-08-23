import { NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';
import { convertBigInt } from '@/src/server/utils/convertBigInt';

// Initialize Prisma client
const prisma = new PrismaClient();

// GET handler for fetching products
export async function GET() {
  try {
    // Fetch active products
    const products = await prisma.product_pro.findMany({
      where: {
        isactive: 1,
      },
      select: {
        id: true,
        title: true,
        image: true,
        price_discount: true,
        price: true,
        cat_id: true,
        capacity_id: true, // Include capacity_id for manual mapping
      },
      orderBy: {
        id: 'asc',
      },
    });

    // Fetch active categories
    const categories = await prisma.product_cat.findMany({
      where: {
        isactive: 1,
      },
      select: {
        id: true,
        title: true,
        re_name: true,
      },
    });

    // Fetch all capacities
    const capacities = await prisma.product_capacity.findMany({
      select: {
        id: true,
        title: true,
      },
    });

    // Create lookup maps
    const categoryMap = new Map(categories.map(cat => [cat.id, cat]));
    const capacityMap = new Map(capacities.map(cap => [cap.id, cap.title]));

    // Return 404 if no products found
    if (!products || products.length === 0) {
      return NextResponse.json({ message: 'No products found' }, { status: 404 });
    }

    // Format product list with category and capacity info
    const formattedProducts = products.map(product => {
      const category = categoryMap.get(Number(product.cat_id));
      const capacity = capacityMap.get(Number(product.capacity_id));
      return {
        id: product.id,
        title: product.title,
        image: product.image,
        price: product.price,
        category: category?.title ?? 'Not defined',
        categorySlug: category?.re_name ?? '',
        capacity: capacity ?? 'Unknown',
      };
    });

    // Convert BigInt values safely
    const safeResponse = convertBigInt(formattedProducts);
    if (safeResponse.length === 0) {
      return NextResponse.json({ message: 'No product found' }, { status: 404 });
    }

    // Return final response
    return NextResponse.json(safeResponse);

  } catch (error) {
    console.error('Error fetching products:', error);
    return NextResponse.json({ message: 'Internal Server Error' }, { status: 500 });
  } finally {
    await prisma.$disconnect();
  }
}
