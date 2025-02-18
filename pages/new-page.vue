<template>
  <div class="bg-dark text-white min-h-screen p-6">
    <h1 class="text-2xl font-bold mb-4">Thema’s</h1>
    <div class="bg-light p-4 rounded-xl shadow-md text-black">
      <ul class="space-y-3">
        <li v-for="theme in themes" :key="theme.id">
          <NuxtLink 
            :to="`/subcategories?theme=${theme.id}`" 
            class="block bg-gray-200 p-3 rounded-lg hover:bg-accent hover:text-white transition">
            {{ theme.name }}
          </NuxtLink>
        </li>
      </ul>
    </div>
  </div>
</template>

<script setup>
const themes = [
  { id: 1, name: "Alles over rouw op één plek" },
  { id: 2, name: "Omgaan met verlies" },
];
</script>
