<template>
  <div class="container py-4">
    <div class="col-md-10 offset-md-1">
      <div class="card shadow-sm mb-4">
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-2">
            <div class="d-flex align-items-center">
              <img :src="post.user.profile_picture || defaultProfile" class="rounded-circle me-2" width="40" height="40">
              <strong>{{ post.user.username }}</strong>
            </div>
            <span class="badge bg-secondary">{{ post.visibility }}</span>
          </div>

          <h3>{{ post.title }}</h3>
          <img v-if="post.image" :src="post.image" class="img-fluid rounded my-3" />
          <p>{{ post.content }}</p>

          <div class="d-flex gap-3 mt-3">
            <button class="btn btn-outline-primary btn-sm">Like</button>
            <button class="btn btn-outline-success btn-sm">Bookmark</button>
          </div>
        </div>
      </div>

      <div class="card shadow-sm">
        <div class="card-body">
          <h5>Comments</h5>
          <div v-if="comments.length">
            <div class="border-bottom py-2" v-for="comment in comments" :key="comment.id">
              <strong>{{ comment.user.username }}</strong>
              <p class="mb-1">{{ comment.body }}</p>
            </div>
          </div>
          <div v-else>
            <p>No comments yet.</p>
          </div>

          <form @submit.prevent="submitComment" class="mt-3">
            <div class="mb-2">
              <textarea
                v-model="newComment"
                class="form-control"
                rows="3"
                placeholder="Add a comment..."
              ></textarea>
            </div>
            <button type="submit" class="btn btn-primary btn-sm">Post Comment</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useForm } from '@inertiajs/vue3'
import { defineProps } from 'vue'

const props = defineProps({
  post: Object,
  comments: Array
})

const defaultProfile = '/images/default.png'
const newComment = ref('')

const submitComment = () => {
  if (!newComment.value.trim()) return

  const form = useForm({
    body: newComment.value,
    post_id: props.post.id
  })

  form.post(`/posts/${props.post.id}/comments`, {
    onSuccess: () => newComment.value = ''
  })
}
</script>

<style scoped>
img.rounded-circle {
  object-fit: cover;
}
</style>
