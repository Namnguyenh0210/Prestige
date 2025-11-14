<template>
  <div class="min-h-screen flex items-center justify-center bg-gray-50 py-12 px-4">
    <div class="max-w-md w-full space-y-8">
      <div>
        <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
          Đăng nhập
        </h2>
        <p class="mt-2 text-center text-sm text-gray-600">
          Luxury Fashion - E-commerce cao cấp
        </p>
      </div>

      <form class="mt-8 space-y-6" @submit.prevent="handleLogin">
        <!-- Email field -->
        <div>
          <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
          <input
            id="email"
            v-model="formData.email"
            type="email"
            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-primary-500 focus:border-primary-500 sm:text-sm"
            placeholder="your@email.com"
            :disabled="authStore.loading"
          />
          <span v-if="errors.email" class="mt-1 text-sm text-red-600">{{ errors.email }}</span>
        </div>

        <!-- Password field -->
        <div>
          <label for="password" class="block text-sm font-medium text-gray-700">Mật khẩu</label>
          <input
            id="password"
            v-model="formData.password"
            type="password"
            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-primary-500 focus:border-primary-500 sm:text-sm"
            placeholder="Nhập mật khẩu"
            :disabled="authStore.loading"
          />
          <span v-if="errors.password" class="mt-1 text-sm text-red-600">{{ errors.password }}</span>
        </div>

        <!-- General error -->
        <div v-if="authStore.error" class="rounded-md bg-red-50 p-4">
          <p class="text-sm text-red-800">{{ authStore.error }}</p>
        </div>

        <!-- Submit button -->
        <div>
          <button
            type="submit"
            :disabled="authStore.loading"
            class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-primary-600 hover:bg-primary-700 disabled:bg-gray-400 disabled:cursor-not-allowed transition-colors"
          >
            <span v-if="!authStore.loading">Đăng nhập</span>
            <span v-else>Đang đăng nhập...</span>
          </button>
        </div>

        <!-- Register link -->
        <div class="text-center text-sm">
          <span class="text-gray-600">Chưa có tài khoản? </span>
          <router-link to="/register" class="text-primary-600 hover:text-primary-500 font-medium">
            Đăng ký ngay
          </router-link>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/authStore'
import { useCartStore } from '@/stores/cartStore'

const router = useRouter()
const authStore = useAuthStore()
const cartStore = useCartStore()

const formData = reactive({
  email: '',
  password: ''
})

const errors = reactive({
  email: '',
  password: ''
})

function validateForm() {
  errors.email = ''
  errors.password = ''

  if (!formData.email) {
    errors.email = 'Email không được để trống'
    return false
  }
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(formData.email)) {
    errors.email = 'Email không hợp lệ'
    return false
  }
  if (!formData.password) {
    errors.password = 'Mật khẩu không được để trống'
    return false
  }
  if (formData.password.length < 6) {
    errors.password = 'Mật khẩu phải ít nhất 6 ký tự'
    return false
  }

  return true
}

async function handleLogin() {
  if (!validateForm()) {
    return
  }

  const result = await authStore.login(formData.email, formData.password)

  if (result.success) {
    // Đồng bộ giỏ hàng sau khi đăng nhập
    await cartStore.syncCart()
    router.push('/')
  }
}
</script>
