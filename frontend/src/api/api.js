import axiosInstance from './axiosInstance';

// Auth API
export const authApi = {
  register: (data) => axiosInstance.post('/auth/register', data),
  login: (data) => axiosInstance.post('/auth/login', data),
  logout: () => axiosInstance.post('/auth/logout'),
};

// User API
export const userApi = {
  getCurrentUser: () => axiosInstance.get('/users/me'),
};

// Products API
export const productApi = {
  getAll: (params) => axiosInstance.get('/products', { params }),
  getById: (id) => axiosInstance.get(`/products/${id}`),
  create: (data) => axiosInstance.post('/admin/products', data),
  update: (id, data) => axiosInstance.put(`/admin/products/${id}`, data),
  delete: (id) => axiosInstance.delete(`/admin/products/${id}`),
};

// Cart API
export const cartApi = {
  getCart: () => axiosInstance.get('/cart'),
  addToCart: (data) => axiosInstance.post('/cart', data),
  updateCartItem: (id, data) => axiosInstance.put(`/cart/${id}`, data),
  removeFromCart: (id) => axiosInstance.delete(`/cart/${id}`),
};

// Order API
export const orderApi = {
  checkout: (data) => axiosInstance.post('/orders/checkout', data),
  getHistory: () => axiosInstance.get('/orders/history'),
  getById: (id) => axiosInstance.get(`/orders/${id}`),
};

export default {
  authApi,
  userApi,
  productApi,
  cartApi,
  orderApi,
};

