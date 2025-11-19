<template>
  <div class="font-display bg-background-light dark:bg-background-dark text-text-primary-light dark:text-text-primary-dark">
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
    <main class="flex flex-1 justify-center py-10 md:py-16 px-4 sm:px-6 lg:px-8">
      <div class="layout-content-container flex w-full flex-col max-w-4xl flex-1">
        <div class="flex flex-col items-center text-center">
          <div class="mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-primary/20 text-primary">
            <span class="material-symbols-outlined text-4xl">check_circle</span>
          </div>
          <h1 class="text-4xl md:text-5xl font-bold tracking-tight">Cảm ơn đã đặt hàng!</h1>
          <p class="mt-3 max-w-md text-base text-text-secondary-light dark:text-text-secondary-dark">Chúng tôi đã gửi email xác nhận đơn hàng và hóa đơn đến địa chỉ email của bạn.</p>
        </div>
        <div class="mt-12 w-full rounded-xl border border-border-light dark:border-border-dark bg-white dark:bg-background-dark/50">
          <div class="p-6 md:p-8">
            <h3 class="text-xl font-bold tracking-tight">Chi tiết đơn hàng</h3>
            <div class="mt-6 grid grid-cols-1 gap-x-4 gap-y-6 sm:grid-cols-2">
              <div class="flex flex-col gap-1">
                <p class="text-sm text-text-secondary-light dark:text-text-secondary-dark">Mã đơn hàng</p>
                <p class="text-sm font-medium">{{ orderDetails.orderId }}</p>
              </div>
              <div class="flex flex-col gap-1">
                <p class="text-sm text-text-secondary-light dark:text-text-secondary-dark">Ngày đặt hàng</p>
                <p class="text-sm font-medium">{{ orderDetails.orderDate }}</p>
              </div>
              <div class="flex flex-col gap-1">
                <p class="text-sm text-text-secondary-light dark:text-text-secondary-dark">Tên khách hàng</p>
                <p class="text-sm font-medium">{{ orderDetails.customerName }}</p>
              </div>
              <div class="flex flex-col gap-1">
                <p class="text-sm text-text-secondary-light dark:text-text-secondary-dark">Địa chỉ giao hàng</p>
                <p class="text-sm font-medium">{{ orderDetails.shippingAddress }}</p>
              </div>
              <div class="flex flex-col gap-1 sm:col-span-2">
                <p class="text-sm text-text-secondary-light dark:text-text-secondary-dark">Phương thức thanh toán</p>
                <p class="text-sm font-medium">{{ orderDetails.paymentMethod }}</p>
              </div>
            </div>
          </div>
          <div class="border-t border-border-light dark:border-border-dark p-6 md:p-8">
            <h3 class="text-xl font-bold tracking-tight">Tóm tắt đơn hàng</h3>
            <ul class="mt-6 space-y-6" role="list">
              <li v-for="item in orderDetails.items" :key="item.id" class="flex items-start gap-4">
                <img class="h-20 w-20 flex-shrink-0 rounded-lg object-cover" :data-alt="item.alt" :src="item.image" />
                <div class="flex-1">
                  <p class="text-sm font-bold">{{ item.brand }}</p>
                  <p class="text-sm text-text-secondary-light dark:text-text-secondary-dark">{{ item.name }}</p>
                  <p class="mt-1 text-xs text-text-secondary-light dark:text-text-secondary-dark">Số lượng: {{ item.quantity }}</p>
                </div>
                <p class="text-sm font-medium">{{ formatPrice(item.price) }}</p>
              </li>
            </ul>
          </div>
          <div class="border-t border-border-light dark:border-border-dark p-6 md:p-8">
            <div class="space-y-3 text-sm">
              <div class="flex justify-between">
                <span class="text-text-secondary-light dark:text-text-secondary-dark">Tạm tính</span>
                <span>{{ formatPrice(orderDetails.subtotal) }}</span>
              </div>
              <div class="flex justify-between">
                <span class="text-text-secondary-light dark:text-text-secondary-dark">Phí vận chuyển</span>
                <span v-if="orderDetails.shippingCost === 0">Miễn phí</span><span v-else>{{ formatPrice(orderDetails.shippingCost) }}</span>
              </div>
              <div class="flex justify-between border-t border-border-light dark:border-border-dark pt-3 text-base font-bold">
                <span>Tổng cộng</span>
                <span>{{ formatPrice(orderDetails.total) }}</span>
              </div>
            </div>
          </div>
        </div>
        <div class="mt-12 flex flex-col items-center gap-4 sm:flex-row sm:justify-center">
          <router-link to="/products" class="flex w-full cursor-pointer items-center justify-center overflow-hidden rounded-lg h-12 bg-[#111111] dark:bg-[#FAFAFA] text-white dark:text-[#111111] gap-2 text-sm font-bold tracking-wide min-w-0 px-6 hover:opacity-90 sm:w-auto no-underline">Tiếp tục mua sắm</router-link>
          <router-link to="/" class="flex w-full cursor-pointer items-center justify-center overflow-hidden rounded-lg h-12 bg-transparent text-[#111111] dark:text-[#FAFAFA] border border-[#111111] dark:border-[#FAFAFA] gap-2 text-sm font-bold tracking-wide min-w-0 px-6 hover:bg-black/5 dark:hover:bg-white/5 sm:w-auto no-underline">Về trang chủ</router-link>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

