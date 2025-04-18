<script setup>
import DashboardLayout from '@/Layouts/DashboardLayout.vue'
import { defineProps, ref, watch } from 'vue'
import { router } from '@inertiajs/vue3'

defineOptions({ layout: DashboardLayout })

const props = defineProps({
  posts: {
    type: Object,
    default: () => ({ data: [] })
  }
})

const defaultProfile = '/images/default.png'
const search = ref('')
const visibility = ref('')
const filteredPosts = ref([...props.posts.data])
const newComment = ref('')

watch(() => props.posts.data, (newVal) => {
  filteredPosts.value = [...newVal]
})

function filterPosts() {
  const keyword = search.value.toLowerCase()
  filteredPosts.value = props.posts.data.filter(post =>
    post.title.toLowerCase().includes(keyword) ||
    post.content.toLowerCase().includes(keyword) ||
    post.user.username.toLowerCase().includes(keyword)
  )
}

function applyVisibility() {
  router.get('/posts', {
    visibility: visibility.value
  }, {
    preserveScroll: true,
    preserveState: true
  })
}

const changePage = (url) => {
  if (!url) return
  router.visit(url, {
    preserveScroll: true,
    preserveState: true
  })
}

const likePost = (post) => {
  router.post(`/posts/${post.id}/like`, {}, {
    preserveScroll: true,
    preserveState: true,
    only: ['posts']
  })
}

const bookmarkPost = (post) => {
  router.post('/bookmarks', { post_id: post.id }, {
    preserveScroll: true,
    preserveState: true,
    only: ['posts']
  })
}

const submitComment = (postId) => {
  if (!newComment.value.trim()) return
  router.post(`/posts/${postId}/comments`, { body: newComment.value }, {
    preserveScroll: true,
    onSuccess: () => newComment.value = ''
  })
}
</script>

<template>
  <div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-4 gap-2">
      <h2>All Posts</h2>
      <div class="d-flex gap-2 w-75">
        <input type="text" class="form-control" placeholder="Search posts..." v-model="search" @input="filterPosts">
        <select class="form-select" v-model="visibility" @change="applyVisibility">
          <option value="">All</option>
          <option value="public">Public</option>
          <option value="private">Private</option>
        </select>
      </div>
    </div>

    <div v-if="filteredPosts.length">
      <div class="card mb-4" v-for="post in filteredPosts" :key="post.id">
        <div class="card-body">
          <div class="d-flex justify-content-between">
            <div class="d-flex align-items-center">
              <img :src="post.user.profile_picture || defaultProfile" class="rounded-circle me-2" width="40" height="40">
              <strong>{{ post.user.username }}</strong>
            </div>
            <span class="badge bg-secondary text-capitalize">{{ post.visibility }}</span>
          </div>

          <h5 class="mt-3">{{ post.title }}</h5>
          <p>{{ post.content.slice(0, 150) }}...</p>

          <div class="d-flex gap-3 mt-2">
            <button
              class="btn btn-sm"
              :class="post.liked_by_user ? 'btn-primary' : 'btn-outline-primary'"
              @click="likePost(post)"
            >
              {{ post.liked_by_user ? 'Unlike' : 'Like' }}
            </button>

            <button
              class="btn btn-sm"
              :class="post.bookmarked_by_user ? 'btn-success' : 'btn-outline-success'"
              @click="bookmarkPost(post)"
            >
              {{ post.bookmarked_by_user ? 'Remove Bookmark' : 'Bookmark' }}
            </button>
          </div>

          <form class="mt-3" @submit.prevent="submitComment(post.id)">
            <textarea class="form-control mb-2" placeholder="Write a comment..." v-model="newComment"></textarea>
            <button type="submit" class="btn btn-sm btn-outline-secondary">Comment</button>
          </form>
        </div>
      </div>
    </div>

    <div v-else>
      <p>No posts found.</p>
    </div>

    <div class="d-flex justify-content-between mt-4" v-if="props.posts.total > props.posts.per_page">
      <button
        class="btn btn-outline-secondary"
        :disabled="!props.posts.prev_page_url"
        @click="changePage(props.posts.prev_page_url)"
      >
        Previous
      </button>
      <button
        class="btn btn-outline-secondary"
        :disabled="!props.posts.next_page_url"
        @click="changePage(props.posts.next_page_url)"
      >
        Next
      </button>
    </div>
  </div>
</template>

<style scoped>
img.rounded-circle {
  object-fit: cover;
}
</style>
