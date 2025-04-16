<template>
  <AppLayout>
    <div class="container py-4">
      <div class="row mb-4">
        <div class="col-md-8 mx-auto">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search posts..." 
                   v-model="search" @keyup.enter="searchPosts">
            <button class="btn btn-primary" type="button" @click="searchPosts">
              <i class="bi bi-search"></i> Search
            </button>
          </div>
        </div>
      </div>

      <div v-if="$page.props.auth.user" class="row mb-4">
        <div class="col-md-8 mx-auto">
          <Link href="/posts/create" class="btn btn-success">
            <i class="bi bi-plus-circle"></i> Create New Post
          </Link>
        </div>
      </div>

      <div v-if="posts.data.length" class="row">
        <div v-for="post in posts.data" :key="post.id" class="col-md-8 mx-auto mb-4">
          <div class="card hover-shadow">
            <img v-if="post.image" :src="post.image" class="card-img-top" :alt="post.title">
            <div class="card-body">
              <div class="d-flex justify-content-between align-items-center mb-2">
                <h5 class="card-title mb-0">
                  <Link :href="`/posts/${post.id}`">{{ post.title }}</Link>
                </h5>
                <small class="text-muted">Posted by 
                  <Link :href="`/?search=${post.user.username}`">{{ post.user.username }}</Link>
                </small>
              </div>
              
              <div class="mb-2">
                <span v-for="tag in post.tags" :key="tag.id" class="badge bg-secondary me-1">
                  {{ tag.name }}
                </span>
              </div>
              
              <p class="card-text">{{ truncateContent(post.content, 200) }}</p>
              
              <div class="d-flex justify-content-between align-items-center">
                <div>
                  <button @click="toggleLike(post)" class="btn btn-sm btn-outline-primary me-2">
                    <i :class="`bi ${isLiked(post) ? 'bi-heart-fill text-danger' : 'bi-heart'}`"></i>
                    {{ post.likes.length }}
                  </button>
                  <Link :href="`/posts/${post.id}`" class="btn btn-sm btn-outline-secondary me-2">
                    <i class="bi bi-chat"></i> {{ post.comments.length }} comments
                  </Link>
                  <button v-if="$page.props.auth.user" @click="toggleBookmark(post)" class="btn btn-sm btn-outline-info">
                    <i :class="`bi ${isBookmarked(post) ? 'bi-bookmark-fill' : 'bi-bookmark'}`"></i>
                  </button>
                </div>
                <small class="text-muted">{{ formatDate(post.created_at) }}</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col-md-8 mx-auto">
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

      <div v-else class="text-center py-5">
        <h4>No posts found</h4>
        <p v-if="search">Try a different search term</p>
        <Link v-if="$page.props.auth.user" href="/posts/create" class="btn btn-primary mt-3">
          Create your first post
        </Link>
      </div>
    </div>
  </AppLayout>
</template>

<script setup>
import { Link, router } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import { ref, computed } from 'vue';

const props = defineProps({
  posts: Object,
  search: String
});

const search = ref(props.search);

const searchPosts = () => {
  router.get('/', { search: search.value });
};

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

const isLiked = (post) => {
  if (!props.$page.props.auth.user) return false;
  return post.likes.some(like => like.user_id === props.$page.props.auth.user.id);
};

const isBookmarked = (post) => {
  if (!props.$page.props.auth.user) return false;
  return post.bookmarks.some(b => b.user_id === props.$page.props.auth.user.id);
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
</script>

<style scoped>
.card {
  transition: transform 0.2s;
}

.card:hover {
  transform: translateY(-2px);
}
</style>