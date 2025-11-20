import axiosInstance from './axios'

/**
 * API Service cho Sản phẩm
 */
export const productService = {
  /**
   * Lấy tất cả sản phẩm với bộ lọc
   */
  getAllProducts(params = {}) {
    return axiosInstance.get('/api/products', { params })
  },

  /**
   * Lấy sản phẩm theo giới tính
   * @param {number} gioiTinh - 0: Nam, 1: Nữ, 2: Unisex
   */
  getProductsByGender(gioiTinh) {
    return axiosInstance.get(`/api/products/gender/${gioiTinh}`)
  },

  /**
   * Lấy sản phẩm theo thương hiệu
   */
  getProductsByBrand(maTH) {
    return axiosInstance.get(`/api/products/brand/${maTH}`)
  },

  /**
   * Lấy sản phẩm theo loại
   */
  getProductsByCategory(maLoai) {
    return axiosInstance.get(`/api/products/category/${maLoai}`)
  },

  /**
   * Lấy chi tiết sản phẩm
   */
  getProductDetail(maSP) {
    return axiosInstance.get(`/api/products/${maSP}`)
  },

  /**
   * Lấy tất cả thương hiệu
   */
  getAllBrands() {
    return axiosInstance.get('/api/products/brands')
  },

  /**
   * Lấy tất cả loại sản phẩm
   */
  getAllCategories() {
    return axiosInstance.get('/api/products/categories')
  },

  /**
   * Lọc sản phẩm với nhiều điều kiện
   */
  filterProducts(filters) {
    const params = {}

    if (filters.gioiTinh !== undefined && filters.gioiTinh !== null) {
      params.gioiTinh = filters.gioiTinh
    }
    if (filters.maTH) {
      params.maTH = filters.maTH
    }
    if (filters.maLoai) {
      params.maLoai = filters.maLoai
    }
    if (filters.minPrice) {
      params.minPrice = filters.minPrice
    }
    if (filters.maxPrice) {
      params.maxPrice = filters.maxPrice
    }
    if (filters.keyword) {
      params.keyword = filters.keyword
    }

    return axiosInstance.get('/api/products', { params })
  }
}

export default productService

