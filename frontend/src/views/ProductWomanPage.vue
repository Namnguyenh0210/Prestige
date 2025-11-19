<template>
  <div class="bg-primary-bg font-display text-primary-text dark:text-white/90 dark:bg-background-dark">
    <AppHeader />

    <!-- Hero Section -->
    <div class="w-full h-64 md:h-80 bg-cover bg-center" :style="{ backgroundImage: 'url(' + heroImage + ')' }">
      <div class="w-full h-full flex flex-col justify-center items-center bg-black/30">
        <h1 class="text-white text-4xl md:text-6xl font-bold tracking-tight">New Season Arrivals</h1>
        <p class="text-white/90 mt-4 text-lg">Discover the latest in luxury fashion</p>
      </div>
    </div>

    <main class="px-4 sm:px-10 lg:px-20 py-10 flex-1">
      <div class="max-w-7xl mx-auto">
        <div class="flex flex-wrap justify-between gap-4 py-4 mb-6">
          <h1 class="text-primary-text dark:text-white text-4xl lg:text-5xl font-black leading-tight tracking-tight">Tất cả sản phẩm</h1>
        </div>
        <div class="flex flex-col lg:flex-row gap-12">
          <!-- Sidebar -->
          <aside class="w-full lg:w-[30%] lg:pr-8">
            <div class="sticky top-28 space-y-8">
              <!-- Price -->
              <div class="py-6 border-b border-secondary/50">
                <h3 class="text-lg font-semibold mb-4 text-primary-text dark:text-white">Giá</h3>
                <div class="relative">
                  <input
                      class="w-full h-1 bg-secondary/30 rounded-full appearance-none cursor-pointer range-lg dark:bg-gray-700 accent-primary-text dark:accent-accent"
                      max="3000"
                      min="0"
                      type="range"
                      v-model="priceRange"
                  />
                  <div class="flex justify-between text-sm text-gray-500 dark:text-gray-400 mt-2">
                    <span>$0</span>
                    <span>$1,250</span>
                    <span>$3,000+</span>
                  </div>
                </div>
              </div>

              <!-- Size -->
              <div class="py-6 border-b border-secondary/50">
                <h3 class="text-lg font-semibold mb-4 text-primary-text dark:text-white">Size</h3>
                <div class="grid grid-cols-4 gap-2">
                  <button
                      v-for="size in sizes"
                      :key="size"
                      @click="selectedSize = size"
                      :class="[
                      'border rounded-md py-2 text-center text-sm font-medium hover:border-cta-hover dark:hover:border-accent',
                      selectedSize === size ? 'border-cta-hover dark:border-accent' : 'border-secondary dark:border-gray-600'
                    ]"
                  >
                    {{ size }}
                  </button>
                </div>
              </div>

              <!-- New Products -->
              <div class="py-6 border-b border-secondary/50">
                <h3 class="text-lg font-semibold mb-4 text-primary-text dark:text-white">Sản phẩm mới</h3>
                <div class="space-y-3">
                  <div class="flex items-center">
                    <input
                        class="h-4 w-4 border-secondary text-primary-text focus:ring-accent"
                        id="new-all"
                        name="new_products_filter"
                        type="radio"
                        v-model="newProductsFilter"
                        value="all"
                    />
                    <label class="ml-3 text-sm text-primary-text dark:text-white/90" for="new-all">Tất cả sản phẩm mới</label>
                  </div>
                  <div class="flex items-center">
                    <input
                        class="h-4 w-4 border-secondary text-primary-text focus:ring-accent"
                        id="new-week"
                        name="new_products_filter"
                        type="radio"
                        v-model="newProductsFilter"
                        value="week"
                    />
                    <label class="ml-3 text-sm text-primary-text dark:text-white/90" for="new-week">Theo tuần</label>
                  </div>
                  <div class="flex items-center">
                    <input
                        class="h-4 w-4 border-secondary text-primary-text focus:ring-accent"
                        id="new-month"
                        name="new_products_filter"
                        type="radio"
                        v-model="newProductsFilter"
                        value="month"
                    />
                    <label class="ml-3 text-sm text-primary-text dark:text-white/90" for="new-month">Theo tháng</label>
                  </div>
                </div>
              </div>

              <!-- Promotional -->
              <div class="py-6 border-b border-secondary/50">
                <h3 class="text-lg font-semibold mb-4 text-primary-text dark:text-white">Sản phẩm khuyến mãi</h3>
                <div class="space-y-3">
                  <div class="flex items-center">
                    <input
                        class="h-4 w-4 border-secondary text-primary-text focus:ring-accent"
                        id="promo-hot-sale"
                        name="promotional_products"
                        type="checkbox"
                        v-model="hotSale"
                    />
                    <label class="ml-3 text-sm text-primary-text dark:text-white/90" for="promo-hot-sale">Hot sale</label>
                  </div>
                  <div class="flex items-center">
                    <input
                        class="h-4 w-4 border-secondary text-primary-text focus:ring-accent"
                        id="promo-member-sale"
                        name="promotional_products"
                        type="checkbox"
                        v-model="memberSale"
                    />
                    <label class="ml-3 text-sm text-primary-text dark:text-white/90" for="promo-member-sale">Sale for members</label>
                  </div>
                </div>
              </div>

              <!-- Gender -->
              <div class="py-6">
                <h3 class="text-lg font-semibold mb-4 text-primary-text dark:text-white">Gender</h3>
                <div class="space-y-3">
                  <div class="flex items-center">
                    <input
                        class="h-4 w-4 border-secondary text-primary-text focus:ring-accent"
                        id="gender-nam"
                        name="gender"
                        type="radio"
                        v-model="selectedGender"
                        value="nam"
                    />
                    <label class="ml-3 text-sm text-primary-text dark:text-white/90" for="gender-nam">Nam</label>
                  </div>
                  <div class="flex items-center">
                    <input
                        class="h-4 w-4 border-secondary text-primary-text focus:ring-accent"
                        id="gender-nu"
                        name="gender"
                        type="radio"
                        v-model="selectedGender"
                        value="nu"
                    />
                    <label class="ml-3 text-sm text-primary-text dark:text-white/90" for="gender-nu">Nữ</label>
                  </div>
                </div>
              </div>

              <div class="py-6 pt-0 space-y-4">
                <button class="w-full bg-cta-hover text-primary-bg text-sm font-bold py-2.5 rounded-lg transition-colors duration-300 hover:bg-primary-text/80 dark:bg-accent dark:text-primary-text dark:hover:bg-accent/80">Áp dụng</button>
                <button @click="resetFilters" class="w-full bg-transparent text-primary-text dark:text-white/90 border border-secondary dark:border-gray-600 text-sm font-bold py-2.5 rounded-lg transition-colors duration-300 hover:bg-black/5 dark:hover:bg-white/10">Clear</button>
              </div>
            </div>
          </aside>

          <!-- Products -->
          <div class="w-full lg:w-[70%]">
            <div class="flex justify-between items-center gap-4 py-3 border-b border-secondary/50 mb-8">
              <p class="text-sm text-gray-500 dark:text-gray-400">Hiển thị {{ filteredProducts.length }} sản phẩm</p>
              <div class="relative">
                <select
                    v-model="sortBy"
                    class="appearance-none w-full md:w-auto bg-transparent border border-secondary dark:border-gray-600 text-primary-text dark:text-white text-sm rounded-full py-2 pl-4 pr-10 focus:ring-accent focus:border-accent"
                >
                  <option value="popularity">Xắp xếp: Độ phổ biến</option>
                  <option value="price-low">Xắp xếp: Giá thấp đến cao</option>
                  <option value="price-high">Xắp xếp: Giá cao đến thấp</option>
                </select>
                <span class="material-symbols-outlined absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none text-gray-400">expand_more</span>
              </div>
            </div>

            <div class="grid grid-cols-2 md:grid-cols-3 gap-6 lg:gap-8">
              <div
                  v-for="product in filteredProducts"
                  :key="product.id"
                  class="group flex flex-col gap-3 relative overflow-hidden"
              >
                <div
                    class="w-full bg-center bg-no-repeat aspect-[3/4] bg-cover rounded-lg bg-[#CFCFCF]/30 transition-transform duration-300 group-hover:scale-105"
                    :style="{ backgroundImage: `url(${product.image})` }"
                ></div>
                <div class="flex flex-col flex-1">
                  <p class="text-xs text-gray-500 dark:text-gray-400 uppercase tracking-wider">{{ product.brand }}</p>
                  <h4 class="text-primary-text dark:text-white/90 text-base font-medium leading-normal flex-1">{{ product.name }}</h4>
                  <p class="text-primary-text dark:text-white/90 text-sm font-semibold leading-normal mt-1">{{ product.price }}</p>
                </div>
                <button @click="addToCart(product)" class="mt-3 w-full bg-cta-hover text-primary-bg text-sm font-bold py-2.5 rounded-lg transition-colors duration-300 hover:bg-primary-text/80 dark:bg-accent dark:text-primary-text dark:hover:bg-accent/80">Thêm giỏ hàng</button>
              </div>
            </div>

            <!-- Pagination -->
            <div class="flex justify-center items-center gap-2 mt-12">
              <button @click="currentPage = Math.max(1, currentPage - 1)" class="flex h-10 w-10 items-center justify-center rounded-full text-gray-500 dark:text-gray-400 hover:bg-black/5 dark:hover:bg-white/10">
                <span class="material-symbols-outlined">chevron_left</span>
              </button>
              <button
                  v-for="page in paginatedPages"
                  :key="page"
                  @click="currentPage = page"
                  :class="[
                  'flex h-10 w-10 items-center justify-center rounded-full text-sm font-bold',
                  page === currentPage ? 'bg-cta-hover text-primary-bg dark:bg-accent dark:text-cta-hover' : 'text-gray-500 dark:text-gray-400 hover:bg-black/5 dark:hover:bg-white/10'
                ]"
              >
                {{ page }}
              </button>
              <button @click="currentPage = Math.min(totalPages, currentPage + 1)" class="flex h-10 w-10 items-center justify-center rounded-full text-gray-500 dark:text-gray-400 hover:bg-black/5 dark:hover:bg-white/10">
                <span class="material-symbols-outlined">chevron_right</span>
              </button>
            </div>
          </div>
        </div>
      </div>
    </main>

    <AppFooter />
  </div>
</template>

<script setup>
import { onMounted } from 'vue'
import { useProductWomanLogic } from '../stores/ProductWomanPage'
import AppHeader from '../components/Header.vue'
import AppFooter from '../components/Footer.vue'
import '../assets/css/ProductWomanPage.css'

const {
  heroImage,
  priceRange,
  selectedSize,
  newProductsFilter,
  hotSale,
  memberSale,
  selectedGender,
  sortBy,
  currentPage,
  itemsPerPage,
  sizes,
  products,
  filteredProducts,
  totalPages,
  paginatedPages,
  resetFilters,
  addToCart,
  mount
} = useProductWomanLogic()

onMounted(() => {
  mount()
})
</script>
