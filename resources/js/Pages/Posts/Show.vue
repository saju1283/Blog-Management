<template>
  <AppLayout>
    <div class="container py-4">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <div v-if="post" class="card mb-4">
            <img v-if="post.image" :src="post.image" class="card-img-top" :alt="post.title">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center mb-3">
                <h1 class="card-title mb-0">{{ post.title }}</h1>
                <div v-if="$page.props.auth.user?.id === post.user_id" class="dropdown">
                  <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" 
                          data-bs-toggle="dropdown">
                    <i class="bi bi-three-dots"></i>
                  </button>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <Link class="dropdown-item" :href="`/posts/${post.id}/edit`">
                        <i class="bi bi-pencil me-2"></i> Edit
                      </Link>
                    </li>
                    <li>
                      <hr class="dropdown-divider">
                    </li>
                    <li>
                      <button class="dropdown-item text-danger" @click="deletePost">
                        <i class="bi bi-trash me-2"></i> Delete
                      </button>
                    </li>
                  </ul>
                </div>
              </div>
              
              <div class="d-flex align-items-center mb-3">
                <img :src="post.user.profile_pic" class="rounded-circle me-2" width="40" height="40">
                <div>
                  <Link :href="`/?search=${post.user.username}`" class="fw-bold text-decoration-none">
                    {{ post.user.username }}
                  </Link>
                  <div class="text-muted small">{{ formatDate(post.created_at) }}</div>
                </div>
              </div>
              
              <div class="mb-3">
                <span v-for="tag in post.tags" :key="tag.id" class="badge bg-secondary me-1">
                  {{ tag.name }}
                </span>
                <span v-if="post.visibility === 'private'" class="badge bg-warning text-dark">
                  <i class="bi bi-lock-fill"></i> Private
                </span>
              </div>
              
              <div class="card-text mb-4" v-html="formatContent(post.content)"></div>
              
              <div class="d-flex justify-content-between align-items-center border-top border-bottom py-2 mb-4">
                <button @click="toggleLike(post)" class="btn btn-sm btn-outline-primary">
                  <i :class="`bi ${isLiked(post) ? 'bi-heart-fill text-danger' : 'bi-heart'}`"></i>
                  {{ post.likes.length }} likes
                </button>
                <button v-if="$page.props.auth.user" @click="toggleBookmark(post)" class="btn btn-sm btn-outline-info">
                  <i :class="`bi ${isBookmarked(post) ? 'bi-bookmark-fill' : 'bi-bookmark'}`"></i>
                  {{ isBookmarked(post) ? 'Saved' : 'Save' }}
                </button>
                <div class="text-muted small">
                  {{ post.comments.length }} comments
                </div>
              </div>
              
              <!-- Comment Form -->
              <div v-if="$page.props.auth.user && post.visibility === 'public'" class="mb-4">
                <form @submit.prevent="submitComment">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Write a comment..." 
                           v-model="commentForm.content">
                    <button class="btn btn-primary" type="submit" :disabled="!commentForm.content">
                      Post
                    </button>
                  </div>
                </form>
              </div>
              <div v-else-if="post.visibility === 'private'" class="alert alert-info mb-4">
                This is a private post. Only you can see it.
              </div>
              <div v-else class="alert alert-warning mb-4">
                You need to <Link href="/login">login</Link> to comment on this post.
              </div>
              
              <!-- Comments List -->
              <div v-if="post.comments.length" class="comments">
                <div v-for="comment in post.comments" :key="comment.id" class="comment mb-3">
                  <div class="d-flex">
                    <img :src="comment.user.profile_pic" class="rounded-circle me-2" width="40" height="40">
                    <div class="flex-grow-1">
                      <div class="card p-2">
                        <div class="d-flex justify-content-between align-items-center mb-1">
                          <Link :href="`/?search=${comment.user.username}`" class="fw-bold text-decoration-none">
                            {{ comment.user.username }}
                          </Link>
                          <small class="text-muted">{{ formatDate(comment.created_at) }}</small>
                        </div>
                        <p class="mb-1">{{ comment.content }}</p>
                        <div class="d-flex justify-content-between align-items-center">
                          <button @click="toggleReply(comment.id)" class="btn btn-sm btn-link p-0">
                            Reply
                          </button>
                          <button v-if="canDeleteComment(comment)" 
                                  @click="deleteComment(comment.id)" 
                                  class="btn btn-sm btn-link text-danger p-0">
                            Delete
                          </button>
                        </div>
                      </div>
                      
                      <!-- Reply Form -->
                      <div v-if="replyingTo === comment.id" class="mt-2 ms-4">
                        <form @submit.prevent="submitReply(comment.id)">
                          <div class="input-group">
                            <input type="text" class="form-control" placeholder="Write a reply..." 
                                   v-model="replyForm.content">
                            <button class="btn btn-primary" type="submit" :disabled="!replyForm.content">
                              Post
                            </button>
                            <button class="btn btn-outline-secondary" type="button" @click="cancelReply">
                              Cancel
                            </button>
                          </div>
                        </form>
                      </div>
                      
                      <!-- Replies -->
                      <div v-if="comment.replies?.length" class="replies ms-4 mt-2">
                        <div v-for="reply in comment.replies" :key="reply.id" class="reply mb-2">
                          <div class="d-flex">
                            <img :src="reply.user.profile_pic" class="rounded-circle me-2" width="32" height="32">
                            <div class="flex-grow-1">
                              <div class="card p-2">
                                <div class="d-flex justify-content-between align-items-center mb-1">
                                  <Link :href="`/?search=${reply.user.username}`" class="fw-bold text-decoration-none">
                                    {{ reply.user.username }}
                                  </Link>
                                  <small class="text-muted">{{ formatDate(reply.created_at) }}</small>
                                </div>
                                <p class="mb-1">{{ reply.content }}</p>
                                <div class="text-end">
                                  <button v-if="canDeleteComment(reply)" 
                                          @click="deleteComment(reply.id)" 
                                          class="btn btn-sm btn-link text-danger p-0">
                                    Delete
                                  </button>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div v-else class="text-center py-5">
            <h4>Post not found</h4>
            <Link href="/" class="btn btn-primary mt-3">Back to Home</Link>
          </div>
        </div>
      </div>
    </div>
  </AppLayout>
