<script setup>
import { useForm, router } from '@inertiajs/vue3'

const form = useForm({
  title: '',
  content: '',
  tags: '',
  visibility: 'Public',
  image: null
})

const handleImageUpload = (e) => {
  form.image = e.target.files[0]
}

const submit = () => {
  form.post('/posts') // or route('posts.store') if route helper is available
}
</script>

<template>
  <div class="container py-4">
    <div class="col-md-8 offset-md-2">
      <div class="card shadow-sm">
        <div class="card-body">
          <h3 class="mb-4">Create New Post</h3>
          <form @submit.prevent="submit">
            <div class="mb-3">
              <label for="title" class="form-label">Title</label>
              <input
                type="text"
                id="title"
                class="form-control"
                v-model="form.title"
                :class="{ 'is-invalid': form.errors.title }"
              />
              <div v-if="form.errors.title" class="invalid-feedback">
                {{ form.errors.title }}
              </div>
            </div>

            <div class="mb-3">
              <label for="content" class="form-label">Content</label>
              <textarea
                id="content"
                rows="6"
                class="form-control"
                v-model="form.content"
                :class="{ 'is-invalid': form.errors.content }"
              ></textarea>
              <div v-if="form.errors.content" class="invalid-feedback">
                {{ form.errors.content }}
              </div>
            </div>

            <div class="mb-3">
              <label for="tags" class="form-label">Tags (comma-separated)</label>
              <input
                type="text"
                id="tags"
                class="form-control"
                v-model="form.tags"
                :class="{ 'is-invalid': form.errors.tags }"
              />
              <div v-if="form.errors.tags" class="invalid-feedback">
                {{ form.errors.tags }}
              </div>
            </div>

            <div class="mb-3">
              <label for="image" class="form-label">Upload Image</label>
              <input
                type="file"
                id="image"
                class="form-control"
                @change="handleImageUpload"
              />
            </div>

            <div class="mb-3">
              <label class="form-label">Visibility</label>
              <select class="form-select" v-model="form.visibility">
                <option value="Public">Public</option>
                <option value="Private">Private</option>
              </select>
            </div>

            <button type="submit" class="btn btn-primary w-100">Publish Post</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
