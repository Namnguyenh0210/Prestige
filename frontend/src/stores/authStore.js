import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import { authApi } from '@/api/api'

export const useAuthStore = defineStore('auth', () => {
  // State
  const user = ref(JSON.parse(localStorage.getItem('user')) || null)
  const token = ref(localStorage.getItem('token') || null)
  const loading = ref(false)
  const error = ref(null)

  // Getters
  const isAuthenticated = computed(() => !!token.value)
  const isAdmin = computed(() => user.value?.roles?.includes('ADMIN') || false)
  const isCustomer = computed(() => user.value?.roles?.includes('KHACHHANG') || false)

  // Actions
  async function login(email, password) {
    loading.value = true
    error.value = null
    try {
      const response = await authApi.login({ email, password })
      const { success, message, data } = response.data

      if (!success) {
        error.value = message
        return { success: false, message }
      }

      token.value = data.token
      user.value = data.user

      localStorage.setItem('token', data.token)
      localStorage.setItem('user', JSON.stringify(data.user))

      return { success: true, message }
    } catch (err) {
      const message = err.response?.data?.message || 'Đăng nhập thất bại'
      error.value = message
      return { success: false, message }
    } finally {
      loading.value = false
    }
  }

  async function register(email, password, fullName) {
    loading.value = true
    error.value = null
    try {
      const response = await authApi.register({ email, password, fullName })
      const { success, message, data } = response.data

      if (!success) {
        error.value = message
        return { success: false, message }
      }

      return { success: true, message, data }
    } catch (err) {
      const message = err.response?.data?.message || 'Đăng ký thất bại'
      error.value = message
      return { success: false, message }
    } finally {
      loading.value = false
    }
  }

  async function logout() {
    try {
      await authApi.logout()
    } catch (err) {
      console.error('Logout error:', err)
    } finally {
      user.value = null
      token.value = null
      localStorage.removeItem('token')
      localStorage.removeItem('user')
    }
  }

  return {
    user,
    token,
    loading,
    error,
    isAuthenticated,
    isAdmin,
    isCustomer,
    login,
    register,
    logout
  }
})
