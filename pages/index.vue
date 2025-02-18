<template>
    <div>
      <!-- Hero Section met Link -->
      <section class="hero">
        <div class="hero-content">
          <h1 class="title">Alles over rouw op een plek.</h1>
          <p class="subtitle">
            Rouwen leer je pas echt als je ermee te maken krijgt.<br>
            Rouwinformatie.nl helpt je rouw beter te begrijpen. Bij jezelf en bij een ander, met informatie waar je wat aan hebt.
          </p>
          <button class="cta-button">
            <a href="/hoofdthema" class="cta-link">Naar artikelen</a>
          </button>
        </div>
      </section>
    
      <!-- Lijn onder Hero -->
      <hr class="divider" />
    
      <!-- Hoofdthema Categorieën Section -->
      <section class="main-categories">
        <h2 class="main-categories-title">Bekijk de thema's</h2>
        <div class="categories">
          <div v-for="category in mainCategories" :key="category.id" class="category-card">
            <a :href="`/category?id=${category.id}`" class="category-link">
              <img :src="`images/main_categories/${category.id}.jpg`" :alt="category.name" class="category-image">
              <div class="category-content">
                <h3 class="category-title">{{ category.name }}</h3>
                <p class="category-text">Vind hier meer informatie.</p>
                <span class="read-more">➝</span>
              </div>
            </a>
          </div>
        </div>
      </section>
  
      <!-- Lijn onder Artikelen -->
      <hr class="divider" />
    
      <!-- Artikelen Section als Cards -->
      <section class="articles">
        <h2 class="articles-title">Artikelen</h2>
        <p>Lorem ipsum dolar sit amet consectetur, adipiscing elit tristique et gravida fusce, blandit platea sagittis porta. laculis natoque magnis accumsan ultricies malesuada in mus, disnissim laoreet morbi nisi vel dui habitasse, consequat lectus elementum cras eget nisl. Quisque bibendum justo ullamcorper, vel habitant semper cubilia, natoque torquent.</p>
        <div class="article-cards">
          <div v-for="(article, index) in articles" :key="index" class="article-card">
            <img :src="article.image" :alt="article.title" class="article-image">
            <div class="article-content">
              <h3 class="article-title">{{ article.title }}</h3>
              <p class="article-text">{{ article.text }}</p>
              <button class="read-more-dark">
                <span>➝</span>
              </button>
            </div>
          </div>
        </div>
      </section>

      <!-- Contact Section met Link -->
      <section class="Contact">
        <div class="Contact-content">
            <!-- Left Image -->
            <img class="contact-image" :src="contactImage" alt="Contact Image" />

            <!-- Right Text Content -->
            <div class="contact-context">
                <h1 class="contact-title">Heeft u hulp nodig na een verlies?</h1>
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
  const contactImage = "/images/contact-image.jpg";

  const { data: mainCategories, error } = useFetch('/api/main-categories');
  if (error.value) {
    console.error("Error fetching categories:", error.value);
  }
  
  const articles = [
    { 
      title: "De tijd kort na een verlies", 
      image: "/images/article1.jpg", 
      text: "Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Phasellus viverra nulla ut metus varius laoreet. Duis arcu tortor, suscipit eget ..."
    },
    { 
      title: "De tijd kort na een verlies", 
      image: "/images/article2.jpg", 
      text: "Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Phasellus viverra nulla ut metus varius laoreet. Duis arcu tortor, suscipit eget ..."
    },
    { 
      title: "De tijd kort na een verlies", 
      image: "/images/article3.jpg", 
      text: "Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Phasellus viverra nulla ut metus varius laoreet. Duis arcu tortor, suscipit eget ..."
    }
  ];
</script>
    
