import pool from "~/server/utils/db";
import { defineEventHandler } from 'h3';

export default defineEventHandler(async (event) => {
  const params = event.context?.params;  // Access params safely

  if (!params?.id) {
    throw createError({ statusCode: 400, message: 'Category ID is required' });
  }

  const { id } = params;  // Now we safely access `id`

  const client = await pool.connect();

  try {
    // Query to get details of the category by ID
    const result = await client.query("SELECT id, name, description FROM main_categories WHERE id = $1", [id]);
    const category = result.rows[0];  // We assume there's only one category with the given ID

    if (!category) {
      throw createError({ statusCode: 404, message: 'Category not found' });
    }

    // Return the category details
    return {
      id: category.id,
      name: category.name,
      description: category.description,
      imagePath: `/main_categories/${category.id}.jpg`
    };
  } finally {
    await client.release();
  }
});
