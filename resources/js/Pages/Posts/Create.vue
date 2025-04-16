<template>
  <AppLayout>
    <div class="container py-4">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <div class="card">
            <div class="card-header">
              <h4>{{ form.id ? 'Edit Post' : 'Create New Post' }}</h4>
            </div>
            <div class="card-body">
              <form @submit.prevent="submitForm">
                <div class="mb-3">
                  <label for="title" class="form-label">Title</label>
                  <input type="text" class="form-control" id="title" v-model="form.title">
                  <div v-if="errors.title" class="text-danger">{{ errors.title }}</div>
                </div>
                
                <div class="mb-3">
                  <label for="content" class="form-label">Content</label>
                  <textarea class="form-control" id="content" rows="8" v-model="form.content"></textarea>
                  <div v-if="errors.content" class="text-danger">{{ errors.content }}</div>
                </div>
                
                <div class="mb-3">
                  <label for="image" class="form-label">Image (optional)</label>
                  <input type="file" class="form-control" id="image" @change="handleImageChange">
                  <div v-if="errors.image" class="text-danger">{{ errors.image }}</div>
                  <div class="mt-2">
                    <img v-if="form.imagePreview" :src="form.imagePreview" class="img-thumbnail" style="max-height: 200px;">
                    <img v-else-if="form.image" :src="form.image" class="img-thumbnail" style="max-height: 200px;">
                    <button v-if="form.image || form.imagePreview" type="button" 
                            class="btn btn-sm btn-danger ms-2" @click="removeImage">
                      Remove
                    </button>
                  </div>
                </div>
                
                <div class="mb-3">
                  <label class="form-label">Tags (select up to 5)</label>
                  <div class="d-flex flex-wrap gap-2">
                    <div v-for="tag in tags" :key="tag.id" class="form-check">
                      <input class="form-check-input" type="checkbox" :value="tag.id" :id="`tag-${tag.id}`" 
                            v-model="form.tags" :disabled="form.tags.length >= 5 && !form.tags.includes(tag.id)">
                      <label class="form-check-label" :for="`tag-${tag.id}`">
                        {{ tag.name }}
                      </label>
                    </div>
                  </div>
                  <div v-if="errors.tags" class="text-danger">{{ errors.tags }}</div>
                </div>
                
                <div class="mb-3">
                  <label class="form-label">Visibility</label>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" id="visibility-public" 
                          value="public" v-model="form.visibility">
                    <label class="form-check-label" for="visibility-public">
                      Public (visible to everyone)
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" id="visibility-private" 
                          value="private" v-model="form.visibility">
                    <label class="form-check-label" for="visibility-private">
                      Private (only visible to you)
                    </label>
                  </div>
                  <div v-if="errors.visibility" class="text-danger">{{ errors.visibility }}</div>
                </div>
                
                <div class="d-flex justify-content-between">
                  <Link href="/" class="btn btn-secondary">Cancel</Link>
                  <button type="submit" class="btn btn-primary" :disabled="form.processing">
                    <span v-if="form.processing" class="spinner-border spinner-border-sm"></span>
                    {{ form.id ? 'Update Post' : 'Create Post' }}
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
import { Link, router, useForm } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import { ref } from 'vue';

const props = defineProps({
  post: Object,
  tags: Array,
  errors: Object
});

const form = useForm({
  id: props.post?.id || null,
  title: props.post?.title || '',
  content: props.post?.content || '',
  image: null,
  imagePreview: null,
  tags: props.post?.tags?.map(tag => tag.id) || [],
  visibility: props.post?.visibility || 'public'
});

const handleImageChange = (e) => {
  const file = e.target.files[0];
  if (file) {
    form.image = file;
    const reader = new FileReader();
    reader.onload = (event) => {
      form.imagePreview = event.target.result;
    };
    reader.readAsDataURL(file);
  }
};

const removeImage = () => {
  form.image = null;
  form.imagePreview = null;
};

const submitForm = () => {
  if (form.id) {
    form.put(`/posts/${form.id}`, {
      onFinish: () => form.processing = false,
      preserveScroll: true
    });
  } else {
    form.post('/posts', {
      onFinish: () => form.processing = false,
      preserveScroll: true
    });
  }
};
</script>

<style scoped>
.card {
  border: none;
  box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
}
</style>