<template>
  <div class="bg-primary-bg font-display text-primary-text dark:text-white/90 dark:bg-background-dark">
    <AppHeader />

    <!-- Hero Section -->
    <div class="w-full h-64 md:h-80 bg-cover bg-center" :style="{ backgroundImage: 'url(' + heroImage + ')' }">
      <div class="w-full h-full flex flex-col justify-center items-center bg-black/30">
        <h1 class="text-white text-4xl md:text-6xl font-bold tracking-tight">Women's Collection</h1>
        <p class="text-white/90 mt-4 text-lg">Discover the latest in luxury fashion for women</p>
      </div>
    </div>

    <main class="px-4 sm:px-10 lg:px-20 py-10 flex-1">
      <div class="max-w-7xl mx-auto">
        <div class="flex flex-wrap justify-between gap-4 py-4 mb-6">
          <h1 class="text-primary-text dark:text-white text-4xl lg:text-5xl font-black leading-tight tracking-tight">Sản phẩm Nữ</h1>
        </div>
        <div class="flex flex-col lg:flex-row gap-12">
          <!-- Sidebar -->
          <aside class="w-full lg:w-[30%] lg:pr-8">
            <div class="sticky top-28 space-y-8">
              <!-- Brand Filter -->
              <div class="py-6 border-b border-secondary/50">
                <h3 class="text-lg font-semibold mb-4 text-primary-text dark:text-white">Thương hiệu</h3>
                <div class="space-y-3">
                  <div class="flex items-center">
                    <input
                        class="h-4 w-4 border-secondary text-primary-text focus:ring-accent"
                        id="brand-all"
                        type="radio"
                        v-model="selectedBrand"
                        :value="null"
                    />
                    <label class="ml-3 text-sm text-primary-text dark:text-white/90" for="brand-all">Tất cả thương hiệu</label>
                  </div>
                  <div v-for="brand in brands" :key="brand.maTH" class="flex items-center">
                    <input
                        class="h-4 w-4 border-secondary text-primary-text focus:ring-accent"
                        :id="`brand-${brand.maTH}`"
                        type="radio"
                        v-model="selectedBrand"
                        :value="brand.maTH"
                    />
                    <label class="ml-3 text-sm text-primary-text dark:text-white/90" :for="`brand-${brand.maTH}`">
                      {{ brand.tenTH }}
                    </label>
                  </div>
                </div>
              </div>

              <!-- Category Filter -->
              <div class="py-6 border-b border-secondary/50">
                <h3 class="text-lg font-semibold mb-4 text-primary-text dark:text-white">Loại sản phẩm</h3>
                <div class="space-y-3">
                  <div class="flex items-center">
                    <input
                        class="h-4 w-4 border-secondary text-primary-text focus:ring-accent"
                        id="cat-all"
                        type="radio"
                        v-model="selectedCategory"
                        :value="null"
                    />
                    <label class="ml-3 text-sm text-primary-text dark:text-white/90" for="cat-all">Tất cả</label>
                  </div>
                  <div v-for="cat in categories" :key="cat.maLoai" class="flex items-center">
                    <input
                        class="h-4 w-4 border-secondary text-primary-text focus:ring-accent"
                        :id="`cat-${cat.maLoai}`"
                        type="radio"
                        v-model="selectedCategory"
                        :value="cat.maLoai"
                    />
                    <label class="ml-3 text-sm text-primary-text dark:text-white/90" :for="`cat-${cat.maLoai}`">
                      {{ cat.tenLoai }}
                    </label>
                  </div>
                </div>
              </div>

              <!-- Price -->
              <div class="py-6 border-b border-secondary/50">
                <h3 class="text-lg font-semibold mb-4 text-primary-text dark:text-white">Giá</h3>
                <div class="relative">
                  <input
                      class="w-full h-1 bg-secondary/30 rounded-full appearance-none cursor-pointer range-lg dark:bg-gray-700 accent-primary-text dark:accent-accent"
                      max="50000000"
                      min="0"
                      type="range"
                      v-model="priceRange"
                      step="1000000"
                  />
                  <div class="flex justify-between text-sm text-gray-500 dark:text-gray-400 mt-2">
                    <span>0đ</span>
                    <span>{{ formatPrice(priceRange) }}</span>
                    <span>50tr+</span>
                  </div>
                </div>
              </div>

              <div class="py-6 pt-0 space-y-4">
                <button @click="applyFilters" class="w-full bg-cta-hover text-primary-bg text-sm font-bold py-2.5 rounded-lg transition-colors duration-300 hover:bg-primary-text/80 dark:bg-accent dark:text-primary-text dark:hover:bg-accent/80">Áp dụng</button>
                <button @click="resetFilters" class="w-full bg-transparent text-primary-text dark:text-white/90 border border-secondary dark:border-gray-600 text-sm font-bold py-2.5 rounded-lg transition-colors duration-300 hover:bg-black/5 dark:hover:bg-white/10">Xóa bộ lọc</button>
              </div>
            </div>
          </aside>

          <!-- Products -->
          <div class="w-full lg:w-[70%]">
            <div v-if="loading" class="text-center py-12">
              <p class="text-gray-500">Đang tải sản phẩm...</p>
            </div>

            <div v-else>
              <div class="flex justify-between items-center gap-4 py-3 border-b border-secondary/50 mb-8">
                <p class="text-sm text-gray-500 dark:text-gray-400">Hiển thị {{ filteredProducts.length }} sản phẩm</p>
                <div class="relative">
                  <select
                      v-model="sortBy"
                      @change="sortProducts"
                      class="appearance-none w-full md:w-auto bg-transparent border border-secondary dark:border-gray-600 text-primary-text dark:text-white text-sm rounded-full py-2 pl-4 pr-10 focus:ring-accent focus:border-accent"
                  >
                    <option value="default">Sắp xếp: Mặc định</option>
                    <option value="price-low">Sắp xếp: Giá thấp đến cao</option>
                    <option value="price-high">Sắp xếp: Giá cao đến thấp</option>
                    <option value="name-asc">Sắp xếp: Tên A-Z</option>
                    <option value="name-desc">Sắp xếp: Tên Z-A</option>
                  </select>
                  <span class="material-symbols-outlined absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none text-gray-400">expand_more</span>
                </div>
              </div>

              <div v-if="filteredProducts.length === 0" class="text-center py-12">
                <p class="text-gray-500">Không tìm thấy sản phẩm nào.</p>
              </div>

              <div v-else class="grid grid-cols-2 md:grid-cols-3 gap-6 lg:gap-8">
                <div
                    v-for="product in paginatedProducts"
                    :key="product.maSP"
                    class="group flex flex-col gap-3 relative overflow-hidden cursor-pointer"
                    @click="goToProductDetail(product.maSP)"
                >
                  <div
                      class="w-full bg-center bg-no-repeat aspect-[3/4] bg-cover rounded-lg bg-[#CFCFCF]/30 transition-transform duration-300 group-hover:scale-105"
                      :style="{ backgroundImage: `url(${product.anhChinh || 'https://via.placeholder.com/400x500'})` }"
                  ></div>
                  <div class="flex flex-col flex-1">
                    <p class="text-xs text-gray-500 dark:text-gray-400 uppercase tracking-wider">{{ product.tenTH }}</p>
                    <h4 class="text-primary-text dark:text-white/90 text-base font-medium leading-normal flex-1">{{ product.tenSP }}</h4>
                    <p class="text-primary-text dark:text-white/90 text-sm font-semibold leading-normal mt-1">
                      {{ formatPrice(product.giaMin) }}
                      <span v-if="product.giaMin !== product.giaMax"> - {{ formatPrice(product.giaMax) }}</span>
                    </p>
                  </div>
                  <button @click.stop="addToCart(product)" class="mt-3 w-full bg-cta-hover text-primary-bg text-sm font-bold py-2.5 rounded-lg transition-colors duration-300 hover:bg-primary-text/80 dark:bg-accent dark:text-primary-text dark:hover:bg-accent/80">Thêm giỏ hàng</button>
                </div>
              </div>

              <!-- Pagination -->
              <div v-if="totalPages > 1" class="flex justify-center items-center gap-2 mt-12">
                <button @click="currentPage = Math.max(1, currentPage - 1)"
                        :disabled="currentPage === 1"
                        class="flex h-10 w-10 items-center justify-center rounded-full text-gray-500 dark:text-gray-400 hover:bg-black/5 dark:hover:bg-white/10 disabled:opacity-50">
                  <span class="material-symbols-outlined">chevron_left</span>
                </button>
                <button
                    v-for="page in visiblePages"
                    :key="page"
                    @click="currentPage = page"
                    :class="[
                    'flex h-10 w-10 items-center justify-center rounded-full text-sm font-bold',
                    page === currentPage ? 'bg-cta-hover text-primary-bg dark:bg-accent dark:text-cta-hover' : 'text-gray-500 dark:text-gray-400 hover:bg-black/5 dark:hover:bg-white/10'
                  ]"
                >
                  {{ page }}
                </button>
                <button @click="currentPage = Math.min(totalPages, currentPage + 1)"
                        :disabled="currentPage === totalPages"
                        class="flex h-10 w-10 items-center justify-center rounded-full text-gray-500 dark:text-gray-400 hover:bg-black/5 dark:hover:bg-white/10 disabled:opacity-50">
                  <span class="material-symbols-outlined">chevron_right</span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>

    <AppFooter />
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { useProductStore } from '@/stores/productStore'
import { useCartStore } from '@/stores/cartStore'
import AppHeader from '../components/Header.vue'
import AppFooter from '../components/Footer.vue'
import '../assets/css/ProductWomanPage.css'

