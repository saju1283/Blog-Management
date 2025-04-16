<template>
  <div class="auth-page">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
          <div class="card shadow-sm">
            <div class="card-body p-5">
              <h2 class="text-center mb-4">Register</h2>
              
              <form @submit.prevent="submit">
                <div class="mb-3">
                  <label for="username" class="form-label">Username</label>
                  <input type="text" class="form-control" id="username" v-model="form.username" required>
                  <div v-if="errors.username" class="text-danger">{{ errors.username }}</div>
                </div>
                
                <div class="mb-3">
                  <label for="email" class="form-label">Email</label>
                  <input type="email" class="form-control" id="email" v-model="form.email" required>
                  <div v-if="errors.email" class="text-danger">{{ errors.email }}</div>
                </div>
                
                <div class="mb-3">
                  <label for="password" class="form-label">Password</label>
                  <input type="password" class="form-control" id="password" v-model="form.password" required>
                  <div v-if="errors.password" class="text-danger">{{ errors.password }}</div>
                </div>
                
                <div class="mb-3">
                  <label for="password_confirmation" class="form-label">Confirm Password</label>
                  <input type="password" class="form-control" id="password_confirmation" v-model="form.password_confirmation" required>
                </div>
                
                <div class="mb-3">
                  <label for="profile_pic" class="form-label">Profile Picture (Optional)</label>
                  <input type="file" class="form-control" id="profile_pic" @change="handleFileChange">
                  <div v-if="errors.profile_pic" class="text-danger">{{ errors.profile_pic }}</div>
                  <img v-if="imagePreview" :src="imagePreview" class="img-thumbnail mt-2" style="max-height: 100px;">
                </div>
                
                <div class="d-grid">
                  <button type="submit" class="btn btn-primary" :disabled="form.processing">
                    <span v-if="form.processing" class="spinner-border spinner-border-sm"></span>
                    Register
                  </button>
                </div>
                
                <div class="mt-3 text-center">
                  <Link href="/login" class="text-decoration-none">Already have an account? Login</Link>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3';
import { ref } from 'vue';

const imagePreview = ref(null);

const form = useForm({
  username: '',
  email: '',
  password: '',
  password_confirmation: '',
  profile_pic: null
});

const handleFileChange = (e) => {
  const file = e.target.files[0];
  if (file) {
    form.profile_pic = file;
    const reader = new FileReader();
    reader.onload = (event) => {
      imagePreview.value = event.target.result;
    };
    reader.readAsDataURL(file);
  }
};

const submit = () => {
  form.post('/register');
};
</script>

<style scoped>
.auth-page {
  min-height: 100vh;
  display: flex;
  align-items: center;
  padding: 2rem 0;
}

.card {
  border: none;
  border-radius: 0.5rem;
}
</style>