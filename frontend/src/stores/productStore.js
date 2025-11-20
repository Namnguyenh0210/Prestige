import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import { productService } from '@/api/productService'
import axios from 'axios'

export const useProductStore = defineStore('product', () => {
  // State
  const products = ref([])
  const brands = ref([])
  const categories = ref([])
  const loading = ref(false)
  const error = ref(null)
  const backendAlive = ref(true)
  // Single product detail state
  const currentProduct = ref(null)

  // Filters
  const filters = ref({
    gioiTinh: null, // 0: Nam, 1: Nữ, 2: Unisex, null: Tất cả
    maTH: null,
    maLoai: null,
    minPrice: null,
    maxPrice: null,
    keyword: ''
  })

  /**
   * Kiểm tra trạng thái backend
   */
  const checkBackendHealth = async () => {
    try {
      await axios.get((import.meta.env.VITE_API_BASE_URL || 'http://localhost:8080') + '/api/products/ping')
      backendAlive.value = true
    } catch (e) {
      backendAlive.value = false
    }
  }

  /**
   * Lấy tất cả sản phẩm
   */
  const fetchAllProducts = async () => {
    loading.value = true
    error.value = null
    await checkBackendHealth()
    if (!backendAlive.value) {
      loading.value = false
      error.value = 'Không kết nối được backend (chưa chạy hoặc sai cổng).'
      products.value = []
      return
    }
    try {
      const response = await productService.getAllProducts()
      if (response.data.success) {
        products.value = response.data.data
      }
    } catch (err) {
      if (err.code === 'ERR_NETWORK') {
        error.value = 'Lỗi mạng: Backend chưa chạy hoặc bị chặn.'
      } else {
        error.value = err.message
      }
      console.error('Error fetching products:', err)
    } finally {
      loading.value = false
    }
  }

  /**
   * Lấy sản phẩm theo giới tính
   */
  const fetchProductsByGender = async (gioiTinh) => {
    loading.value = true
    error.value = null
    await checkBackendHealth()
    if (!backendAlive.value) {
      loading.value = false
      error.value = 'Không kết nối được backend (chưa chạy hoặc sai cổng).'
      products.value = []
      return
    }
    try {
      const response = await productService.getProductsByGender(gioiTinh)
      if (response.data.success) {
        products.value = response.data.data
      }
    } catch (err) {
      error.value = err.code === 'ERR_NETWORK' ? 'Lỗi mạng: Backend chưa chạy hoặc bị chặn.' : err.message
      console.error('Error fetching products by gender:', err)
    } finally {
      loading.value = false
    }
  }

  /**
   * Lọc sản phẩm
   */
  const filterProducts = async (filterParams) => {
    loading.value = true
    error.value = null
    try {
      const response = await productService.filterProducts(filterParams)
      if (response.data.success) {
        products.value = response.data.data
      }
    } catch (err) {
      error.value = err.message
      console.error('Error filtering products:', err)
    } finally {
      loading.value = false
    }
  }

  /**
   * Lấy tất cả thương hiệu
   */
  const fetchBrands = async () => {
    try {
      const response = await productService.getAllBrands()
      if (response.data.success) {
        brands.value = response.data.data
      }
    } catch (err) {
      console.error('Error fetching brands:', err)
    }
  }

  /**
   * Lấy tất cả loại sản phẩm
   */
  const fetchCategories = async () => {
    try {
      const response = await productService.getAllCategories()
      if (response.data.success) {
        categories.value = response.data.data
      }
    } catch (err) {
      console.error('Error fetching categories:', err)
    }
  }

  /**
   * Lấy chi tiết sản phẩm theo mã sản phẩm
   */
  const fetchProductById = async (maSP) => {
    if (!maSP) return null
    loading.value = true
    error.value = null
    try {
      const response = await productService.getProductDetail(maSP)
      if (response.data.success) {
        currentProduct.value = response.data.data
        return currentProduct.value
      }
      return null
    } catch (err) {
      error.value = err.message
      console.error('Error fetching product detail:', err)
      return null
    } finally {
      loading.value = false
    }
  }

  /**
   * Format giá tiền
   */
  const formatPrice = (price) => {
    return new Intl.NumberFormat('vi-VN', {
      style: 'currency',
      currency: 'VND'
    }).format(price)
  }

  /**
   * Reset filters
   */
  const resetFilters = () => {
    filters.value = {
      gioiTinh: null,
      maTH: null,
      maLoai: null,
      minPrice: null,
      maxPrice: null,
      keyword: ''
    }
  }

  return {
    // State
    products,
    brands,
    categories,
    loading,
    error,
    filters,
    backendAlive,
    currentProduct,

    // Actions
    checkBackendHealth,
    fetchAllProducts,
    fetchProductsByGender,
    filterProducts,
    fetchBrands,
    fetchCategories,
    fetchProductById,
    formatPrice,
    resetFilters
  }
})
