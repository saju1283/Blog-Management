<script setup>
import DashboardLayout from '@/Layouts/DashboardLayout.vue'
import { defineProps, ref } from 'vue'
import { router } from '@inertiajs/vue3'

defineOptions({ layout: DashboardLayout })

const props = defineProps({
  bookmarks: {
    type: Object,
    default: () => ({ data: [], links: [] })
  }
})

const defaultProfile = '/images/default.png'
const newComment = ref('')

const removeBookmark = (postId) => {
  router.delete(`/bookmarks/${postId}`, { preserveScroll: true })
}

const likePost = (postId) => {
  router.post(`/posts/${postId}/like`, {}, { preserveScroll: true })
}

const submitComment = (postId) => {
  if (!newComment.value.trim()) return
  router.post(`/posts/${postId}/comments`, { body: newComment.value }, {
    preserveScroll: true,
    onSuccess: () => newComment.value = ''
  })
}

const changePage = (url) => {
  if (!url) return
  router.visit(url, {
    preserveScroll: true,
    preserveState: true
  })
}
</script>

<template>
  <div class="container py-4">
    <h2 class="mb-4">Your Bookmarked Posts</h2>

    <div v-if="bookmarks.data.length">
      <div class="card mb-4" v-for="bookmark in bookmarks.data" :key="bookmark.id">
        <div class="card-body">
          <div class="d-flex justify-content-between">
            <div class="d-flex align-items-center">
              <img :src="bookmark.post.user.profile_picture || defaultProfile" class="rounded-circle me-2" width="40" height="40">
              <strong>{{ bookmark.post.user.username }}</strong>
            </div>
            <span class="badge bg-secondary text-capitalize">{{ bookmark.post.visibility }}</span>
          </div>

          <h5 class="mt-3">{{ bookmark.post.title }}</h5>
          <p>{{ bookmark.post.content.slice(0, 150) }}...</p>

          <div class="d-flex gap-3 mt-2">
            <button class="btn btn-outline-primary btn-sm" @click="likePost(bookmark.post.id)">Like</button>
            <button class="btn btn-outline-danger btn-sm" @click="removeBookmark(bookmark.post.id)">Remove Bookmark</button>
          </div>

          <form class="mt-3" @submit.prevent="submitComment(bookmark.post.id)">
            <textarea class="form-control mb-2" placeholder="Write a comment..." v-model="newComment"></textarea>
            <button type="submit" class="btn btn-sm btn-outline-secondary">Comment</button>
          </form>
        </div>
      </div>
    </div>

    <div v-else>
      <p>You haven't bookmarked any posts yet.</p>
    </div>

    <!-- Pagination -->
    <nav class="mt-4" v-if="bookmarks.links && bookmarks.links.length > 3">
      <ul class="pagination justify-content-center">
        <li class="page-item" :class="{ disabled: !bookmarks.prev_page_url }">
          <button class="page-link" @click="changePage(bookmarks.prev_page_url)">Previous</button>
        </li>
        <li
          v-for="(link, index) in bookmarks.links"
          :key="index"
          class="page-item"
          :class="{ active: link.active, disabled: !link.url }"
        >
          <button class="page-link" @click="changePage(link.url)" v-html="link.label" />
        </li>
        <li class="page-item" :class="{ disabled: !bookmarks.next_page_url }">
          <button class="page-link" @click="changePage(bookmarks.next_page_url)">Next</button>
        </li>
      </ul>
    </nav>
  </div>
</template>

<style scoped>
img.rounded-circle {
  object-fit: cover;
}
</style>