const orderDetails = ref({
  orderId: '#12345-67890',
  orderDate: '15 Tháng Tám 2024, 10:30 SA',
  customerName: 'Nguyen Van A',
  shippingAddress: '123 Đường ABC, Quận 1, TP.HCM',
  paymentMethod: 'Visa kết thúc bằng **** 1234',
  subtotal: 24500000,
  shippingCost: 0,
  total: 24500000,
  items: [
    {
      id: 1,
      brand: 'A.P.C.',
      name: 'Grace Small Bag',
      quantity: 1,
      price: 15000000,
      alt: 'A beige handbag with a gold chain strap',
      image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDLzwC_sKmdp0vy6MBPkTSv6KQxBjaFWxrKu0N0TumtOsx_OE0V3oAhliI74AFyI7Q_cY3gh0nE_BBBUtsZ2QlqyczHjm0oytBUBB63RdbInwnc75VCPvrWjoI1G2jDHxAOKJMWQpd4dWbSCEq_4r8fi4y7hX9dRmpKKorUC-BiwqZXmBngtZjtM0eeJZ2FC--8q0uiq48v1qR9HqV6SUQTLuwGu86Mc4r2yk7zH6uu0E2ODUtxv53vk19sNI4Aj9BChd6QVv-mc6I'
    },
    {
      id: 2,
      brand: 'COMMON PROJECTS',
      name: 'Original Achilles Low',
      quantity: 1,
      price: 9500000,
      alt: 'A pair of classic white leather sneakers',
      image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAIFKovahGo4mw_xl3FWmLKEzJ6VlakEpcN8vUQD4fSfubieLyk-veCmnV5sSzGaEJa-z08-INjV6SQSvMunYLWniiHE7vbV-GY5wOA_Gm4Z1S337cTvTQCoCkBPWRT1WqzCzcJrjB2HsNAIh3iWUWY2aGepLNvOdVic3dSdDA5nelUBWGAQTrVYgJDVVTze3tleCwoz5P8qIsJFZx1C-GgvPskXX7ZIv0Z4HCdDAynQzSsrIYRKMtaY8TfnT3w8Tg8eBbEzLQAmZ8'
    }
  ]
})

// Methods
const formatPrice = (price) => {
  return new Intl.NumberFormat('vi-VN', {
    style: 'currency',
    currency: 'VND',
    minimumFractionDigits: 0
  }).format(price)
}
</script>
