<!-- pages/test/_id.vue -->
<template>
  <div>
    <h1>Test ID: {{ id }}</h1>
  </div>
</template>

<script setup>
const route = useRoute();
const id = route.params.id;
</script>