const router = useRouter()
const productStore = useProductStore()
const cartStore = useCartStore()

// State
const heroImage = ref('https://via.placeholder.com/1920x1080?text=Women+Collection')
const selectedBrand = ref(null)
const selectedCategory = ref(null)
const priceRange = ref(50000000)
const sortBy = ref('default')
const currentPage = ref(1)
const itemsPerPage = ref(9)

// Computed
const products = computed(() => productStore.products)
const brands = computed(() => productStore.brands)
const categories = computed(() => productStore.categories)
const loading = computed(() => productStore.loading)

const filteredProducts = computed(() => {
  return products.value
})

const sortedProducts = computed(() => {
  let sorted = [...filteredProducts.value]

  switch (sortBy.value) {
    case 'price-low':
      sorted.sort((a, b) => a.giaMin - b.giaMin)
      break
    case 'price-high':
      sorted.sort((a, b) => b.giaMin - a.giaMin)
      break
    case 'name-asc':
      sorted.sort((a, b) => a.tenSP.localeCompare(b.tenSP))
      break
    case 'name-desc':
      sorted.sort((a, b) => b.tenSP.localeCompare(a.tenSP))
      break
  }

  return sorted
})

const totalPages = computed(() => {
  return Math.ceil(sortedProducts.value.length / itemsPerPage.value)
})

