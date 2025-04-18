<template>
  <div>
    <div v-if="posts.length">
      <div v-for="post in posts" :key="post.id" class="card mb-3">
        <div class="card-body">
          <h5 class="card-title">{{ post.title }}</h5>
          <p class="card-text">{{ post.content }}</p>
          <small class="text-muted">Visibility: {{ post.visibility }}</small>
        </div>
      </div>
    </div>
    <div v-else>
      <p>No posts available.</p>
    </div>
  </div>
</template>

<script setup>
defineProps({
  posts: Array
});
</script>
