<template>
  <AppLayout>
    <div class="container py-4">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <div class="card mb-4">
            <div class="card-body text-center">
              <img :src="user.profile_pic" class="rounded-circle mb-3" width="120" height="120">
              <h2>{{ user.username }}</h2>
              <p class="text-muted">{{ user.email }}</p>
              
              <div class="d-flex justify-content-center gap-3">
                <div class="text-center">
                  <div class="fw-bold">{{ user.posts_count }}</div>
                  <div class="text-muted small">Posts</div>
                </div>
                <div class="text-center">
                  <div class="fw-bold">{{ user.comments_count }}</div>
                  <div class="text-muted small">Comments</div>
                </div>
                <div class="text-center">
                  <div class="fw-bold">{{ user.likes_count }}</div>
                  <div class="text-muted small">Likes</div>
                </div>
              </div>
              
              <div class="mt-3">
                <Link href="/profile/edit" class="btn btn-outline-primary">
                  Edit Profile
                </Link>
              </div>
            </div>
          </div>
          
          <h4 class="mb-3">My Posts</h4>
          
          <div v-if="posts.data.length" class="row">
            <div v-for="post in posts.data" :key="post.id" class="col-12 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex justify-content-between align-items-center mb-2">
                    <h5 class="card-title mb-0">
                      <Link :href="`/posts/${post.id}`">{{ post.title }}</Link>
                    </h5>
                    <small class="text-muted">{{ formatDate(post.created_at) }}</small>
                  </div>
                  
                  <p class="card-text">{{ truncateContent(post.content, 150) }}</p>
                  
                  <div class="d-flex justify-content-between align-items-center">
                    <div>
                      <span class="badge bg-secondary me-1" v-for="tag in post.tags" :key="tag.id">
                        {{ tag.name }}
                      </span>
                      <span v-if="post.visibility === 'private'" class="badge bg-warning text-dark">
                        <i class="bi bi-lock-fill"></i> Private
                      </span>
                    </div>
                    <div>
                      <Link :href="`/posts/${post.id}/edit`" class="btn btn-sm btn-outline-secondary me-2">
                        Edit
                      </Link>
                      <button @click="deletePost(post.id)" class="btn btn-sm btn-outline-danger">
                        Delete
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div v-else class="text-center py-5">
            <h5>You haven't created any posts yet</h5>
            <Link href="/posts/create" class="btn btn-primary mt-3">
              Create Your First Post
            </Link>
          </div>
          
          <div v-if="posts.data.length" class="mt-3">
            <nav aria-label="Page navigation">
              <ul class="pagination justify-content-center">
                <li v-for="link in posts.links" :key="link.label" class="page-item" 
                    :class="{ 'active': link.active, 'disabled': !link.url }">
                  <Link v-if="link.url" class="page-link" :href="link.url" v-html="link.label"></Link>
                  <span v-else class="page-link" v-html="link.label"></span>
                </li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </div>
  </AppLayout>
</template>

<script setup>
import { Link, router } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';

const props = defineProps({
  user: Object,
  posts: Object
});

const formatDate = (dateString) => {
  return new Date(dateString).toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'short',
    day: 'numeric'
  });
};

const truncateContent = (content, length) => {
  return content.length > length 
    ? content.substring(0, length) + '...' 
    : content;
};

const deletePost = (postId) => {
  if (confirm('Are you sure you want to delete this post?')) {
    router.delete(`/posts/${postId}`, {
      preserveScroll: true,
      onSuccess: () => router.reload({ only: ['posts'] })
    });
  }
};
</script>

<style scoped>
.card {
  border: none;
  box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
}
</style>