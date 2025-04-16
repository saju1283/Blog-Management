<template>
  <AppLayout>
    <div class="container py-4">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <div class="card">
            <div class="card-header">
              <h4>Edit Profile</h4>
            </div>
            <div class="card-body">
              <form @submit.prevent="submitForm">
                <div class="mb-3">
                  <label for="username" class="form-label">Username</label>
                  <input type="text" class="form-control" id="username" v-model="form.username">
                  <div v-if="errors.username" class="text-danger">{{ errors.username }}</div>
                </div>
                
                <div class="mb-3">
                  <label for="email" class="form-label">Email</label>
                  <input type="email" class="form-control" id="email" v-model="form.email">
                  <div v-if="errors.email" class="text-danger">{{ errors.email }}</div>
                </div>
                
                <div class="mb-3">
                  <label for="profile_pic" class="form-label">Profile Picture</label>
                  <input type="file" class="form-control" id="profile_pic" @change="handleFileChange">
                  <div v-if="errors.profile_pic" class="text-danger">{{ errors.profile_pic }}</div>
                  <div class="mt-2">
                    <img v-if="imagePreview" :src="imagePreview" class="img-thumbnail" style="max-height: 150px;">
                    <img v-else-if="user.profile_pic" :src="user.profile_pic" class="img-thumbnail" style="max-height: 150px;">
                    <button v-if="imagePreview || user.profile_pic" 
                            type="button" 
                            class="btn btn-sm btn-danger ms-2" 
                            @click="removeProfilePic">
                      Remove
                    </button>
                  </div>
                </div>
                
                <div class="mb-3">
                  <label for="current_password" class="form-label">Current Password (required for changes)</label>
                  <input type="password" class="form-control" id="current_password" v-model="form.current_password">
                  <div v-if="errors.current_password" class="text-danger">{{ errors.current_password }}</div>
                </div>
                
                <div class="mb-3">
                  <label for="password" class="form-label">New Password (leave blank to keep current)</label>
                  <input type="password" class="form-control" id="password" v-model="form.password">
                  <div v-if="errors.password" class="text-danger">{{ errors.password }}</div>
                </div>
                
                <div class="mb-3">
                  <label for="password_confirmation" class="form-label">Confirm New Password</label>
                  <input type="password" class="form-control" id="password_confirmation" v-model="form.password_confirmation">
                </div>
                
                <div class="d-flex justify-content-between">
                  <Link href="/profile" class="btn btn-secondary">Cancel</Link>
                  <button type="submit" class="btn btn-primary" :disabled="form.processing">
                    <span v-if="form.processing" class="spinner-border spinner-border-sm"></span>
                    Update Profile
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </AppLayout>
</template>

<script setup>
import { Link, useForm } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import { ref } from 'vue';

const props = defineProps({
  user: Object,
  errors: Object
});

const imagePreview = ref(null);

const form = useForm({
  username: props.user.username,
  email: props.user.email,
  profile_pic: null,
  current_password: '',
  password: '',
  password_confirmation: '',
  remove_profile_pic: false
});

const handleFileChange = (e) => {
  const file = e.target.files[0];
  if (file) {
    form.profile_pic = file;
    form.remove_profile_pic = false;
    const reader = new FileReader();
    reader.onload = (event) => {
      imagePreview.value = event.target.result;
    };
    reader.readAsDataURL(file);
  }
};

const removeProfilePic = () => {
  form.profile_pic = null;
  form.remove_profile_pic = true;
  imagePreview.value = null;
};

const submitForm = () => {
  form.post('/profile', {
    preserveScroll: true,
    onSuccess: () => {
      // Reset password fields after successful update
      form.current_password = '';
      form.password = '';
      form.password_confirmation = '';
    }
  });
};
</script>

<style scoped>
.card {
  border: none;
  box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
}

.img-thumbnail {
  border-radius: 50%;
}
</style>