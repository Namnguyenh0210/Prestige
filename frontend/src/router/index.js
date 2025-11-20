import { createRouter, createWebHistory } from 'vue-router'
import { useAuthStore } from '@/stores/authStore'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: () => import('@/views/HomePage.vue')
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('@/views/LoginPage.vue')
    },
    {
      path: '/register',
      name: 'register',
      component: () => import('@/views/Register.vue')
    },
    {
      path: '/product-brand',
      name: 'products-brands',
      component: () => import('@/views/BrandPage.vue')
    },
    {
      path: '/product-man',
      name: 'products-man-brands',
      component: () => import('@/views/ProductManPage.vue')
    },
    {
      path: '/product-woman',
      name: 'products-woman-brands',
      component: () => import('@/views/ProductWomanPage.vue')
    },
    {
      path: '/product-blog',
      name: 'products-blogs',
      component: () => import('@/views/BlogPage.vue')
    },
    {
      path: '/products/:id',
      name: 'product-detail',
      component: () => import('@/views/ProductDetailPage.vue')
    },
    {
      path: '/cart',
      name: 'cart',
      component: () => import('@/views/CartPage.vue')
    },
    {
      path: '/checkout',
      name: 'checkout',
      component: () => import('@/views/CheckoutPage.vue'),
      meta: { requiresAuth: true }
    },
    {
      path: '/orders',
      name: 'orders',
      component: () => import('@/views/OrderHistoryPage.vue'),
      meta: { requiresAuth: true }
    },
    {
      path: '/admin',
      name: 'admin',
      component: () => import('@/views/admin/AdminDashboard.vue'),
      meta: { requiresAuth: true, requiresAdmin: true }
    },
    {
      path: '/products',
      name: 'products-all',
      component: () => import('@/views/BrandPage.vue') // trang tổng hợp
    }
  ]
})

// Navigation guard
router.beforeEach((to, from, next) => {
  const authStore = useAuthStore()

  // Nếu đã đăng nhập mà cố vào trang login -> về home
  if (to.name === 'login' && authStore.isAuthenticated) {
    return next('/')
  }

  if (to.meta.requiresAuth && !authStore.isAuthenticated) {
    return next('/login')
  }

  if (to.meta.requiresAdmin && !authStore.isAdmin) {
    return next('/')
  }

  next()
})

export default router
