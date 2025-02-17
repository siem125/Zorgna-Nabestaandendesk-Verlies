<!-- pages/category/index.vue -->
<template>
  <div>
    <div v-if="categoryData" class="category-data">
      <h1 class="main-category-title">{{ categoryData.name }}</h1>
      <p>{{ categoryData.description }}</p>
      <!-- <img :src="categoryData.imagePath" alt="Category Image" /> -->
    </div>
    <div v-else>
      <p>Loading...</p>
    </div>


    <!-- Subcategorieën Section -->
    <section class="subcategories">
      <div class="categories">
        <div v-for="category in subCategories" :key="category.id" class="category-card">
          <a :href="`/category/subcategory?subCategoryId=${category.id}`" class="category-link">
          <img :src="`images/subcategories/${category.id}.jpg`" :alt="category.name" class="category-image">
          <div class="category-content">
            <h3 class="category-title">{{ category.name }}</h3>
            <p class="category-text">Lees hier alle artikelen.</p>
            <span class="read-more">➝</span>
          </div>
          </a>
        </div>
      </div>
    </section>

    <!-- Lijn onder Artikelen -->
    <hr class="divider" />

    <!-- Text Section met Link -->
    <section class="TextSection">
      <div class="TextSection-content">
        <div class="textsection-context">
          <h1 class="textsection-title">Textblok met afbeelding</h1>
          <p class="textsection-text">Lorem ipsum dolar sit amet consectetur, adipiscing elit tristique et gravida fusce, blandit platea sagittis porta. laculis natoque magnis accumsan ultricies malesuada in mus, disnissim laoreet morbi nisi vel dui habitasse, consequat lectus elementum cras eget nisl. Quisque bibendum justo ullamcorper, vel habitant semper cubilia, natoque torquent</p>
          <button class="cta-button">
            <a href="/contact" class="cta-link">Contact opnemen</a>
          </button>
        </div>
        <img class="textsection-image" :src="contactImage" alt="Contact Image" />
      </div>
    </section>

    <!-- Contact Section met Link -->
    <section class="Contact">
      <div class="Contact-content">
        <img class="contact-image" :src="contactImage" alt="Contact Image" />
        <div class="contact-context">
          <h1 class="contact-title">Heeft u hulp nodig na een verlies?</h1>
          <p class="contact-text">Nam quam nunc, blandit vel, luctus pulcinar, hendrerit id, lorem...</p>
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

  // Get the category ID from the query parameter
  const route = useRoute();
  const categoryId = route.query.id;
  const { data: categoryData, error } = await useFetch(`/api/category/${categoryId}`);
  if (error.value) {
    console.error('Error fetching category data:', error.value);
  }

  const contactImage = "/images/contact-image.jpg";

  // Fetch subcategories
  const { data: subCategories, error: categoriesError } = useFetch('/api/subcategories?mainCategoryId=' + categoryId);
  if (categoriesError.value) {
    console.error("Error fetching subcategories:", categoriesError.value);
  }
</script>

<style scoped>
  .category-data{
    text-align: left;
    width: 70%;
    margin: 0 auto;
  }

  .main-category-title {
    font-size: 2rem;
    font-weight: bold;
    margin-bottom: 20px;
    color: var(--theme-color);
  }

  /* Same styles as previous, adjust classes accordingly */
  /* Subcategories Section */
  .subcategories {
    padding: 40px;
    width: 70%;
    margin: 0 auto;
  }

  .categories {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
    justify-content: center;
  }

  .category-card {
    position: relative;
    width: 100%;
    height: 250px;
    background-color: rgba(0, 0, 0, 0.4);
  }

  .category-link {
    display: block;
    height: 100%;
    color: inherit;
    text-decoration: none;
  }

  .category-image {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: fill;
    z-index: -1;
  }

  .category-content {
    color: white;
    padding: 15px;
    z-index: 2;
    margin-top: 10%;
  }

  .category-title {
    font-size: 1.5rem;
    font-weight: bold;
  }

  .category-text {
    font-size: 1rem;
    margin-bottom: 20px;
  }

  /* Contact Section */
  .TextSection {
    display: flex; /* Use flexbox to place the image and text side by side */
    align-items: center; /* Vertically align items in the center */
    padding: 40px;
    width: 70%; /* Same width as categories */
    margin: 0 auto; /* Center align */
  }

  .TextSection-content {
    width: 100%;
    height: 350px;
    display: flex;
    justify-content: space-between; /* Make sure image and text have space between them */
    align-items: center; /* Align text and image vertically */
  }

  .textsection-image {
    max-width: 50%; /* Make sure the image does not overflow */
    height: 100%;
    /* border-radius: 10px; */  /* Optional: Add rounded corners for the image */
    width: 50%; /* You can adjust this value to your preference */
  }

  .textsection-context {
    width: 50%; /* Adjust width to ensure it takes up the remaining space */
    height: 100%;
    padding-left: 20px; /* Add some space between the image and text */
    background-color: #DBDBDB;
  }

  .textsection-title {
    color: var(--theme-color);
    font-size: 2rem;
    font-weight: bold;
  }

  .textsection-text {
    font-size: 1.0rem;
    margin-bottom: 20px;
  }

  /* Contact Section */
  .Contact {
    display: flex; /* Use flexbox to place the image and text side by side */
    align-items: center; /* Vertically align items in the center */
    padding: 40px;
    width: 70%; /* Same width as categories */
    margin: 0 auto; /* Center align */
  }

  .Contact-content {
    width: 100%;
    height: 250px;
    display: flex;
    justify-content: space-between; /* Make sure image and text have space between them */
    align-items: center; /* Align text and image vertically */
  }

  .contact-image {
    max-width: 50%; /* Make sure the image does not overflow */
    height: 100%;
    /* border-radius: 10px; */  /* Optional: Add rounded corners for the image */
    width: 50%; /* You can adjust this value to your preference */
  }

  .contact-context {
    width: 50%; /* Adjust width to ensure it takes up the remaining space */
    height: 100%;
    padding-left: 20px; /* Add some space between the image and text */
    background-color: #DBDBDB;
  }

  .contact-title {
    color: var(--theme-color);
    font-size: 2rem;
    font-weight: bold;
  }

  .contact-text {
    font-size: 1.2rem;
    margin-bottom: 20px;
  }


</style>