import pool from "~/server/utils/db";
import { defineEventHandler } from 'h3';

export default defineEventHandler(async (event) => {
  const params = event.context?.params;  // Access params safely

  if (!params?.id) {
    throw createError({ statusCode: 400, message: 'Article ID is required' });
  }

  const { id } = params;  // Now we safely access `id`

  const client = await pool.connect();

  try {
    // Query to get details of the article by ID
    const result = await client.query("SELECT id, name, content FROM articles WHERE id = $1", [id]);
    const article = result.rows[0];  // We assume there's only one article with the given ID

    if (!article) {
      throw createError({ statusCode: 404, message: 'Article not found' });
    }

    // Return the article details
    return {
      id: article.id,
      name: article.name,
      content: article.content,
      imagePath: `/images/articles/${article.id}.jpg`
    };
  } finally {
    await client.release();
  }
});
