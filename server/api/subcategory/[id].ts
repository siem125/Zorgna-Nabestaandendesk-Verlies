import pool from "~/server/utils/db";
import { defineEventHandler } from 'h3';

export default defineEventHandler(async (event) => {
  const params = event.context?.params;  // Access params safely

  if (!params?.id) {
    throw createError({ statusCode: 400, message: 'Subcategory ID is required' });
  }

  const { id } = params;  // Now we safely access `id`

  const client = await pool.connect();

  try {
    // Query to get details of the category by ID
    const result = await client.query("SELECT id, name, description FROM subcategories WHERE id = $1", [id]);
    const subcategory = result.rows[0];  // We assume there's only one subcategory with the given ID

    if (!subcategory) {
      throw createError({ statusCode: 404, message: 'Subcategory not found' });
    }

    // Return the category details
    return {
      id: subcategory.id,
      name: subcategory.name,
      description: subcategory.description,
      imagePath: `/subcategories/${subcategory.id}.jpg`
    };
  } finally {
    await client.release();
  }
});