const paginatedProducts = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage.value
  const end = start + itemsPerPage.value
  return sortedProducts.value.slice(start, end)
})

const visiblePages = computed(() => {
  const pages = []
  const maxVisible = 5

  if (totalPages.value <= maxVisible) {
    for (let i = 1; i <= totalPages.value; i++) {
      pages.push(i)
    }
  } else {
    pages.push(1)

    if (currentPage.value > 3) {
      pages.push('...')
    }

    const start = Math.max(2, currentPage.value - 1)
    const end = Math.min(totalPages.value - 1, currentPage.value + 1)

    for (let i = start; i <= end; i++) {
      pages.push(i)
    }

    if (currentPage.value < totalPages.value - 2) {
      pages.push('...')
    }

    pages.push(totalPages.value)
  }

  return pages.filter((p, i, arr) => p !== '...' || arr[i - 1] !== '...')
})

// Methods
const formatPrice = (price) => {
  return new Intl.NumberFormat('vi-VN', {
    style: 'currency',
    currency: 'VND'
  }).format(price)
}

const applyFilters = async () => {
  currentPage.value = 1

  const filterParams = {
    gioiTinh: 1, // Nữ = 1
    maTH: selectedBrand.value,
    maLoai: selectedCategory.value,
    maxPrice: priceRange.value
  }

  await productStore.filterProducts(filterParams)
}

const resetFilters = async () => {
  selectedBrand.value = null
  selectedCategory.value = null
  priceRange.value = 50000000
  sortBy.value = 'default'
  currentPage.value = 1

  // Load lại sản phẩm nữ
  await productStore.fetchProductsByGender(1)
}

const sortProducts = () => {
  currentPage.value = 1
}

const goToProductDetail = (maSP) => {
  router.push(`/products/${maSP}`)
}

const addToCart = async (product) => {
  const res = await cartStore.addToCart(product, 1)
  if (!res.success) {
    console.error('Thêm giỏ hàng lỗi:', res.message)
  }
}

// Lifecycle
onMounted(async () => {
  // Load sản phẩm nữ (gioiTinh = 1)
  await productStore.fetchProductsByGender(1)
  await productStore.fetchBrands()
  await productStore.fetchCategories()
})
</script>

<style scoped>
/* Custom range slider styles */
input[type="range"]::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 16px;
  height: 16px;
  background: #111111;
  border-radius: 50%;
  cursor: pointer;
  border: 2px solid #FAFAFA;
}

input[type="range"]::-moz-range-thumb {
  width: 16px;
  height: 16px;
  background: #111111;
  border-radius: 50%;
  cursor: pointer;
  border: 2px solid #FAFAFA;
}
</style>
