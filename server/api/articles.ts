import { defineEventHandler, getQuery } from 'h3';
import pool from "~/server/utils/db";

export default defineEventHandler(async (event) => {
  const { subCategoryId } = getQuery(event);

  if (!subCategoryId) {
    return { error: "subCategoryId is required" };
  }

  const client = await pool.connect();
  const result = await client.query("SELECT id, name, content FROM articles WHERE subcategory_id = $1", [subCategoryId]);
  await client.release();

  return result.rows.map(article => ({
    id: article.id,
    name: article.name,
    content: article.content,
    imagePath: `/images/articles/${article.id}.jpg`
  }));
});
