<template>
  <div class="container py-4">
    <div class="col-md-10 offset-md-1">
      <h3 class="mb-4">My Bookmarked Posts</h3>

      <div v-if="bookmarks.length">
        <div class="card mb-3" v-for="bookmark in bookmarks" :key="bookmark.id">
          <div class="card-body">
            <div class="d-flex justify-content-between">
              <div class="d-flex align-items-center">
                <img :src="bookmark.post.user.profile_picture || defaultProfile" class="rounded-circle me-2" width="40" height="40">
                <strong>{{ bookmark.post.user.username }}</strong>
              </div>
              <span class="badge bg-secondary">{{ bookmark.post.visibility }}</span>
            </div>

            <h5 class="mt-3">{{ bookmark.post.title }}</h5>
            <p>{{ bookmark.post.content.slice(0, 120) }}...</p>

            <a :href="`/posts/${bookmark.post.id}`" class="btn btn-sm btn-outline-primary">Read More</a>
          </div>
        </div>
      </div>
      <div v-else>
        <p>No bookmarks found.</p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { defineProps } from 'vue'

const props = defineProps({
  bookmarks: Array
})

const defaultProfile = '/images/default.png'
</script>

<style scoped>
img.rounded-circle {
  object-fit: cover;
}
</style>
