<template>
  <header class="sticky top-0 z-50 bg-background-light/95 dark:bg-background-dark/95 backdrop-blur-sm">
    <div class="bg-background-light dark:bg-background-dark">
      <div class="container mx-auto px-2 sm:px-4 lg:px-6">
        <div
            class="flex h-10 items-center justify-end text-xs text-text-primary-light/80 dark:text-text-primary-dark/80">
          <div class="flex items-center space-x-4">
            <a class="flex items-center gap-1.5 hover:text-primary dark:hover:text-white" href="#">
              <span class="material-symbols-outlined text-base">mail</span>
              <span>fashion@luxury.vn</span>
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
            <router-link to="/login"
                         class="hidden lg:flex items-center gap-1.5 hover:text-primary dark:hover:text-white">
              <span class="material-symbols-outlined text-base">person</span>
              <span>Đăng Ký / Đăng Nhập</span>
            </router-link>
          </div>
        </div>
      </div>
    </div>
    <div class="border-y border-secondary/50">
      <div class="container mx-auto px-2 sm:px-4 lg:px-6">
        <div class="flex h-24 items-center justify-between gap-4">
          <div class="flex items-center">
            <h1 class="text-3xl font-serif text-text-primary-light dark:text-text-primary-dark">Luxury Fashion</h1>
          </div>
          <router-link class="text-sm font-medium text-text-primary-light dark:text-text-primary-dark hover:text-black dark:hover:text-white"
             to="/">Home</router-link>
          <nav class="hidden lg:flex items-center gap-6">
            <router-link class="flex items-center gap-2 text-sm font-medium text-text-primary-light dark:text-text-primary-dark hover:text-black dark:hover:text-white" to="/product-brand">
              <span class="material-symbols-outlined">menu</span>
              <span>Brand</span>
            </router-link>
            <router-link class="text-sm font-medium text-text-primary-light dark:text-text-primary-dark hover:text-black dark:hover:text-white"
               to="/product-woman">Cho Nữ</router-link>
            <router-link class="text-sm font-medium text-text-primary-light dark:text-text-primary-dark hover:text-black dark:hover:text-white"
               to="/product-man">Cho Nam</router-link>
            <router-link class="text-sm font-medium text-text-primary-light dark:text-text-primary-dark hover:text-black dark:hover:text-white"
               to="/product-blog">Blog</router-link>
          </nav>
          <div class="flex flex-1 items-center justify-end gap-2 md:gap-4">
            <div class="hidden md:flex max-w-xs flex-1">
              <form class="flex w-full">
                <label class="sr-only" for="search-header">Tìm kiếm</label>
                <input
                    class="w-full border-r-0 border-secondary bg-transparent py-2 pl-4 text-sm focus:border-accent focus:ring-accent"
                    id="search-header" name="search-header" placeholder="Nhập nội dung..." type="search"/>
                <button
                    class="flex items-center justify-center bg-accent px-4 text-sm font-semibold text-text-primary-light hover:bg-accent/90"
                    type="submit">
                  <span class="material-symbols-outlined text-lg mr-1">search</span>
                  <span>Search</span>
                </button>
              </form>
            </div>
            <button
                class="flex h-10 w-10 cursor-pointer items-center justify-center rounded-full hover:bg-black/10 dark:hover:bg-white/10 md:hidden">
              <span class="material-symbols-outlined text-2xl">search</span>
            </button>
            <div class="flex items-center gap-2">
              <button
                  class="flex h-10 w-10 cursor-pointer items-center justify-center rounded-full hover:bg-black/10 dark:hover:bg-white/10">
                <span class="material-symbols-outlined text-2xl">favorite_border</span>
              </button>
              <a class="flex items-center gap-2 cursor-pointer hover:text-black dark:hover:text-white p-2 rounded-md hover:bg-black/10 dark:hover:bg-white/10"
                 href="/cart">
                <span class="material-symbols-outlined text-2xl">shopping_bag</span>
                <span class="hidden sm:inline text-sm font-medium">Giỏ Hàng</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  name: 'AppHeader'
}
</script>
