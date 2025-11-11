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
      // Nếu chưa đăng nhập, lấy giỏ hàng từ localStorage
      items.value = JSON.parse(localStorage.getItem('cart')) || []
      return
    }

    try {
      loading.value = true
      const response = await apiClient.get('/cart')
      items.value = response.data
    } catch (error) {
      console.error('Lỗi khi lấy giỏ hàng:', error)
    } finally {
      loading.value = false
    }
  }

  async function addToCart(product, quantity = 1) {
    const authStore = useAuthStore()

    if (!authStore.isAuthenticated) {
      // Chưa đăng nhập - Lưu vào localStorage
      const existingItem = items.value.find(item => item.maBienThe === product.maBienThe)

      if (existingItem) {
        existingItem.soLuong += quantity
      } else {
        items.value.push({ ...product, soLuong: quantity })
      }

      localStorage.setItem('cart', JSON.stringify(items.value))
      return { success: true }
    }

    // Đã đăng nhập - Gọi API
    try {
      await apiClient.post('/cart', {
        maBienThe: product.maBienThe,
        soLuong: quantity
      })
      await fetchCart()
      return { success: true }
    } catch (error) {
      return {
        success: false,
        message: error.response?.data?.message || 'Thêm vào giỏ hàng thất bại'
      }
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
      await apiClient.put(`/cart/${maBienThe}`, { soLuong: quantity })
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
      await apiClient.delete(`/cart/${maBienThe}`)
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
    clearCart
  }
})

