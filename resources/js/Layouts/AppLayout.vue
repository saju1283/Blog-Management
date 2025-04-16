<template>
  <div class="app-container">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
      <div class="container">
        <Link href="/" class="navbar-brand">Blog System</Link>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav me-auto">
            <li class="nav-item">
              <Link href="/" class="nav-link">Home</Link>
            </li>
            <li v-if="$page.props.auth.user" class="nav-item">
              <Link href="/posts/create" class="nav-link">Create Post</Link>
            </li>
            <li v-if="$page.props.auth.user" class="nav-item">
              <Link href="/bookmarks" class="nav-link">Bookmarks</Link>
            </li>
          </ul>
          <ul class="navbar-nav">
            <template v-if="$page.props.auth.user">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                  <img :src="$page.props.auth.user.profile_pic" class="rounded-circle me-1" width="30" height="30">
                  {{ $page.props.auth.user.username }}
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                  <li><Link class="dropdown-item" href="/profile">Profile</Link></li>
                  <li><hr class="dropdown-divider"></li>
                  <li>
                    <Link class="dropdown-item" href="/logout" method="post">Logout</Link>
                  </li>
                </ul>
              </li>
            </template>
            <template v-else>
              <li class="nav-item">
                <Link href="/login" class="nav-link">Login</Link>
              </li>
              <li class="nav-item">
                <Link href="/register" class="nav-link">Register</Link>
              </li>
            </template>
          </ul>
        </div>
      </div>
    </nav>

    <main class="container py-4">
      <div v-if="$page.props.flash.success" class="alert alert-success alert-dismissible fade show">
        {{ $page.props.flash.success }}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
      </div>
      <div v-if="$page.props.flash.error" class="alert alert-danger alert-dismissible fade show">
        {{ $page.props.flash.error }}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
      </div>
      
      <slot />
    </main>

    <footer class="bg-light py-3 mt-5">
      <div class="container text-center">
        <p class="mb-0">© 2023 Blog System. All rights reserved.</p>
      </div>
    </footer>
  </div>
</template>

<script setup>
import { Link } from '@inertiajs/vue3';
</script>

<style scoped>
.app-container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

main {
  flex: 1;
}
</style>