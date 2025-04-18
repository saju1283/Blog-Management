<template>
  <div class="d-flex">
    <!-- Sidebar -->
    <div class="bg-dark text-white p-3 vh-100" style="width: 240px;">
      <h4 class="mb-4">Dashboard</h4>
      <ul class="nav flex-column">
        <li class="nav-item mb-2"><a href="/dashboard" class="nav-link text-white">Home</a></li>
        <li class="nav-item mb-2"><a href="/posts" class="nav-link text-white">All Posts</a></li>
        <li class="nav-item mb-2"><a href="/posts/create" class="nav-link text-white">Create Post</a></li>
        <li class="nav-item mb-2"><a href="/bookmarks" class="nav-link text-white">Bookmarks</a></li>
        <li class="nav-item mb-2"><a href="/profile" class="nav-link text-white">Profile</a></li>
        <li class="nav-item mt-4">
          <button @click="logout" class="btn btn-danger w-100">Logout</button>
        </li>
      </ul>
    </div>

    <!-- Main Content -->
    <div class="flex-grow-1 p-4">
      <slot />
    </div>
  </div>
</template>

<script setup>
import { router } from '@inertiajs/vue3'

const logout = () => {
  router.post('/logout')
}
</script>

<style scoped>
.nav-link:hover {
  background-color: #495057;
  border-radius: 4px;
}
</style>
