<template>
  <div class="auth-page">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
          <div class="card shadow-sm">
            <div class="card-body p-5">
              <h2 class="text-center mb-4">Login</h2>
              
              <form @submit.prevent="submit">
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
                
                <div class="mb-3 form-check">
                  <input type="checkbox" class="form-check-input" id="remember" v-model="form.remember">
                  <label class="form-check-label" for="remember">Remember me</label>
                </div>
                
                <div class="d-grid">
                  <button type="submit" class="btn btn-primary" :disabled="form.processing">
                    <span v-if="form.processing" class="spinner-border spinner-border-sm"></span>
                    Login
                  </button>
                </div>
                
                <div class="mt-3 text-center">
                  <Link href="/register" class="text-decoration-none">Don't have an account? Register</Link>
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

const form = useForm({
  email: '',
  password: '',
  remember: false
});

const submit = () => {
  form.post('/login');
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