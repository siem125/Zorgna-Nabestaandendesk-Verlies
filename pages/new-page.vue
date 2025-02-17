<template>
  <div class="p-4 bg-gray-100 min-h-screen">
    <!-- Hero Section -->
    <div class="relative h-48 bg-cover bg-center text-white flex flex-col justify-center items-center text-center p-4" :style="{ backgroundImage: 'url(/hero.jpg)' }">
      <h1 class="text-2xl font-bold">Hero Title</h1>
      <p class="text-sm">Short description within the image</p>
    </div>
    
    <!-- Categories List -->
    <div class="mt-4 grid grid-cols-1 gap-4">
      <div v-for="category in categories" :key="category.id" class="bg-white p-4 rounded-lg shadow flex items-center justify-between">
        <div class="flex items-center gap-3">
          <img :src="category.image" class="w-12 h-12 rounded" alt="Category Image">
          <div>
            <h2 class="text-lg font-bold">{{ category.name }}</h2>
            <p class="text-sm text-gray-500">Lees hier alle artikelen</p>
          </div>
        </div>
        <span class="text-xl">➡️</span>
      </div>
    </div>
  </div>
</template>

<script setup>
const categories = [
  { id: 1, name: 'Category 1', image: '/category1.jpg' },
  { id: 2, name: 'Category 2', image: '/category2.jpg' },
  { id: 3, name: 'Category 3', image: '/category3.jpg' }
];
</script>

<style scoped>
</style>
