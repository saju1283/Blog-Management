<template>
  <div class="container d-flex align-items-center justify-content-center min-vh-100 bg-light">
    <div class="col-md-6 col-lg-4">
      <div class="card shadow-sm border-0">
        <div class="card-body p-4">
          <h3 class="text-center mb-4">Register</h3>
          <form @submit.prevent="submit">
            <div class="mb-3">
              <label for="name" class="form-label">Full Name</label>
              <input
                type="text"
                id="name"
                class="form-control"
                v-model="form.name"
                :class="{ 'is-invalid': form.errors.name }"
              />
              <div v-if="form.errors.name" class="invalid-feedback">
                {{ form.errors.name }}
              </div>
            </div>

            <div class="mb-3">
              <label for="username" class="form-label">Username</label>
              <input
                type="text"
                id="username"
                class="form-control"
                v-model="form.username"
                :class="{ 'is-invalid': form.errors.username }"
              />
              <div v-if="form.errors.username" class="invalid-feedback">
                {{ form.errors.username }}
              </div>
            </div>

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

            <div class="mb-3">
              <label for="password_confirmation" class="form-label">Confirm Password</label>
              <input
                type="password"
                id="password_confirmation"
                class="form-control"
                v-model="form.password_confirmation"
                :class="{ 'is-invalid': form.errors.password_confirmation }"
              />
              <div v-if="form.errors.password_confirmation" class="invalid-feedback">
                {{ form.errors.password_confirmation }}
              </div>
            </div>

            <button type="submit" class="btn btn-success w-100">Register</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3'

const form = useForm({
  name: '',
  username: '',
  email: '',
  password: '',
  password_confirmation: ''
})

const submit = () => {
  form.post('/register')
}
</script>
