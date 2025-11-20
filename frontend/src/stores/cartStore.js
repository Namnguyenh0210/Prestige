import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import apiClient from '@/api/axios'
import { useAuthStore } from './authStore'

export const useCartStore = defineStore('cart', () => {
  // State
  const items = ref([])
  const loading = ref(false)

  // Getters
  const totalItems = computed(() => {
    return items.value.reduce((sum, item) => sum + item.soLuong, 0)
  })

  const totalPrice = computed(() => {
    return items.value.reduce((sum, item) => sum + (item.giaBan * item.soLuong), 0)
  })

  // Actions
  async function fetchCart() {
    const authStore = useAuthStore()
    if (!authStore.isAuthenticated) {
      items.value = JSON.parse(localStorage.getItem('cart')) || []
      return
    }
    try {
      loading.value = true
      const response = await apiClient.get('/api/cart')
      if (response.data.success) {
        items.value = response.data.data
      }
    } catch (error) {
      console.error('Lỗi khi lấy giỏ hàng:', error)
    } finally {
      loading.value = false
    }
  }

  async function addToCart(product, quantity = 1) {
    const authStore = useAuthStore()
    const maBienThe = product.maBienThe || product.maBienThe === 0 ? product.maBienThe : (product.chiTietList && product.chiTietList.length > 0 ? product.chiTietList[0].maBienThe : null)
    if (!maBienThe) {
      return { success: false, message: 'Không xác định được biến thể sản phẩm' }
    }
    if (!authStore.isAuthenticated) {
      const existingItem = items.value.find(item => item.maBienThe === maBienThe)
      if (existingItem) existingItem.soLuong += quantity
      else items.value.push({ maBienThe, tenSP: product.tenSP, giaBan: product.giaMin, soLuong: quantity })
      localStorage.setItem('cart', JSON.stringify(items.value))
      return { success: true }
    }
    try {
      await apiClient.post('/api/cart', { maBienThe, soLuong: quantity })
      await fetchCart()
      return { success: true }
    } catch (error) {
      return { success: false, message: error.response?.data?.message || 'Thêm vào giỏ hàng thất bại' }
    }
  }

  async function updateQuantity(maBienThe, quantity) {
    const authStore = useAuthStore()
    if (!authStore.isAuthenticated) {
      const item = items.value.find(i => i.maBienThe === maBienThe)
      if (item) {
        item.soLuong = quantity
        localStorage.setItem('cart', JSON.stringify(items.value))
      }
      return
    }
    try {
      await apiClient.put(`/api/cart/${maBienThe}`, { soLuong: quantity })
      await fetchCart()
    } catch (error) {
      console.error('Lỗi cập nhật số lượng:', error)
    }
  }

  async function removeFromCart(maBienThe) {
    const authStore = useAuthStore()
    if (!authStore.isAuthenticated) {
      items.value = items.value.filter(item => item.maBienThe !== maBienThe)
      localStorage.setItem('cart', JSON.stringify(items.value))
      return
    }
    try {
      await apiClient.delete(`/api/cart/${maBienThe}`)
      await fetchCart()
    } catch (error) {
      console.error('Lỗi xóa khỏi giỏ hàng:', error)
    }
  }

  async function syncCart() {
    // Đồng bộ giỏ hàng từ localStorage lên server khi đăng nhập
    const localCart = JSON.parse(localStorage.getItem('cart')) || []

    if (localCart.length > 0) {
      for (const item of localCart) {
        await addToCart(item, item.soLuong)
      }
      localStorage.removeItem('cart')
    }

    await fetchCart()
  }

  function clearCart() {
    items.value = []
    localStorage.removeItem('cart')
  }

  async function checkout(maDiaChiGiao = 1, maHinhThucTT = 1) {
    const authStore = useAuthStore()
    if (!authStore.isAuthenticated) {
      return { success: false, message: 'Cần đăng nhập để thanh toán' }
    }
    try {
      const response = await apiClient.post('/api/cart/checkout', { maDiaChiGiao, maHinhThucTT })
      if (response.data.success) {
        clearCart()
        return { success: true, maDH: response.data.data }
      }
      return { success: false, message: response.data.message }
    } catch (error) {
      return { success: false, message: error.response?.data?.message || 'Checkout thất bại' }
    }
  }

  return {
    items,
    loading,
    totalItems,
    totalPrice,
    fetchCart,
    addToCart,
    updateQuantity,
    removeFromCart,
    syncCart,
    clearCart,
    checkout,
  }
})
