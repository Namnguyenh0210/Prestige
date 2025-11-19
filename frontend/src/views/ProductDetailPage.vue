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
        <a class="text-text-primary/60 dark:text-background-light/60 hover:text-primary" href="#">Home</a>
        <span class="text-text-primary/60 dark:text-background-light/60">/</span>
        <a class="text-text-primary/60 dark:text-background-light/60 hover:text-primary" href="#">Women</a>
        <span class="text-text-primary/60 dark:text-background-light/60">/</span>
        <a class="text-text-primary/60 dark:text-background-light/60 hover:text-primary" href="#">Dresses</a>
        <span class="text-text-primary/60 dark:text-background-light/60">/</span>
        <span class="text-text-primary dark:text-background-light font-medium">{{ product.name }}</span>
      </div>

      <!-- Product Grid -->
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
        <!-- Product Image -->
        <div class="flex items-start justify-center">
          <div class="w-full aspect-[3/4] max-h-[700px] bg-cover bg-center rounded-xl" :style="{ backgroundImage: `url(${product.image})` }"></div>
        </div>

        <!-- Product Info -->
        <div class="flex flex-col gap-6">
          <div>
            <a class="text-sm font-medium tracking-widest uppercase text-text-primary/70 dark:text-background-light/70 hover:text-primary" href="#">{{ product.brand }}</a>
            <h1 class="text-4xl lg:text-5xl font-serif font-bold text-text-primary dark:text-background-light mt-2">{{ product.name }}</h1>
            <p class="text-2xl mt-4 font-light text-text-primary dark:text-background-light">{{ formatPrice(product.price) }}</p>
          </div>

          <!-- Color Picker -->
          <div class="border-t border-text-secondary/30 pt-6">
            <label class="text-sm font-bold uppercase tracking-wider text-text-primary dark:text-background-light">Color: <span class="font-light">{{ selectedColor }}</span></label>
            <div class="flex gap-3 mt-3">
              <button
                  v-for="color in colors"
                  :key="color.hex"
                  @click="selectColor(color)"
                  :class="['size-8 rounded-full', { 'ring-2 ring-offset-2 ring-primary dark:ring-accent ring-offset-background-light dark:ring-offset-background-dark': selectedColor === color.name }]"
                  :style="{ backgroundColor: color.hex }"
              ></button>
            </div>
          </div>

          <!-- Size Picker -->
          <div class="border-t border-text-secondary/30 pt-6">
            <div class="flex justify-between items-center">
              <label class="text-sm font-bold uppercase tracking-wider text-text-primary dark:text-background-light">Size</label>
              <a class="text-sm underline text-text-primary/70 dark:text-background-light/70 hover:text-primary" href="#">Size Guide</a>
            </div>
            <div class="flex flex-wrap gap-3 mt-3">
              <button
                  v-for="size in sizes"
                  :key="size"
                  @click="selectSize(size)"
                  :class="[
                  'px-5 py-2.5 border rounded-lg text-sm hover:border-primary',
                  {
                    'border-primary bg-primary text-white dark:bg-accent dark:text-primary dark:border-accent': selectedSize === size,
                    'text-text-secondary/50 cursor-not-allowed': !size.available
                  }
                ]"
                  :disabled="!size.available"
              >{{ size.name }}</button>
            </div>
          </div>

          <!-- Action Buttons -->
          <div class="flex flex-col gap-4 mt-4">
            <button @click="addToCart" class="w-full bg-primary text-white h-12 rounded-lg text-sm font-bold tracking-wider hover:opacity-90">Thêm giỏ hàng</button>
            <button @click="buyNow" class="w-full border border-primary text-primary h-12 rounded-lg text-sm font-bold tracking-wider hover:bg-primary/5 dark:border-accent dark:text-accent dark:hover:bg-accent/10">Mua ngay</button>
          </div>

          <!-- Product Description -->
          <div class="border-t border-text-secondary/30 pt-6 space-y-4">
            <details class="group">
              <summary class="flex justify-between items-center cursor-pointer list-none">
                <span class="text-base font-medium">Product Description</span>
                <span class="transition-transform duration-300 group-open:rotate-45">
                  <span class="material-symbols-outlined">add</span>
                </span>
              </summary>
              <p class="mt-4 text-sm text-text-primary/80 dark:text-background-light/80">{{ product.description }}</p>
            </details>
            <div class="border-t border-text-secondary/30"></div>
            <details class="group">
              <summary class="flex justify-between items-center cursor-pointer list-none pt-4">
                <span class="text-base font-medium">Sizing & Fit</span>
                <span class="transition-transform duration-300 group-open:rotate-45">
                  <span class="material-symbols-outlined">add</span>
                </span>
              </summary>
              <ul class="mt-4 text-sm text-text-primary/80 dark:text-background-light/80 list-disc pl-5 space-y-1">
                <li v-for="fit in product.fit" :key="fit">{{ fit }}</li>
              </ul>
            </details>
          </div>
        </div>
      </div>

      <!-- Related Products -->
      <div class="mt-24">
        <h2 class="text-3xl font-serif font-bold text-center mb-8">Sản phẩm liên quan</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-8">
          <div v-for="related in relatedProducts" :key="related.id" class="group" @click="viewProduct(related.id)">
            <div class="relative w-full h-96 bg-cover bg-center rounded-lg overflow-hidden">
              <div class="w-full h-full bg-cover bg-center group-hover:scale-105 transition-transform duration-500" :style="{ backgroundImage: `url(${related.image})` }"></div>
              <div class="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-50 transition-all duration-300 flex items-center justify-center">
                <button class="text-white bg-primary bg-opacity-80 px-4 py-2 rounded-lg text-sm font-bold opacity-0 group-hover:opacity-100 transition-opacity duration-300">Xem chi tiết sản phẩm</button>
              </div>
            </div>
            <div class="mt-4 text-center">
              <p class="text-xs uppercase tracking-wider text-text-primary/60 dark:text-background-light/60">{{ related.brand }}</p>
              <h3 class="text-lg font-medium mt-1">{{ related.name }}</h3>
              <p class="text-base text-text-primary/70 dark:text-background-light/70 mt-1">{{ formatPrice(related.price) }}</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Sale Products -->
      <div class="mt-24">
        <h2 class="text-3xl font-serif font-bold text-center mb-8">Gợi ý sản phẩm sale</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-8">
          <div v-for="sale in saleProducts" :key="sale.id" class="group" @click="viewProduct(sale.id)">
            <div class="w-full h-96 bg-cover bg-center rounded-lg overflow-hidden relative">
              <div class="absolute top-3 left-3 bg-accent text-primary text-xs font-bold uppercase px-3 py-1 rounded-full">Sale</div>
              <div class="w-full h-full bg-cover bg-center group-hover:scale-105 transition-transform duration-500" :style="{ backgroundImage: `url(${sale.image})` }"></div>
              <div class="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-50 transition-all duration-300 flex items-center justify-center">
                <button class="text-white bg-primary bg-opacity-80 px-4 py-2 rounded-lg text-sm font-bold opacity-0 group-hover:opacity-100 transition-opacity duration-300">Xem chi tiết sản phẩm</button>
              </div>
            </div>
            <div class="mt-4 text-center">
              <p class="text-xs uppercase tracking-wider text-text-primary/60 dark:text-background-light/60">{{ sale.brand }}</p>
              <h3 class="text-lg font-medium mt-1">{{ sale.name }}</h3>
              <p class="text-base text-text-primary/70 dark:text-background-light/70 mt-1">
                <span class="line-through text-text-secondary">{{ formatPrice(sale.originalPrice) }}</span>
                <span class="text-accent font-bold ml-2">{{ formatPrice(sale.price) }}</span>
              </p>
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
import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useProductStore } from '../stores/productStore'

