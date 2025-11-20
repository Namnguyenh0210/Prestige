import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import apiClient from '@/api/axios'
import { useToast } from 'vue-toastification'

export const useAuthStore = defineStore('auth', () => {

  // STATE
  const token = ref(localStorage.getItem('token') || null)
  const user = ref(JSON.parse(localStorage.getItem('user')) || null)

  // GETTERS
  const isAuthenticated = computed(() => !!token.value)

  // ====== 🔥 Load token từ URL sau OAuth2 login ======
  function loadTokenFromUrl() {
    const params = new URLSearchParams(window.location.search)
    const tk = params.get("token")

    if (tk) {
      token.value = tk
      localStorage.setItem("token", tk)
      history.replaceState({}, "", window.location.pathname) // xóa token khỏi URL
      fetchUserProfile()
    }
  }

  // ====== 🔥 Lấy user info từ backend ======
  async function fetchUserProfile() {
    if (!token.value) return
    
    try {
      const response = await apiClient.get("/api/auth/me")
      user.value = response.data
      localStorage.setItem("user", JSON.stringify(user.value))
    } catch (err) {
      console.error("Lỗi lấy thông tin user:", err)
      logout()
    }
  }

  // ====== NORMAL LOGIN ======
  async function login(email, password) {
    const toast = useToast()
    try {
      const response = await apiClient.post('/api/auth/login', { email, password })
      const data = response.data

      if (!data.success || !data.token) {
        toast.error("Đăng nhập thất bại")
        return { success: false }
      }

      token.value = data.token
      localStorage.setItem("token", data.token)

      await fetchUserProfile()
      toast.success("Đăng nhập thành công")

      return { success: true }

    } catch (err) {
      toast.error("Sai email hoặc mật khẩu")
      return { success: false }
    }
  }

  // ====== ĐĂNG XUẤT ======
  function logout() {
    token.value = null
    user.value = null
    localStorage.removeItem("token")
    localStorage.removeItem("user")
  }

  return {
    // state
    token,
    user,

    // getters
    isAuthenticated,

    // actions
    loadTokenFromUrl,
    fetchUserProfile,
    login,
    logout,
  }
})
