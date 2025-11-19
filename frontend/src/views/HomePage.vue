<template>
  <div>
    <AppHeader/>
    <!-- Hero Section -->
    <section
        class="relative min-h-[60vh] flex items-center justify-center bg-cover bg-center bg-no-repeat text-center py-20"
        :style="{ backgroundImage: 'linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.6)), url(' + heroImage + ')' }">
      <div class="container mx-auto px-4">
        <h1 class="text-4xl md:text-6xl font-heading font-bold text-white mb-4">Bộ sưu tập Thu Đông 2024</h1>
        <p class="text-lg text-white mb-8 max-w-2xl mx-auto">Khám phá bộ sưu tập mới nhất, sự kết hợp giữa thời trang
          hiện đại và phong cách cổ điển vượt thời gian.</p>
        <button @click="scrollToCollections"
                class="bg-transparent border-2 border-white text-white px-8 py-3 hover:bg-white hover:text-black transition duration-300">
          Khám phá Bộ sưu tập
        </button>
      </div>
    </section>

    <!-- Curated Collections -->
    <section id="collections" class="py-16 container mx-auto px-4">
      <h2 class="text-3xl md:text-4xl font-heading font-bold text-center mb-8">Bộ sưu tập Chọn lọc</h2>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div
            v-for="collection in collections"
            :key="collection.id"
            class="relative overflow-hidden rounded-lg group cursor-pointer"
            @click="viewCategory(collection.id)"
        >
          <div
              class="h-64 bg-cover bg-center transform group-hover:scale-105 transition duration-300"
              :style="{ backgroundImage: `url(${collection.image})` }"
          >
            <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
            <div class="absolute bottom-6 left-6">
              <h3 class="text-white text-xl font-bold">{{ collection.title }}</h3>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- New Arrivals -->
    <section class="py-16 bg-gray-50">
      <div class="container mx-auto px-4">
        <h2 class="text-3xl md:text-4xl font-heading font-bold text-center mb-8">Sản phẩm Mới</h2>
        <div class="grid grid-cols-2 md:grid-cols-4 gap-8">
          <div
              v-for="product in newArrivals"
              :key="product.id"
              class="group cursor-pointer"
              @click="viewProduct(product.id)"
          >
            <div class="aspect-w-3 aspect-h-4 overflow-hidden rounded-lg bg-gray-200">
              <img
                  :src="product.image"
                  :alt="product.name"
                  class="w-full h-full object-cover object-center group-hover:opacity-75 transition duration-300"
              />
            </div>
            <div class="mt-4">
              <h3 class="text-sm font-medium text-gray-900">{{ product.name }}</h3>
              <p class="mt-1 text-sm text-gray-500">{{ product.category }}</p>
              <p class="text-sm font-semibold text-primary mt-1">{{ formatPrice(product.price) }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Behind the Scenes -->
    <section class="py-16">
      <div class="container mx-auto px-4 grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
        <div class="rounded-lg overflow-hidden">
          <img
              src="https://via.placeholder.com/800x600?text=Behind+the+Seams"
              alt="Behind the Seams"
              class="w-full h-full object-cover"
          />
        </div>
        <div class="text-center lg:text-left">
          <h2 class="text-3xl md:text-4xl font-heading font-bold mb-4">Đằng sau Màn trình diễn</h2>
          <p class="text-gray-600 mb-8">
            Cuộc trò chuyện chân thành với giám đốc sáng tạo về nguồn cảm hứng đằng sau bộ sưu tập Thu Đông 2024. Khám
            phá chi tiết thủ công và tầm nhìn định hình thời đại thiết kế mới.
          </p>
          <button
              class="bg-accent border border-accent text-accent px-8 py-3 hover:bg-accent hover:text-white transition duration-300">
            Đọc Thêm
          </button>
        </div>
      </div>
    </section>

    <AppFooter/>
  </div>
</template>

<script setup>
import {onMounted} from 'vue'
import {useHomeLogic} from '../stores/HomePage'
import AppHeader from '../components/Header.vue'
import AppFooter from '../components/Footer.vue'

const {
  heroImage,
  newsletterEmail,
  newsletterMessage,
  collections,
  newArrivals,
  formatPrice,
  scrollToCollections,
  viewCategory,
  viewProduct,
  subscribe,
  mount
} = useHomeLogic()

onMounted(async () => {
  await mount()
})
</script>
