import pool from "~/server/utils/db";
import { defineEventHandler, getQuery } from 'h3';

export default defineEventHandler(async (event) => {
  // Get the mainCategoryId from the query parameter
  const { mainCategoryId } = getQuery(event);

  if (!mainCategoryId) {
    return { error: 'mainCategoryId is required' };
  }

  const client = await pool.connect();

  // Query to get subcategories based on the given mainCategoryId
  const result = await client.query(
    "SELECT id, name, description FROM subcategories WHERE main_category_id = $1",
    [mainCategoryId]
  );

  await client.release();

  return result.rows.map(subcategory => ({
    id: subcategory.id,
    name: subcategory.name,
    imagePath: `/subcategories/${subcategory.id}.jpg`,
    description: subcategory.description
  }));
});
