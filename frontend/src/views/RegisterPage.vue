<template>
  <div class="min-h-screen bg-gray-50 py-12 px-4">
    <div class="max-w-md w-full mx-auto space-y-8">
      <div>
        <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
          Đăng ký tài khoản
        </h2>
      </div>
      <form class="mt-8 space-y-6" @submit.prevent="handleRegister">
        <div class="rounded-md shadow-sm space-y-4">
          <div>
            <label for="hoTen" class="block text-sm font-medium text-gray-700">Họ tên</label>
            <input
              id="hoTen"
              v-model="formData.hoTen"
              type="text"
              required
              class="mt-1 appearance-none relative block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-primary-500 focus:border-primary-500"
            />
          </div>
          <div>
            <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
            <input
              id="email"
              v-model="formData.email"
              type="email"
              required
              class="mt-1 appearance-none relative block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-primary-500 focus:border-primary-500"
            />
          </div>
          <div>
            <label for="soDienThoai" class="block text-sm font-medium text-gray-700">Số điện thoại</label>
            <input
              id="soDienThoai"
              v-model="formData.soDienThoai"
              type="tel"
              required
              class="mt-1 appearance-none relative block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-primary-500 focus:border-primary-500"
            />
          </div>
          <div>
            <label for="matKhau" class="block text-sm font-medium text-gray-700">Mật khẩu</label>
            <input
              id="matKhau"
              v-model="formData.matKhau"
              type="password"
              required
              class="mt-1 appearance-none relative block w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-primary-500 focus:border-primary-500"
            />
          </div>
        </div>

        <div v-if="error" class="text-red-600 text-sm text-center">
          {{ error }}
        </div>

        <div v-if="success" class="text-green-600 text-sm text-center">
          Đăng ký thành công! Đang chuyển đến trang đăng nhập...
        </div>

        <div>
          <button
            type="submit"
            class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-primary-600 hover:bg-primary-700"
          >
            Đăng ký
          </button>
        </div>

        <div class="text-center">
          <router-link to="/login" class="text-primary-600 hover:text-primary-500">
            Đã có tài khoản? Đăng nhập
          </router-link>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/authStore'

const router = useRouter()
const authStore = useAuthStore()

const formData = ref({
  hoTen: '',
  email: '',
  soDienThoai: '',
  matKhau: ''
})

const error = ref('')
const success = ref(false)

async function handleRegister() {
  error.value = ''
  success.value = false

  const result = await authStore.register(formData.value)

  if (result.success) {
    success.value = true
    setTimeout(() => {
      router.push('/login')
    }, 2000)
  } else {
    error.value = result.message
  }
}
</script>

