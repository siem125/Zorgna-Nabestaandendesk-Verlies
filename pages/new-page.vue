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
        <div v-for="(theme, index) in mainthemes" :key="index" class="category-card">
          <img :src="theme.image" :alt="theme.title" class="category-image">
          <div class="category-content">
            <h3 class="category-title">{{ theme.title }}</h3>
            <p class="category-text">{{ theme.text }}</p>
            <button class="read-more">
              <span>➝</span>
            </button>
          </div>
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

const mainthemes = [
  { 
    title: "Elke verliessituatie is anders", 
    image: "/images/Theme1.jpg", 
    text: "Lees hier alle artikelen."
  },
  { 
    title: "Omgaan met verlies", 
    image: "/images/Theme2.jpg", 
    text: "Lees hier alle artikelen."
  },
  { 
    title: "Omstandigheden rond het overlijden", 
    image: "/images/Theme3.jpg", 
    text: "Lees hier alle artikelen."
  },
  { 
    title: "Uw eigen laatje voor later", 
    image: "/images/Theme4.jpg", 
    text: "Lees hier alle artikelen."
  },
  { 
    title: "Overige", 
    image: "/images/Theme5.jpg", 
    text: "Lees hier alle artikelen."
  }
];

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
    --theme-color: #00BCC6;
}

/* Hero Section */
.hero {
    background: url('/images/hero.jpg') center/cover no-repeat;
    height: 500px;  
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
    font-size: 3rem;
    font-weight: bold;
}

.subtitle {
    max-width: 600px;
    text-align: left;
    margin-left: 10%;
    line-height: 1.6;
}

.cta-button {
    margin-left: 10%;
    background-color: var(--theme-color);
    color: white;
    padding: 12px 25px;
    border: none;
    cursor: pointer;
    margin-top: 15px;
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
    width: 70%;
    margin: 0 auto;
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

/* Artikelen Section als Cards */
.articles {
    width: 70%;
    margin: 0 auto;
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
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    flex-wrap: wrap;
}

.article-card {
    background: #f5f5f5;
    overflow: hidden;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.article-image {
    width: 100%;
    height: 200px;
    object-fit: fill;
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

.read-more {
    background: none;
    border: none;
    font-size: 1.5rem;
    cursor: pointer;
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
    display: flex;
    align-items: center;
    padding: 40px;
    width: 70%;
    margin: 0 auto;
}

.Contact-content {
    width: 100%;
    height: 250px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.contact-image {
    max-width: 50%;
    height: 100%;
    width: 50%;
}

.contact-context {
    width: 50%;
    height: 100%;
    padding-left: 20px;
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

/* Responsive Design for Mobile */
@media (max-width: 768px) {
    .hero {
        height: 300px;
    }
    
    .hero-content {
        padding: 15px;
    }

    .title {
        font-size: 2.5rem;
    }

    .subtitle {
        font-size: 1rem;
        margin-left: 0;
        text-align: center;
    }

    .cta-button {
        width: 100%;
        margin-left: 0;
        padding: 10px;
    }

    .main-categories {
        width: 90%;
    }

    .categories {
        grid-template-columns: 1fr;
    }

    .category-card {
        height: 200px;
    }

    .articles {
        width: 90%;
    }

    .article-cards {
        grid-template-columns: 1fr;
    }

    .article-image {
        height: 150px;
    }

    .Contact {
        flex-direction: column;
        align-items: center;
    }

    .Contact-content {
        flex-direction: column;
    }

    .contact-image {
        max-width: 80%;
        height: auto;
    }

    .contact-context {
        width: 100%;
        padding-left: 0;
        text-align: center;
    }
}
</style>
