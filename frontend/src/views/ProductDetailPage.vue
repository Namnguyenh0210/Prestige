<template>
  <div>
    <!-- Header from HomePage.vue -->
    <header class="sticky top-0 z-50 bg-background-light/95 dark:bg-background-dark/95 backdrop-blur-sm">
      <div class="bg-background-light dark:bg-background-dark">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8">
          <div class="flex h-10 items-center justify-end text-xs text-text-primary-light/80 dark:text-text-primary-dark/80">
            <div class="flex items-center space-x-4">
              <a class="flex items-center gap-1.5 hover:text-primary dark:hover:text-white" href="#">
                <span class="material-symbols-outlined text-base">mail</span>
                <span>rental@rentzy.vn</span>
              </a>
              <span class="text-secondary">|</span>
              <a class="flex items-center gap-1.5 hover:text-primary dark:hover:text-white" href="#">
                <span class="material-symbols-outlined text-base">call</span>
                <span>Hotline: 079 9191940</span>
              </a>
              <span class="hidden sm:inline text-secondary">|</span>
              <a class="hidden sm:flex items-center gap-1.5 hover:text-primary dark:hover:text-white" href="#">
                <span class="material-symbols-outlined text-base">handshake</span>
                <span>Trở thành đối tác</span>
              </a>
              <span class="hidden md:inline text-secondary">|</span>
              <a class="hidden md:flex items-center gap-1.5 hover:text-primary dark:hover:text-white" href="#">
                <span class="material-symbols-outlined text-base">local_shipping</span>
                <span>Theo Dõi Đơn Hàng</span>
              </a>
              <span class="hidden lg:inline text-secondary">|</span>
              <router-link to="/login" class="hidden lg:flex items-center gap-1.5 hover:text-primary dark:hover:text-white">
                <span class="material-symbols-outlined text-base">person</span>
                <span>Đăng Ký / Đăng Nhập</span>
              </router-link>
            </div>
          </div>
        </div>
      </div>
      <div class="border-y border-secondary/50">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8">
          <div class="flex h-24 items-center justify-between gap-4">
            <div class="flex items-center">
              <h1 class="text-3xl font-serif text-text-primary-light dark:text-text-primary-dark">Luxury Fashion</h1>
            </div>
            <nav class="hidden lg:flex items-center gap-6">
              <a class="flex items-center gap-2 text-sm font-medium text-text-primary-light dark:text-text-primary-dark hover:text-black dark:hover:text-white" href="#">
                <span class="material-symbols-outlined">menu</span>
                <span>Danh mục</span>
              </a>
              <a class="text-sm font-medium text-text-primary-light dark:text-text-primary-dark hover:text-black dark:hover:text-white" href="#">Brands</a>
              <a class="text-sm font-medium text-text-primary-light dark:text-text-primary-dark hover:text-black dark:hover:text-white" href="#">Cho Nữ</a>
              <a class="text-sm font-medium text-text-primary-light dark:text-text-primary-dark hover:text-black dark:hover:text-white" href="#">Cho Nam</a>
              <a class="text-sm font-medium text-text-primary-light dark:text-text-primary-dark hover:text-black dark:hover:text-white" href="#">Blog</a>
            </nav>
            <div class="flex flex-1 items-center justify-end gap-2 md:gap-4">
              <div class="hidden md:flex max-w-xs flex-1">
                <form class="flex w-full">
                  <label class="sr-only" for="search-header">Tìm kiếm</label>
                  <input class="w-full border-r-0 border-secondary bg-transparent py-2 pl-4 text-sm focus:border-accent focus:ring-accent" id="search-header" name="search-header" placeholder="Nhập nội dung..." type="search"/>
                  <button class="flex items-center justify-center bg-accent px-4 text-sm font-semibold text-text-primary-light hover:bg-accent/90" type="submit">
                    <span class="material-symbols-outlined text-lg mr-1">search</span>
                    <span>Search</span>
                  </button>
                </form>
              </div>
              <button class="flex h-10 w-10 cursor-pointer items-center justify-center rounded-full hover:bg-black/10 dark:hover:bg-white/10 md:hidden">
                <span class="material-symbols-outlined text-2xl">search</span>
              </button>
              <div class="flex items-center gap-2">
                <button class="flex h-10 w-10 cursor-pointer items-center justify-center rounded-full hover:bg-black/10 dark:hover:bg-white/10">
                  <span class="material-symbols-outlined text-2xl">favorite_border</span>
                </button>
                <a class="flex items-center gap-2 cursor-pointer hover:text-black dark:hover:text-white p-2 rounded-md hover:bg-black/10 dark:hover:bg-white/10" href="#">
                  <span class="material-symbols-outlined text-2xl">shopping_bag</span>
                  <span class="hidden sm:inline text-sm font-medium">Giỏ Hàng</span>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>

    <!-- Product Detail based on chitietsanpham.html -->
    <main class="container mx-auto px-6 py-8">
      <!-- Breadcrumb -->
      <div class="flex flex-wrap gap-2 text-sm mb-8">
        <router-link class="text-text-primary/60 dark:text-background-light/60 hover:text-primary" to="/">Home</router-link>
        <span class="text-text-primary/60 dark:text-background-light/60">/</span>
        <span class="text-text-primary dark:text-background-light font-medium">{{ product?.tenSP || 'Sản phẩm' }}</span>
      </div>
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
        <div class="flex items-start justify-center">
          <div class="w-full aspect-[3/4] max-h-[700px] bg-cover bg-center rounded-xl" :style="{'background-image': 'url(' + displayImage + ')'}"></div>
        </div>
        <div class="flex flex-col gap-6">
          <div>
            <span class="text-sm font-medium tracking-widest uppercase text-text-primary/70 dark:text-background-light/70">{{ product?.tenTH }}</span>
            <h1 class="text-4xl lg:text-5xl font-serif font-bold text-text-primary dark:text-background-light mt-2">{{ product?.tenSP }}</h1>
            <p class="text-2xl mt-4 font-light text-text-primary dark:text-background-light">{{ formatPrice(displayPrice) }}</p>
          </div>
          <div class="border-t border-text-secondary/30 pt-6" v-if="colorOptions.length">
            <label class="text-sm font-bold uppercase tracking-wider text-text-primary dark:text-background-light">Màu sắc: <span class="font-light">{{ selectedColor }}</span></label>
            <div class="flex gap-3 mt-3">
              <button v-for="color in colorOptions" :key="color.name" @click="selectColor(color)" :class="['size-8 rounded-full', { 'ring-2 ring-offset-2 ring-primary dark:ring-accent ring-offset-background-light dark:ring-offset-background-dark': selectedColor === color.name }]" :style="{'background-color': color.hex}" />
            </div>
          </div>
          <div class="border-t border-text-secondary/30 pt-6" v-if="sizeOptions.length">
            <div class="flex justify-between items-center">
              <label class="text-sm font-bold uppercase tracking-wider text-text-primary dark:text-background-light">Size</label>
            </div>
            <div class="flex flex-wrap gap-3 mt-3">
              <button v-for="size in sizeOptions" :key="size.name" @click="selectSize(size)" :class="['px-5 py-2.5 border rounded-lg text-sm hover:border-primary', { 'border-primary bg-primary text-white dark:bg-accent dark:text-primary dark:border-accent': selectedSize === size.name, 'text-text-secondary/50 cursor-not-allowed': !size.available }]" :disabled="!size.available">{{ size.name }}</button>
            </div>
          </div>
          <div class="flex items-center gap-4 mt-4">
            <div class="flex items-center border border-secondary-gray rounded-md">
              <button @click="quantity = Math.max(1, quantity - 1)" class="px-3 py-1 text-lg font-medium">-</button>
              <span class="px-3 py-1 text-sm">{{ quantity }}</span>
              <button @click="quantity++" class="px-3 py-1 text-lg font-medium">+</button>
            </div>
            <button @click="addToCart" class="flex-1 bg-primary text-white h-12 rounded-lg text-sm font-bold tracking-wider hover:opacity-90">Thêm giỏ hàng</button>
            <button @click="buyNow" class="flex-1 border border-primary text-primary h-12 rounded-lg text-sm font-bold tracking-wider hover:bg-primary/5 dark:border-accent dark:text-accent dark:hover:bg-accent/10">Mua ngay</button>
          </div>
          <div class="border-t border-text-secondary/30 pt-6 space-y-4">
            <details class="group" open>
              <summary class="flex justify-between items-center cursor-pointer list-none">
                <span class="text-base font-medium">Mô tả sản phẩm</span>
                <span class="transition-transform duration-300 group-open:rotate-45"><span class="material-symbols-outlined">add</span></span>
              </summary>
              <p class="mt-4 text-sm text-text-primary/80 dark:text-background-light/80 whitespace-pre-line">{{ product?.moTa || 'Đang cập nhật mô tả.' }}</p>
            </details>
          </div>
        </div>
      </div>
      <div class="mt-24" v-if="relatedProducts.length">
        <h2 class="text-3xl font-serif font-bold text-center mb-8">Sản phẩm liên quan</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-8">
          <div v-for="related in relatedProducts" :key="related.maSP" class="group" @click="viewProduct(related.maSP)">
            <div class="relative w-full h-96 bg-cover bg-center rounded-lg overflow-hidden">
              <div class="w-full h-full bg-cover bg-center group-hover:scale-105 transition-transform duration-500" :style="{'background-image': 'url(' + (related.anhChinh || 'https://via.placeholder.com/400x500') + ')'}"></div>
            </div>
            <div class="mt-4 text-center">
              <p class="text-xs uppercase tracking-wider text-text-primary/60 dark:text-background-light/60">{{ related.tenTH }}</p>
              <h3 class="text-lg font-medium mt-1">{{ related.tenSP }}</h3>
              <p class="text-base text-text-primary/70 dark:text-background-light/70 mt-1">{{ formatPrice(related.giaMin) }}</p>
            </div>
          </div>
        </div>
      </div>
    </main>

    <!-- Footer -->
    <footer class="bg-background-light dark:bg-black mt-24 border-t border-text-secondary/20">
      <div class="container mx-auto px-6 py-12">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
          <div>
            <h3 class="text-lg font-bold font-serif tracking-wider">Luxury Fashion</h3>
            <p class="mt-4 text-sm text-text-primary/70 dark:text-background-light/70">Timeless elegance for the modern individual.</p>
          </div>
          <div>
            <h4 class="font-bold tracking-wider uppercase">Shop</h4>
            <ul class="mt-4 space-y-2 text-sm text-text-primary/70 dark:text-background-light/70">
              <li><a class="hover:text-primary" href="#">New Arrivals</a></li>
              <li><a class="hover:text-primary" href="#">Women</a></li>
              <li><a class="hover:text-primary" href="#">Men</a></li>
              <li><a class="hover:text-primary" href="#">Sale</a></li>
            </ul>
          </div>
          <div>
            <h4 class="font-bold tracking-wider uppercase">Support</h4>
            <ul class="mt-4 space-y-2 text-sm text-text-primary/70 dark:text-background-light/70">
              <li><a class="hover:text-primary" href="#">Contact Us</a></li>
              <li><a class="hover:text-primary" href="#">FAQ</a></li>
              <li><a class="hover:text-primary" href="#">Shipping & Returns</a></li>
              <li><a class="hover:text-primary" href="#">Track Order</a></li>
            </ul>
          </div>
          <div>
            <h4 class="font-bold tracking-wider uppercase">Stay Connected</h4>
            <p class="mt-4 text-sm text-text-primary/70 dark:text-background-light/70">Sign up for exclusive offers and updates.</p>
            <form @submit.prevent="subscribe" class="mt-4 flex">
              <input v-model="newsletterEmail" class="w-full rounded-l-lg border-text-secondary/30 focus:ring-primary focus:border-primary text-sm bg-transparent" placeholder="Your Email" type="email"/>
              <button class="bg-primary text-white px-4 rounded-r-lg text-sm font-bold hover:opacity-90">Sign Up</button>
            </form>
          </div>
        </div>
        <div class="mt-12 border-t border-text-secondary/20 pt-8 flex justify-between items-center text-sm text-text-primary/60 dark:text-background-light/60">
          <p>© 2024 Luxury Fashion. All Rights Reserved.</p>
          <div class="flex gap-4">
            <a class="hover:text-primary" href="#">Privacy Policy</a>
            <a class="hover:text-primary" href="#">Terms of Service</a>
          </div>
        </div>
      </div>
    </footer>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useProductStore } from '@/stores/productStore'
