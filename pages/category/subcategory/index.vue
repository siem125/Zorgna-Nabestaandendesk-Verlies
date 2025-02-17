<template>
  <div>
    <div v-if="subCategoryData" class="subcategory-data">
      <h1 class="subcategory-title">{{ subCategoryData.name }}</h1>
      <p>{{ subCategoryData.description }}</p>
    </div>
    <div v-else>
      <p>Loading...</p>
    </div>

    <!-- Articles Section -->
    <section class="articles">
      <div class="article-cards">
        <div v-for="(article, index) in articles" :key="index" class="article-card">
          <a :href="`/category/subcategory/article?articleId=${article.id}`" class="category-link">
            <img :src="article.imagePath" :alt="article.name" class="article-image">
            <div class="article-content">
              <h3 class="article-title">{{ article.name }}</h3>
              <!-- <p class="article-text">{{ article.content }}</p> -->
              <span>{{getFirstSentence(article.content)}}</span>
              <br>
              <span>➝</span>
            </div>
          </a>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { useRoute, useFetch } from 'nuxt/app';

// Get subcategory ID from the query parameter
const route = useRoute();
const subCategoryId = route.query.subCategoryId;

// Fetch subcategory details
const { data: subCategoryData, error: subCategoryError } = await useFetch(`/api/subcategory/${subCategoryId}`);
if (subCategoryError.value) {
  console.error("Error fetching subcategory data:", subCategoryError.value);
}

// Fetch articles related to the subcategory
const { data: articles, error: articlesError } = await useFetch(`/api/articles?subCategoryId=${subCategoryId}`);
if (articlesError.value) {
  console.error("Error fetching articles:", articlesError.value);
}

// Function to extract and display the first sentence (in <b>) from the content
const getFirstSentence = (html) => {
  if (typeof window === 'undefined' || !html) return "";

  // Create a temporary div to parse the HTML content
  const tempDiv = document.createElement("div");
  tempDiv.innerHTML = html;

  // Extract first sentence (the content inside <b> tags)
  const boldContent = tempDiv.querySelector('b')?.innerHTML || '';

  // Return the bold content
  return boldContent;
};

</script>

<style scoped>
  :root {
    --theme-color: #00BCC6; /* This is the color for both the button and article heading */
  }

.subcategory-data {
  text-align: left;
  width: 70%;
  margin: 0 auto;
}

.subcategory-title {
  font-size: 2rem;
  font-weight: bold;
  margin-bottom: 20px;
  color: var(--theme-color);
}

.category-link {
  display: block;
  height: 100%;
  color: inherit;
  text-decoration: none;
}

.articles {
  width: 70%;
  margin: 0 auto;
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

.article-content {
  padding: 15px;
  text-align: left;
}

.article-title {
  color: var(--theme-color);
  font-size: 1.5rem;
  font-weight: bold;
}

.article-text {
  font-size: 1rem;
  margin-bottom: 20px;
}

.read-more-dark {
  background: none;
  border: none;
  font-size: 1.5rem;
  cursor: pointer;
  color: #080808;
}
</style>
