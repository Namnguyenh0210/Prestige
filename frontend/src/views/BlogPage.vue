<template>
  <AppHeader/>
  <!-- Hero Section -->
  <section class="mb-16">
    <div
        class="min-h-[60vh] rounded-lg bg-cover bg-center bg-no-repeat flex flex-col items-center justify-center py-16 px-8 text-center text-white"
        style="background-image: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.5)), url('https://via.placeholder.com/1920x1080?text=Blog+Hero');">
      <h1 class="font-serif text-4xl font-black leading-tight tracking-tight mb-4 md:text-5xl lg:text-6xl">Bản Chất
        Phong Cách Vượt Thời Gian</h1>
      <h2 class="text-lg md:text-xl leading-normal mb-8 max-w-2xl">Khám phá các xu hướng mới nhất, phỏng vấn nhà thiết
        kế, và những câu chuyện từ thế giới thời trang xa xỉ.</h2>
      <router-link to="#"
                   class="inline-block min-w-[120px] cursor-pointer items-center justify-center overflow-hidden rounded-full h-12 px-8 bg-primary text-text-primary-light text-base font-bold leading-normal tracking-[0.015em] hover:bg-cta-hover hover:text-white transition-colors">
        Đọc Thêm
      </router-link>
    </div>
  </section>

  <!-- Featured Articles Section -->
  <section class="mb-16">
    <h2 class="mb-8 text-center font-serif text-3xl font-bold tracking-tight md:text-4xl">Bài viết nổi bật</h2>
    <div class="grid grid-cols-1 gap-12 md:grid-cols-2">
      <div
          v-for="article in featuredArticles"
          :key="article.id"
          class="group cursor-pointer"
      >
        <div
            class="w-full overflow-hidden rounded-lg bg-center bg-no-repeat aspect-[4/3] bg-cover"
            :style="{ backgroundImage: `url(${article.image})` }"
        ></div>
        <div class="flex flex-col items-start gap-2 py-4">
          <p class="text-lg font-bold leading-tight tracking-tight group-hover:text-cta-hover dark:group-hover:text-white transition-colors">
            {{ article.title }}</p>
          <p class="text-base font-normal leading-normal text-text-secondary-light dark:text-text-secondary-dark">
            {{ article.excerpt }}</p>
          <router-link :to="article.link"
                       class="mt-2 inline-block text-sm font-bold text-primary hover:text-cta-hover dark:hover:text-white">
            Đọc Toàn Bộ Câu Chuyện →
          </router-link>
        </div>
      </div>
    </div>
  </section>

  <!-- Brands Section -->
  <section class="mb-16">
    <h2 class="mb-8 text-center font-serif text-3xl font-bold tracking-tight md:text-4xl">Bài viết về các Brand</h2>
    <div class="grid grid-cols-2 gap-8 sm:grid-cols-3 md:grid-cols-6 items-center">
      <img
          v-for="brand in brands"
          :key="brand.name"
          :src="brand.logo"
          :alt="brand.name"
          class="mx-auto grayscale hover:grayscale-0 transition duration-300 opacity-60 hover:opacity-100 cursor-pointer"
      >
    </div>
  </section>

  <!-- Blog News Section -->
  <section>
    <h2 class="mb-4 text-center font-serif text-3xl font-bold tracking-tight md:text-4xl">Blog Tin tức thời trang</h2>
    <div class="mb-8 flex justify-center border-b border-border-light dark:border-border-dark">
      <div class="flex items-center gap-4 sm:gap-8">
        <button
            v-for="filter in filters"
            :key="filter.key"
            @click="activeFilter = filter.key"
            :class="[
                  'border-b-2 py-3 px-2 text-sm font-medium hover:border-cta-hover hover:text-cta-hover dark:hover:border-white dark:hover:text-white',
                  activeFilter === filter.key ? 'border-primary font-bold' : 'border-transparent'
                ]"
        >
          {{ filter.label }}
        </button>
      </div>
    </div>
    <div class="grid grid-cols-1 gap-x-8 gap-y-12 sm:grid-cols-2 lg:grid-cols-3">
      <div
          v-for="article in filteredArticles"
          :key="article.id"
          class="group cursor-pointer"
      >
        <div
            class="w-full overflow-hidden rounded-lg bg-center bg-no-repeat aspect-[4/3] bg-cover"
            :style="{ backgroundImage: `url(${article.image})` }"
        ></div>
        <div class="flex flex-col items-start gap-1 py-4">
          <p class="text-xs font-bold uppercase tracking-widest text-primary">{{ article.category }}</p>
          <p class="text-lg font-bold leading-tight tracking-tight group-hover:text-cta-hover dark:group-hover:text-white transition-colors">
            {{ article.title }}</p>
          <p class="text-sm font-normal leading-normal text-text-secondary-light dark:text-text-secondary-dark">
            {{ article.excerpt }}</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <AppFooter/>
</template>

<script setup>
import {useBlogLogic} from '../stores/BlogPage'
import AppHeader from "@/components/Header.vue";
import AppFooter from "@/components/Footer.vue";

const {
  activeFilter,
  featuredArticles,
  brands,
  filters,
  articles,
  filteredArticles
} = useBlogLogic()
</script>
