<template>
  <div class="min-h-screen bg-gray-50 py-12 px-4">
    <div class="max-w-md w-full mx-auto space-y-8">
      <div>
        <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
          Đăng ký tài khoản
        </h2>
        <p class="mt-2 text-center text-sm text-gray-600">
          Tạo tài khoản Luxury Fashion mới
        </p>
      </div>

      <form class="mt-8 space-y-6" @submit.prevent="handleRegister">
        <!-- Full Name field -->
        <div>
          <label for="fullName" class="block text-sm font-medium text-gray-700">Họ tên</label>
          <input
            id="fullName"
            v-model="formData.fullName"
            type="text"
            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-primary-500 focus:border-primary-500 sm:text-sm"
            placeholder="Nguyễn Văn A"
            :disabled="authStore.loading"
          />
          <span v-if="errors.fullName" class="mt-1 text-sm text-red-600">{{ errors.fullName }}</span>
        </div>

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
            placeholder="Nhập mật khẩu (ít nhất 6 ký tự)"
            :disabled="authStore.loading"
          />
          <span v-if="errors.password" class="mt-1 text-sm text-red-600">{{ errors.password }}</span>
        </div>

        <!-- Confirm Password field -->
        <div>
          <label for="confirmPassword" class="block text-sm font-medium text-gray-700">Xác nhận mật khẩu</label>
          <input
            id="confirmPassword"
            v-model="formData.confirmPassword"
            type="password"
            class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-primary-500 focus:border-primary-500 sm:text-sm"
            placeholder="Nhập lại mật khẩu"
            :disabled="authStore.loading"
          />
          <span v-if="errors.confirmPassword" class="mt-1 text-sm text-red-600">{{ errors.confirmPassword }}</span>
        </div>

        <!-- Error message -->
        <div v-if="authStore.error" class="rounded-md bg-red-50 p-4">
          <p class="text-sm text-red-800">{{ authStore.error }}</p>
        </div>

        <!-- Success message -->
        <div v-if="successMessage" class="rounded-md bg-green-50 p-4">
          <p class="text-sm text-green-800">{{ successMessage }}</p>
        </div>

        <!-- Submit button -->
        <div>
          <button
            type="submit"
            :disabled="authStore.loading"
            class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-primary-600 hover:bg-primary-700 disabled:bg-gray-400 disabled:cursor-not-allowed transition-colors"
          >
            <span v-if="!authStore.loading">Đăng ký</span>
            <span v-else>Đang đăng ký...</span>
          </button>
        </div>

        <!-- Login link -->
        <div class="text-center text-sm">
          <span class="text-gray-600">Đã có tài khoản? </span>
          <router-link to="/login" class="text-primary-600 hover:text-primary-500 font-medium">
            Đăng nhập
          </router-link>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
import { reactive, ref } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/authStore'

const router = useRouter()
const authStore = useAuthStore()

const formData = reactive({
  fullName: '',
  email: '',
  password: '',
  confirmPassword: ''
})

const errors = reactive({
  fullName: '',
  email: '',
  password: '',
  confirmPassword: ''
})

const successMessage = ref('')

function validateForm() {
  errors.fullName = ''
  errors.email = ''
  errors.password = ''
  errors.confirmPassword = ''

  if (!formData.fullName.trim()) {
    errors.fullName = 'Họ tên không được để trống'
    return false
  }

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

  if (!formData.confirmPassword) {
    errors.confirmPassword = 'Vui lòng xác nhận mật khẩu'
    return false
  }
  if (formData.password !== formData.confirmPassword) {
    errors.confirmPassword = 'Mật khẩu xác nhận không khớp'
    return false
  }

  return true
}

async function handleRegister() {
  if (!validateForm()) {
    return
  }

  const result = await authStore.register(
    formData.email,
    formData.password,
    formData.fullName
  )

  if (result.success) {
    successMessage.value = 'Đăng ký thành công! Đang chuyển đến trang đăng nhập...'
    setTimeout(() => {
      router.push('/login')
    }, 2000)
  }
}
</script>
