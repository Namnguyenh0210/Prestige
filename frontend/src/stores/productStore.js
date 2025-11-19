import { defineStore } from 'pinia'
import axios from '../api/axios'

export const useProductStore = defineStore('product', {
  state: () => ({
    products: [],
    collections: [],
    newArrivals: [],
    loading: false,
    error: null
  }),

  actions: {
    async fetchProducts() {
      this.loading = true
      try {
        const response = await axios.get('/products')
        this.products = response.data
      } catch (error) {
        this.error = 'Không thể tải sản phẩm'
        console.error('Error fetching products:', error)
      } finally {
        this.loading = false
      }
    },

    async fetchNewArrivals() {
      this.loading = true
      try {
        const response = await axios.get('/products/new-arrivals')
        this.newArrivals = response.data
      } catch (error) {
        this.error = 'Không thể tải sản phẩm mới'
        console.error('Error fetching new arrivals:', error)
      } finally {
        this.loading = false
      }
    },

    async fetchCollections() {
      this.loading = true
      try {
        const response = await axios.get('/collections')
        this.collections = response.data
      } catch (error) {
        this.error = 'Không thể tải bộ sưu tập'
        console.error('Error fetching collections:', error)
      } finally {
        this.loading = false
      }
    },

    async getProductById(id) {
      const product = this.products.find(p => p.id === id)
      if (product) return product

      try {
        const response = await axios.get(`/products/${id}`)
        return response.data
      } catch (error) {
        console.error('Error fetching product:', error)
        return null
      }
    },

    resetError() {
      this.error = null
    },

    clearProducts() {
      this.products = []
      this.collections = []
      this.newArrivals = []
    }
  },

  getters: {
    productsByCategory: (state) => (category) => {
      return state.products.filter(product => product.category === category)
    },

    featuredProducts: (state) => {
      return state.products.filter(product => product.featured)
    }
  }
})
