<template>
  <div class="bg-background-light dark:bg-background-dark font-display text-text-primary-light dark:text-text-primary-dark">
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
                <router-link to="/cart" class="flex items-center gap-2 cursor-pointer hover:text-black dark:hover:text-white p-2 rounded-md hover:bg-black/10 dark:hover:bg-white/10 no-underline">
                  <span class="material-symbols-outlined text-2xl">shopping_bag</span>
                  <span class="hidden sm:inline text-sm font-medium">Giỏ Hàng</span>
                </router-link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
    <main class="px-2 sm:px-4 lg:px-6 py-10 lg:py-16">
      <div class="flex flex-col w-full max-w-7xl mx-auto">
        <div class="flex flex-wrap justify-between gap-3 mb-10">
          <p class="text-text-primary-light dark:text-text-primary-dark text-4xl lg:text-5xl font-black font-heading tracking-[-0.033em] min-w-72">Shopping Cart</p>
        </div>
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-12 lg:gap-16">
          <div class="lg:col-span-2 space-y-10">
            <div class="bg-white dark:bg-background-dark p-8 rounded-lg">
              <div class="flex justify-between items-center mb-6">
                <h2 class="text-text-primary-light dark:text-primary-dark text-2xl font-bold font-heading">Thông tin đơn hàng</h2>
                <button class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-10 px-4 bg-transparent text-text-primary-light dark:text-text-primary-dark text-sm font-bold leading-normal tracking-[0.015em] hover:bg-black/5 dark:hover:bg-white/10">
                  <span class="truncate">Chỉnh sửa</span>
                </button>
              </div>
              <div class="grid grid-cols-[120px_1fr] gap-x-6 text-sm">
                <div class="col-span-2 grid grid-cols-subgrid border-t border-t-secondary-gray/50 py-4">
                  <p class="text-gray-500 dark:text-gray-400 font-normal leading-normal">Họ tên</p>
                  <p class="text-text-primary-light dark:text-text-primary-dark font-medium leading-normal">{{ orderInfo.fullName }}</p>
                </div>
                <div class="col-span-2 grid grid-cols-subgrid border-t border-t-secondary-gray/50 py-4">
                  <p class="text-gray-500 dark:text-gray-400 font-normal leading-normal">Số điện thoại</p>
                  <p class="text-text-primary-light dark:text-text-primary-dark font-medium leading-normal">{{ orderInfo.phone }}</p>
                </div>
                <div class="col-span-2 grid grid-cols-subgrid border-t border-b border-t-secondary-gray/50 border-b-secondary-gray/50 py-4">
                  <p class="text-gray-500 dark:text-gray-400 font-normal leading-normal">Địa chỉ</p>
                  <p class="text-text-primary-light dark:text-text-primary-dark font-medium leading-normal">{{ orderInfo.address }}</p>
                </div>
              </div>
              <div class="mt-8 space-y-6">
                <div>
                  <label class="block text-sm font-medium text-gray-500 dark:text-gray-400 mb-2" for="notes">Ghi chú</label>
                  <textarea v-model="orderInfo.notes" class="block w-full rounded-md border-secondary-gray focus:border-accent focus:ring-accent sm:text-sm bg-background-light dark:bg-background-dark dark:border-gray-600 dark:text-text-primary-dark" id="notes" name="notes" placeholder="Thêm ghi chú cho đơn hàng của bạn..." rows="3"></textarea>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                  <div>
                    <h3 class="text-sm font-medium text-gray-500 dark:text-gray-400 mb-3">Phương thức vận chuyển</h3>
                    <div class="space-y-3">
                      <div class="flex items-center">
                        <input v-model="orderInfo.shippingMethod" value="standard" class="h-4 w-4 border-secondary-gray text-accent focus:ring-accent" id="shipping-standard" name="shipping-method" type="radio"/>
                        <label class="ml-3 block text-sm font-medium text-text-primary-light dark:text-text-primary-dark" for="shipping-standard">Giao hàng tiêu chuẩn</label>
                      </div>
                      <div class="flex items-center">
                        <input v-model="orderInfo.shippingMethod" value="express" class="h-4 w-4 border-secondary-gray text-accent focus:ring-accent" id="shipping-express" name="shipping-method" type="radio"/>
                        <label class="ml-3 block text-sm font-medium text-text-primary-light dark:text-text-primary-dark" for="shipping-express">Giao hàng nhanh</label>
                      </div>
                    </div>
                  </div>
                  <div>
                    <h3 class="text-sm font-medium text-gray-500 dark:text-gray-400 mb-3">Hình thức thanh toán</h3>
                    <div class="space-y-3">
                      <div class="flex items-center">
                        <input v-model="orderInfo.paymentMethod" value="card" class="h-4 w-4 border-secondary-gray text-accent focus:ring-accent" id="payment-card" name="payment-method" type="radio"/>
                        <label class="ml-3 block text-sm font-medium text-text-primary-light dark:text-text-primary-dark" for="payment-card">Thẻ Tín dụng / Ghi nợ</label>
                      </div>
                      <div class="flex items-center">
                        <input v-model="orderInfo.paymentMethod" value="transfer" class="h-4 w-4 border-secondary-gray text-accent focus:ring-accent" id="payment-transfer" name="payment-method" type="radio"/>
                        <label class="ml-3 block text-sm font-medium text-text-primary-light dark:text-text-primary-dark" for="payment-transfer">Chuyển khoản ngân hàng</label>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div>
              <h2 class="text-text-primary-light dark:text-text-primary-dark text-2xl font-bold mb-6 font-heading">Giỏ hàng các sản phẩm đã chọn ({{ cartItemCount }})</h2>
              <div class="space-y-6">
                <div v-for="item in cartItems" :key="item.id" class="flex gap-6 border-b border-secondary-gray/50 pb-6">
                  <div class="w-24 h-32 lg:w-32 lg:h-40 flex-shrink-0 bg-gray-200 rounded-lg bg-cover bg-center" :style="{ backgroundImage: `url(${item.image})` }" :alt="item.alt"></div>
                  <div class="flex flex-col flex-grow">
                    <div class="flex justify-between">
                      <div>
                        <p class="text-sm font-semibold text-gray-500 dark:text-gray-400">{{ item.brand }}</p>
                        <h3 class="text-lg font-bold text-text-primary-light dark:text-text-primary-dark">{{ item.name }}</h3>
                        <p class="text-xs text-gray-400 mt-1">{{ item.size }} / {{ item.color }}</p>
                      </div>
                      <p class="text-lg font-bold text-text-primary-light dark:text-text-primary-dark">{{ formatPrice(item.price) }}</p>
                    </div>
                    <div class="flex items-center justify-between mt-auto">
                      <div class="flex items-center border border-secondary-gray rounded-md">
                        <button @click="decreaseQuantity(item.id)" class="px-3 py-1 text-lg font-medium">-</button>
                        <span class="px-3 py-1 text-sm">{{ item.quantity }}</span>
                        <button @click="increaseQuantity(item.id)" class="px-3 py-1 text-lg font-medium">+</button>
                      </div>
                      <button @click="removeItem(item.id)" class="text-sm text-gray-500 hover:text-red-500">Remove</button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="mt-8">
                <router-link to="/products" class="text-sm font-medium text-text-primary-light dark:text-text-primary-dark underline hover:text-accent">Tiếp tục mua sắm</router-link>
              </div>
            </div>
          </div>
          <div class="lg:col-span-1">
            <div class="bg-white dark:bg-background-dark p-8 rounded-lg sticky top-10">
              <h2 class="text-text-primary-light dark:text-text-primary-dark text-2xl font-bold mb-6 font-heading">Tóm tắt đơn hàng</h2>
              <div class="mb-6">
                <h3 class="text-sm font-medium text-gray-500 dark:text-gray-400 mb-2">Ưu đãi cho bạn</h3>
                <div class="flex gap-2">
                  <input v-model="voucherCode" class="flex-grow rounded-md border-secondary-gray focus:border-accent focus:ring-accent sm:text-sm bg-background-light dark:bg-background-dark dark:border-gray-600 dark:text-text-primary-dark" placeholder="Nhập mã voucher" type="text"/>
                  <button @click="applyVoucher" class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-10 px-4 bg-transparent text-text-primary-light dark:text-text-primary-dark text-sm font-bold border border-secondary-gray hover:bg-black/5 dark:hover:bg-white/10">Áp dụng</button>
                </div>
              </div>
              <div class="space-y-3 border-t border-b border-secondary-gray/50 py-6">
                <div class="flex justify-between text-sm">
                  <p class="text-gray-500 dark:text-gray-400">Tạm tính</p>
                  <p class="text-text-primary-light dark:text-text-primary-dark">{{ formatPrice(subtotal) }}</p>
                </div>
                <div class="flex justify-between text-sm">
                  <p class="text-gray-500 dark:text-gray-400">Phí vận chuyển</p>
                  <p class="text-text-primary-light dark:text-text-primary-dark">{{ formatPrice(shippingCost) }}</p>
                </div>
                <div class="flex justify-between text-sm">
                  <p class="text-gray-500 dark:text-gray-400">Giảm giá</p>
                  <p class="text-text-primary-light dark:text-text-primary-dark">- {{ formatPrice(discount) }}</p>
                </div>
              </div>
              <div class="flex justify-between items-center mt-6">
                <p class="text-lg font-bold text-text-primary-light dark:text-text-primary-dark">Tổng cộng</p>
                <p class="text-xl font-black text-text-primary-light dark:text-text-primary-dark">{{ formatPrice(total) }}</p>
              </div>
              <router-link to="/checkout" class="w-full mt-8 flex min-w-[84px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-12 px-4 bg-primary text-white text-base font-bold leading-normal tracking-[0.015em] hover:bg-opacity-90 no-underline">
                <span class="truncate">Thanh toán</span>
              </router-link>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup>
import { useCartPageStore } from '../stores/CartPage'

const cartPageStore = useCartPageStore()

// Expose store properties for template
const voucherCode = cartPageStore.voucherCode
const discount = cartPageStore.discount
const orderInfo = cartPageStore.orderInfo
const cartItems = cartPageStore.cartItems
const cartItemCount = cartPageStore.cartItemCount
const subtotal = cartPageStore.subtotal
const shippingCost = cartPageStore.shippingCost
const total = cartPageStore.total
const formatPrice = cartPageStore.formatPrice
const increaseQuantity = cartPageStore.increaseQuantity
const decreaseQuantity = cartPageStore.decreaseQuantity
const removeItem = cartPageStore.removeItem
const applyVoucher = cartPageStore.applyVoucher
</script>

<style src="../assets/css/CartPage.css"></style>