const route = useRoute()
const router = useRouter()
const productStore = useProductStore()

// Reactive data
const product = ref({})
const selectedColor = ref('Champagne')
const selectedSize = ref('S')
const newsletterEmail = ref('')
const newsletterMessage = ref('')

// Colors and Sizes
const colors = ref([
  { name: 'Champagne', hex: '#D5BFA3' },
  { name: 'Black', hex: '#111111' },
  { name: 'White', hex: '#f1f1f1' }
])

const sizes = ref([
  { name: 'XS', available: false },
  { name: 'S', available: true },
  { name: 'M', available: true },
  { name: 'L', available: true },
  { name: 'XL', available: false }
])

// Mock related products
const relatedProducts = ref([
  { id: 1, name: 'The Stiletto Heel', brand: 'PRADA', price: 799, image: 'https://via.placeholder.com/400x500?text=Stiletto+Heel' },
  { id: 2, name: 'Diamond Studs', brand: 'TIFFANY & CO.', price: 1250, image: 'https://via.placeholder.com/400x500?text=Diamond+Studs' },
  { id: 3, name: 'Leather Evening Clutch', brand: 'SAINT LAURENT', price: 950, image: 'https://via.placeholder.com/400x500?text=Evening+Clutch' },
  { id: 4, name: 'Classic Leather Sneaker', brand: 'GUCCI', price: 650, image: 'https://via.placeholder.com/400x500?text=Leather+Sneaker' }
])

