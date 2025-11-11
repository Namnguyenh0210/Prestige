import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import apiClient from '@/api/axios'

export const useAuthStore = defineStore('auth', () => {
  // State
  const user = ref(JSON.parse(localStorage.getItem('user')) || null)
  const token = ref(localStorage.getItem('token') || null)

  // Getters
  const isAuthenticated = computed(() => !!token.value)
  const isAdmin = computed(() => user.value?.roles?.includes('ADMIN') || false)
  const isStaff = computed(() => user.value?.roles?.includes('NHANVIEN') || false)

  // Actions
  async function login(email, password) {
    try {
      const response = await apiClient.post('/auth/login', { email, matKhau: password })
      const data = response.data

      token.value = data.token
      user.value = {
        email: data.email,
        hoTen: data.hoTen,
        roles: data.roles
      }

      localStorage.setItem('token', data.token)
      localStorage.setItem('user', JSON.stringify(user.value))

      return { success: true }
    } catch (error) {
      return {
        success: false,
        message: error.response?.data?.message || 'Đăng nhập thất bại'
      }
    }
  }

  async function register(userData) {
    try {
      await apiClient.post('/auth/register', userData)
      return { success: true }
    } catch (error) {
      return {
        success: false,
        message: error.response?.data?.message || 'Đăng ký thất bại'
      }
    }
  }

  function logout() {
    user.value = null
    token.value = null
    localStorage.removeItem('token')
    localStorage.removeItem('user')
  }

  return {
    user,
    token,
    isAuthenticated,
    isAdmin,
    isStaff,
    login,
    register,
    logout
  }
})

