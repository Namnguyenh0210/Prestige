import axios from 'axios'

// Base URL linh hoạt qua biến môi trường Vite
const BASE_URL = import.meta.env.VITE_API_BASE_URL || 'http://localhost:8080'

const apiClient = axios.create({
  baseURL: BASE_URL,
  headers: { 'Content-Type': 'application/json' }
})

apiClient.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token')
    if (token) {
      config.headers.Authorization = `Bearer ${token}`
    }
    return config
  },
  (error) => Promise.reject(error)
)

apiClient.interceptors.response.use(
  (response) => response,
  (error) => {
    // Log chi tiết để debug lỗi không load sản phẩm
    if (!error.response) {
      console.error('[API] Lỗi kết nối tới backend:', {
        url: error.config?.url,
        baseURL: error.config?.baseURL,
        message: error.message
      })
    } else {
      console.error('[API] Lỗi response:', error.response.status, error.response.data)
    }

    if (error.response?.status === 401) {
      localStorage.removeItem('token')
      localStorage.removeItem('user')
      window.location.href = '/login'
    }
    return Promise.reject(error)
  }
)

export default apiClient
