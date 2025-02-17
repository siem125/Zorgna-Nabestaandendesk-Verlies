import pool from "~/server/utils/db";
import { defineEventHandler } from "h3";

export default defineEventHandler(async () => {

  const client = await pool.connect();
  const result = await client.query("SELECT id, name FROM main_categories");
  await client.release();

  return result.rows.map(category => ({
    id: category.id,
    name: category.name,
    imagePath: `/main_categories/${category.id}.jpg`,
    description: category.description
  }));
});