import { useCartStore } from '@/stores/cartStore'

const route = useRoute()
const router = useRouter()
const productStore = useProductStore()
const cartStore = useCartStore()

const product = ref(null)
const selectedSize = ref(null)
const selectedColor = ref(null)
const quantity = ref(1)
const relatedProducts = ref([])

const variants = computed(() => product.value?.chiTietList || [])
const sizeOptions = computed(() => {
  const map = new Map()
  variants.value.forEach(v => {
    if (!map.has(v.tenSize)) {
      map.set(v.tenSize, { name: v.tenSize, available: v.soLuongTon > 0 })
    } else if (v.soLuongTon > 0) {
      map.get(v.tenSize).available = true
    }
  })
  return Array.from(map.values())
})
const colorOptions = computed(() => {
  const map = new Map()
  variants.value.forEach(v => {
    if (!map.has(v.tenMau)) {
      map.set(v.tenMau, { name: v.tenMau, hex: v.maHex || '#cccccc' })
    }
  })
  return Array.from(map.values())
})
const selectedVariant = computed(() => variants.value.find(v => v.tenSize === selectedSize.value && v.tenMau === selectedColor.value) || variants.value[0] || null)
const displayPrice = computed(() => selectedVariant.value?.giaBan || product.value?.giaMin || 0)
const displayImage = computed(() => selectedVariant.value?.anhBienThe || product.value?.anhChinh || 'https://via.placeholder.com/800x600')

