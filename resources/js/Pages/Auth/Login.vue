<template>
  <div class="container d-flex align-items-center justify-content-center min-vh-100 bg-light">
    <div class="col-md-6 col-lg-4">
      <div class="card shadow-sm border-0">
        <div class="card-body p-4">
          <h3 class="text-center mb-4">Login</h3>
          <form @submit.prevent="submit">
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <input
                type="email"
                id="email"
                class="form-control"
                v-model="form.email"
                :class="{ 'is-invalid': form.errors.email }"
              />
              <div v-if="form.errors.email" class="invalid-feedback">
                {{ form.errors.email }}
              </div>
            </div>

            <div class="mb-3">
              <label for="password" class="form-label">Password</label>
              <input
                type="password"
                id="password"
                class="form-control"
                v-model="form.password"
                :class="{ 'is-invalid': form.errors.password }"
              />
              <div v-if="form.errors.password" class="invalid-feedback">
                {{ form.errors.password }}
              </div>
            </div>

            <button type="submit" class="btn btn-primary w-100">Login</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3'

const form = useForm({
  email: '',
  password: ''
})

const submit = () => {
  form.post('/login')
}
</script>