<style>
    /* Defining the common CTA color variable */
    :root {
        --theme-color: #4D9EA4; /* This is the color for both the button and article heading */
    }
  
    /* Hero Section */
    .hero {
        background: url('/images/hero.jpg') center/cover no-repeat;
        height: 500px;  /* Verhoogde hoogte voor een groter effect */
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
    }
    
    .hero-content {
        background: rgba(0, 0, 0, 0.3);
        width: 100%;
        padding: 30px;
        border-radius: 10px;
    }
    
    .title {
        margin-left: 10%;
        font-size: 3rem;  /* Grotere font voor de titel */
        font-weight: bold;
    }
    
    .subtitle {
        max-width: 600px; /* Adjust max width as needed */
        text-align: left; /* Align text to the left */
        margin-left: 10%; /* Moves text 25% from the left side */
        line-height: 1.6; /* Adjust spacing between lines */
    }
    
    .cta-button {
        /* margin-left: 10%; */
        background-color: var(--theme-color);
        color: white;
        padding: 12px 25px;
        border: none;
        cursor: pointer;
        /* margin-top: 15px; */
    }
    
    .cta-link {
        color: white;
        text-decoration: none;
    }
    
    .cta-button:hover .cta-link {
        text-decoration: underline;
    }
    
    /* Divider line */
    .divider {
        margin: 40px 0;
        border: 0;
        border-top: 2px solid #ddd;
    }
    
    /* Hoofdthema Categorieën Section */
    .main-categories {
        padding: 40px;
        width: 70%; /* Set width to 60% */
        margin: 0 auto; /* Center it (30% left, 30% right) */
    }
    
    .main-categories-title {
        font-size: 2rem;
        font-weight: bold;
        margin-bottom: 20px;
        text-align: center;
        color: var(--theme-color);
    }
    
    .categories {
        display: grid;
        grid-template-columns: repeat(2, 1fr); /* Two items per row */
        gap: 20px; /* Add spacing between grid items */
        justify-content: center; /* Center the grid */
    }
    
    .category-card {
        position: relative;
        width: 100%; /* Adjust as needed */
        height: 250px; /* Set a fixed height */
        background-color: rgba(0, 0, 0, 0.4); /* Semi-transparent black background */
        /* border-radius: 10px; */ /* Optional: add rounded corners to the content */
    }
    
    .category-link {
      display: block;
      height: 100%;
      color: inherit;
      text-decoration: none;
    }

    /* Category card hover effect */
    .category-card:hover .category-content {
      transform: scale(1.01);
      transition: transform 0.3s ease;
    }
    
    .category-image {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: fill; /* Stretch the image to fill the div */
        z-index: -1; /* Ensure the image is in the background */
    }
    
    .category-content {
        color: white;
        padding: 15px;
        z-index: 2; /* Ensure content is above overlay */
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
    
    /* Artikelen Section als Cards */
    .articles {
        width: 70%; /* Same width as categories */
        margin: 0 auto; /* Center align */
    }
    
    .articles-title {
        font-size: 2rem;
        font-weight: bold;
        margin-bottom: 20px;
        color: var(--theme-color);
    }
    
    .article-cards {
        width: 100%;
        display: grid;
        grid-template-columns: repeat(3, 1fr); /* 3 cards per row */
        gap: 20px;
        flex-wrap: wrap;
    }
    
    .article-card {
        background: #f5f5f5;
        /* border-radius: 10px; */
        overflow: hidden;
        text-align: center;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        /* width: 50%; */
    }
    
    .article-image {
        width: 100%;
        height: 200px;
        object-fit: fill;  /* previously: cover; */
    }
    
    .article-content {
        padding: 15px;
        text-align: left;
    }
    
    .article-title {
        color: var(--theme-color); /* Apply the color to the article heading */
        font-size: 1.5rem;
        font-weight: bold;
    }
    
    .article-text {
        font-size: 1rem;
        margin-bottom: 20px;
    }
    
    .read-more {
        background: none;
        border: none;
        font-size: 1.5rem;
        color: #FFFFFF;
    }

    .read-more-dark {
        background: none;
        border: none;
        font-size: 1.5rem;
        cursor: pointer;
        color: #080808;
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
  