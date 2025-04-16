<template>
  <AppLayout>
    <div class="container py-4">
      <div class="row justify-content-center">
        <div class="col-md-8 text-center mb-5">
          <h1 class="display-5 fw-bold">Welcome to BlogHub</h1>
          <p class="lead">Share your thoughts and discover new ideas</p>
          
          <div class="d-flex justify-content-center gap-3 mt-4">
            <Link v-if="!$page.props.auth.user" href="/register" class="btn btn-primary btn-lg">
              Get Started
            </Link>
            <Link v-if="!$page.props.auth.user" href="/login" class="btn btn-outline-primary btn-lg">
              Login
            </Link>
            <Link v-if="$page.props.auth.user" href="/posts/create" class="btn btn-success btn-lg">
              Create Post
            </Link>
          </div>
        </div>
      </div>

      <!-- Featured Posts Section -->
      <div class="row justify-content-center">
        <div class="col-md-8">
          <h2 class="mb-4">Latest Posts</h2>
          <PostList :posts="$page.props.posts" />
        </div>
      </div>
    </div>
  </AppLayout>
</template>

<script setup>
import { Link } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import PostList from '@/Components/PostList.vue';
</script>