</template>

<script setup>
import { Link, router, useForm } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import { ref } from 'vue';

const props = defineProps({
  post: Object,
  errors: Object
});

const formatDate = (dateString) => {
  const options = { year: 'numeric', month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit' };
  return new Date(dateString).toLocaleDateString(undefined, options);
};

const formatContent = (content) => {
  return content.replace(/\n/g, '<br>');
};

const isLiked = (post) => {
  if (!props.$page.props.auth.user) return false;
  return post.likes.some(like => like.user_id === props.$page.props.auth.user.id);
};

const isBookmarked = (post) => {
  if (!props.$page.props.auth.user) return false;
  return post.bookmarks.some(b => b.user_id === props.$page.props.auth.user.id);
};

const canDeleteComment = (comment) => {
  if (!props.$page.props.auth.user) return false;
  return props.$page.props.auth.user.id === comment.user_id || 
         props.$page.props.auth.user.id === props.post.user_id;
};

const toggleLike = (post) => {
  if (!props.$page.props.auth.user) {
    router.visit('/login');
    return;
  }
  
  router.post(`/posts/${post.id}/like`, {}, {
    preserveScroll: true,
    preserveState: true
  });
};

const toggleBookmark = (post) => {
  router.post(`/posts/${post.id}/bookmark`, {}, {
    preserveScroll: true,
    preserveState: true
  });
};

const deletePost = () => {
  if (confirm('Are you sure you want to delete this post?')) {
    router.delete(`/posts/${props.post.id}`, {
      onSuccess: () => router.visit('/'),
    });
  }
};

const commentForm = useForm({
  content: ''
});

const submitComment = () => {
  commentForm.post(`/posts/${props.post.id}/comments`, {
    preserveScroll: true,
    onSuccess: () => commentForm.reset(),
  });
};

const replyingTo = ref(null);
const replyForm = useForm({
  content: ''
});

const toggleReply = (commentId) => {
  replyingTo.value = replyingTo.value === commentId ? null : commentId;
};

const cancelReply = () => {
  replyingTo.value = null;
  replyForm.reset();
};

const submitReply = (parentId) => {
  replyForm.post(`/posts/${props.post.id}/comments`, {
    preserveScroll: true,
    data: { parent_id: parentId },
    onSuccess: () => {
      replyForm.reset();
      replyingTo.value = null;
    }
  });
};

const deleteComment = (commentId) => {
  if (confirm('Are you sure you want to delete this comment?')) {
    router.delete(`/comments/${commentId}`, {
      preserveScroll: true,
    });
  }
};
</script>

<style scoped>
.comment .card {
  background-color: #f8f9fa;
  border-radius: 0.5rem;
}

.reply .card {
  background-color: #f1f1f1;
  border-radius: 0.5rem;
}

.comments {
  max-height: 500px;
  overflow-y: auto;
}
</style>