// Mock sale products
const saleProducts = ref([
  { id: 5, name: 'The Classic Trench', brand: 'BURBERRY', originalPrice: 1800, price: 1260, image: 'https://via.placeholder.com/400x500?text=Trench+Coat' },
  { id: 6, name: 'Silk Button-Up Blouse', brand: 'EQUIPMENT', originalPrice: 450, price: 315, image: 'https://via.placeholder.com/400x500?text=Silk+Blouse' },
  { id: 7, name: 'Pleated Wool Trousers', brand: 'VINCE', originalPrice: 600, price: 420, image: 'https://via.placeholder.com/400x500?text=Wool+Trousers' },
  { id: 8, name: 'Everyday Leather Tote', brand: 'MANSUR GAVRIEL', originalPrice: 1100, price: 880, image: 'https://via.placeholder.com/400x500?text=Leather+Tote' }
])

// Methods
const formatPrice = (price) => {
  return new Intl.NumberFormat('vi-VN', {
    style: 'currency',
    currency: 'VND',
    minimumFractionDigits: 0
  }).format(price * 24000)
}

const selectColor = (color) => {
  selectedColor.value = color.name
}

const selectSize = (size) => {
  if (size.available) {
    selectedSize.value = size.name
  }
}

const addToCart = () => {
  // Add to cart logic
  console.log('Added to cart')
}

const buyNow = () => {
  // Buy now logic
  console.log('Buy now')
}

const viewProduct = (productId) => {
  router.push({ name: 'ProductDetail', params: { id: productId } })
}

const subscribe = async () => {
  try {
    // API call for newsletter subscription
    newsletterMessage.value = 'Đăng ký thành công!'
    newsletterEmail.value = ''
  } catch (error) {
    newsletterMessage.value = 'Có lỗi xảy ra. Vui lòng thử lại.'
  }
}

// Fetch product on mount
onMounted(async () => {
  const productId = route.params.id
  // Fetch product by ID
  product.value = await productStore.fetchProductById(productId) || {
    id: productId,
    name: 'The Athena Gown',
    brand: 'CHANEL',
    price: 2499,
    image: 'https://via.placeholder.com/800x600?text=Athena+Gown',
    description: 'Crafted from the finest silk charmeuse, the Athena Gown drapes beautifully over the body, creating an ethereal silhouette. This piece features a delicate cowl neckline and a thigh-high slit, balancing elegance with a modern edge. Perfect for galas and special occasions.',
    fit: [
      'Fits true to size, take your normal size.',
      'Model is 178cm/5\'10" and is wearing a size S.',
      'Intended for a slim fit.',
      'Lightweight, non-stretchy fabric.'
    ]
  }
})
</script>