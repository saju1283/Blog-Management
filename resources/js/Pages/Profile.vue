<template>
  <div class="container py-4">
    <div class="col-md-8 offset-md-2">
      <div class="card shadow-sm">
        <div class="card-body">
          <h3 class="mb-4">My Profile</h3>
          <div class="d-flex align-items-center mb-4">
            <img :src="user.profile_picture || defaultProfile" class="rounded-circle me-3" width="80" height="80" />
            <div>
              <h5 class="mb-0">{{ user.name }}</h5>
              <small class="text-muted">@{{ user.username }}</small>
            </div>
          </div>

          <form @submit.prevent="submit">
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <input type="email" id="email" class="form-control" v-model="form.email" readonly />
            </div>

            <div class="mb-3">
              <label for="profile_picture" class="form-label">Update Profile Picture</label>
              <input type="file" id="profile_picture" class="form-control" @change="handleProfilePicture" />
            </div>

            <button type="submit" class="btn btn-primary">Update Profile</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3'
import { defineProps } from 'vue'

const props = defineProps({
  user: Object
})

const defaultProfile = '/images/default.png'

const form = useForm({
  email: props.user.email,
  profile_picture: null
})

const handleProfilePicture = (e) => {
  form.profile_picture = e.target.files[0]
}

const submit = () => {
  form.post('/profile/update') // Add backend route to handle update
}

import DashboardLayout from '@/Layouts/DashboardLayout.vue'
defineOptions({ layout: DashboardLayout })
</script>

<style scoped>
img.rounded-circle {
  object-fit: cover;
}
</style>
