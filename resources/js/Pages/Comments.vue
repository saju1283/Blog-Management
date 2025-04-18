<template>
  <div class="container py-4">
    <div class="col-md-10 offset-md-1">
      <h3 class="mb-4">Comments</h3>

      <div v-if="comments.length">
        <div v-for="comment in comments" :key="comment.id" class="mb-3">
          <div class="border p-3 rounded">
            <strong>{{ comment.user.username }}</strong>
            <p class="mb-1">{{ comment.body }}</p>

            <div class="d-flex gap-2">
              <button class="btn btn-sm btn-outline-secondary" @click="toggleReply(comment.id)">Reply</button>
              <button
                v-if="comment.user_id === userId"
                class="btn btn-sm btn-outline-danger"
                @click="deleteComment(comment.id)"
              >
                Delete
              </button>
            </div>

            <div v-if="activeReply === comment.id" class="mt-2">
              <textarea v-model="replyText" rows="2" class="form-control mb-2" placeholder="Write a reply..."></textarea>
              <button class="btn btn-sm btn-primary" @click="submitReply(comment.id)">Post Reply</button>
            </div>
          </div>

          <div class="ms-4 mt-2" v-for="reply in comment.replies" :key="reply.id">
            <div class="border p-2 rounded bg-light">
              <strong>{{ reply.user.username }}</strong>
              <p class="mb-1">{{ reply.body }}</p>
              <button
                v-if="reply.user_id === userId"
                class="btn btn-sm btn-outline-danger"
                @click="deleteComment(reply.id)"
              >
                Delete
              </button>
            </div>
          </div>
        </div>
      </div>
      <div v-else>
        <p>No comments yet.</p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useForm } from '@inertiajs/vue3'
import { defineProps } from 'vue'

const props = defineProps({
  comments: Array,
  postId: Number,
  userId: Number
})

const replyText = ref('')
const activeReply = ref(null)

function toggleReply(commentId) {
  activeReply.value = activeReply.value === commentId ? null : commentId
}

function submitReply(parentId) {
  if (!replyText.value.trim()) return

  const form = useForm({
    body: replyText.value,
    post_id: props.postId,
    parent_id: parentId
  })

  form.post(`/posts/${props.postId}/comments`, {
    onSuccess: () => {
      replyText.value = ''
      activeReply.value = null
    }
  })
}

function deleteComment(id) {
  if (confirm('Are you sure you want to delete this comment?')) {
    useForm().delete(`/comments/${id}`)
  }
}
</script>
