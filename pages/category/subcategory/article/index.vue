<template>
    <div>
      <!-- Hero Section -->
      <section class="hero" :style="{ backgroundImage: `url(${article.imagePath})` }">
        <div class="hero-overlay">
          <h1 class="hero-title">{{ article.name }}</h1>
        </div>
      </section>
  
      <!-- Article Content Section -->
      <section class="article-content">
        <div class="article-body">
          <div class="article-text" v-html="article.content"></div>
        </div>
      </section>
  
      <!-- Divider Section -->
      <hr class="divider" />
  
      <!-- Other Articles Section -->
      <!-- <section class="other-articles">
        <h2>Related Articles</h2>
        <div class="article-cards">
          <div v-for="(article, index) in otherArticles" :key="index" class="article-card">
            <a :href="`/category/subcategory/article?id=${category.id}`" class="category-link">
                <img :src="article.imagePath" :alt="article.name" class="article-image">
                <div class="article-title">{{ article.name }}</div>
                <span>➝ Read More</span>
            </a>
          </div>
        </div>
      </section> -->
  
      <!-- Contact Section met Link -->
      <section class="Contact">
        <div class="Contact-content">
            <!-- Left Image -->
            <img class="contact-image" :src="contactImage" alt="Contact Image" />

            <!-- Right Text Content -->
            <div class="contact-context">
                <h1 class="contact-title">Goed geregeld geeft rust</h1>
                <p class="contact-text">
                    Nam quam nunc, blandit vel, luctus pulcinar, hendrerit id, lorem. Phasellus viverra nulla ut metus varius laoreet. Duis arcu tortor, suscipit eget imperdiet nec, imperdiet iaculis, ipsum.
                </p>
                <button class="cta-button">
                    <a href="/contact" class="cta-link">Contact opnemen</a>
                </button>
            </div>
        </div>
      </section>
    </div>
  </template>
  
  <script setup>
  import { useRoute, useFetch } from 'nuxt/app';
  
  // Get article ID from the query parameter
  const route = useRoute();
  const articleId = route.query.articleId;
  
  // Fetch the article content
  const { data: article, error: articleError } = await useFetch(`/api/article/${articleId}`);
  if (articleError.value) {
    console.error("Error fetching article:", articleError.value);
  }
  
  // Dummy data for related articles (replace with real fetch when available)
  const otherArticles = [
    { id: 1, name: 'Related Article 1', imagePath: '/path/to/image1.jpg' },
    { id: 2, name: 'Related Article 2', imagePath: '/path/to/image2.jpg' },
    { id: 3, name: 'Related Article 3', imagePath: '/path/to/image3.jpg' },
  ];
  </script>
  
  <style scoped lang="css">
  .hero {
    background-size: cover;
    background-position: center;
    height: 400px;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;;
  }
  
  .hero-overlay {
    background: rgba(0, 0, 0, 0.5);
    padding: 20px;
    width: 100%;
  }
  
  .hero-title {
    color: white;
    font-size: 3rem;
    text-align: center;
  }
  
  .article-content {
    padding: 20px;
    max-width: 800px;
    margin: 0 auto;
  }
  
  .article-body {
    font-size: 1.1rem;
    line-height: 1.6;
  }
  
  .divider {
    margin: 40px 0;
    border: 1px solid #ddd;
  }
  
  .other-articles {
    padding: 20px;
    background: #f8f8f8;
  }
  
  .other-articles h2 {
    text-align: center;
    font-size: 2rem;
    margin-bottom: 20px;
  }
  
  .article-cards {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
  }
  
  .article-card {
    background: #f5f5f5;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }
  
  .article-image {
    width: 100%;
    height: 200px;
    object-fit: cover;
  }
  
  .article-title {
    padding: 10px;
    font-size: 1.2rem;
    font-weight: bold;
    color: var(--theme-color);
  }
  
  .read-more-dark {
    background: none;
    border: none;
    font-size: 1.5rem;
    cursor: pointer;
    color: #080808;
    text-decoration: none;
  }
  
  .contact {
    padding: 40px 20px;
    text-align: center;
    background: #f0f0f0;
  }
  
  .contact h2 {
    font-size: 2rem;
    margin-bottom: 10px;
  }
  
  .contact p {
    font-size: 1.1rem;
  }
  </style>
  