function formatPrice(val){ return new Intl.NumberFormat('vi-VN',{style:'currency',currency:'VND'}).format(Number(val)||0) }
function selectSize(size){ if(size.available){ selectedSize.value = size.name } }
function selectColor(color){ selectedColor.value = color.name }
async function addToCart(){ if(!selectedVariant.value) return; const res = await cartStore.addToCart({ ...selectedVariant.value, tenSP: product.value.tenSP, giaMin: selectedVariant.value.giaBan }, quantity.value); if(!res.success){ console.error('Thêm giỏ hàng lỗi:', res.message) } }
function buyNow(){ addToCart(); router.push('/cart') }
function viewProduct(id){ router.push(`/products/${id}`) }
async function loadRelated() {
  if (!product.value) return
  await productStore.fetchProductsByGender(product.value.gioiTinh)
  relatedProducts.value = productStore.products.filter(p => p.maSP !== product.value.maSP).slice(0,4)
}

onMounted(async () => {
  const id = route.params.id
  const data = await productStore.fetchProductById(id)
  if(data){
    product.value = data
    if(variants.value.length){ selectedSize.value = variants.value[0].tenSize; selectedColor.value = variants.value[0].tenMau }
    await loadRelated()
  }
})
</script>
<style scoped>
/* minimal overrides */
</style>
