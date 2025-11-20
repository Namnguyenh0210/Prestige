import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import apiClient from '@/api/axios'
import { useToast } from 'vue-toastification'

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
    const toast = useToast()
    console.log('[authStore.login] Bắt đầu đăng nhập', { email })
    try {
      const response = await apiClient.post('/api/auth/login', { email, password })
      const data = response.data
      console.log('[authStore.login] Response data:', data)

      // Kiểm tra tính hợp lệ của phản hồi
      if (data?.success !== true) {
        const msg = data?.message || 'Phản hồi không thành công từ server'
        toast.error(`Đăng nhập thất bại: ${msg}`)
        return { success: false, message: msg, status: response.status, raw: data }
      }
      if (!data.token) {
        toast.error('Thiếu token trong phản hồi đăng nhập')
        return { success: false, message: 'Thiếu token', status: response.status, raw: data }
      }
      if (!data.user) {
        toast.error('Thiếu thông tin người dùng trong phản hồi đăng nhập')
        return { success: false, message: 'Thiếu user', status: response.status, raw: data }
      }

      token.value = data.token
      user.value = data.user

      localStorage.setItem('token', data.token)
      localStorage.setItem('user', JSON.stringify(user.value))
      console.log('[authStore.login] Lưu token & user vào localStorage thành công')
      toast.success('Đăng nhập thành công')

      return { success: true, raw: data }
    } catch (error) {
      const status = error.response?.status
      const serverMsg = error.response?.data?.message
      let reason = 'Đăng nhập thất bại'
      if (status === 401) reason = 'Sai email hoặc mật khẩu'
      else if (status === 500) reason = 'Lỗi máy chủ (500)'
      else if (!status) reason = 'Không kết nối được tới server'
      const fullMsg = serverMsg ? `${reason}: ${serverMsg}` : reason
      console.warn('[authStore.login] Đăng nhập lỗi:', status, error.response?.data)
      useToast().error(fullMsg)
      return { success: false, message: fullMsg, status, raw: error.response?.data }
    }
  }

  async function register(userData) {
    try {
      const payload = {
        email: userData.email,
        password: userData.matKhau,
        fullName: userData.hoTen,
        phone: userData.soDienThoai || undefined,
        address: userData.diaChi || undefined
      }
      const response = await apiClient.post('/api/auth/register', payload)

      return { success: response.data.success }
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
