<template>
  <footer class="bg-gray-900 text-white p-2 md:px-6">
    <div class="container mx-auto">
      <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
        <!-- Company Info -->
        <div class="col-span-1 md:col-span-2">
          <h3 class="text-2xl font-serif font-bold mb-4">Luxury Fashion</h3>
          <p class="text-gray-300 mb-4">
            Nơi quy tụ những bộ trang phục tinh tế và sang trọng, thể hiện đẳng cấp và phong cách riêng biệt của bạn.
          </p>
          <div class="flex items-center gap-2 mb-2">
            <span class="material-symbols-outlined text-white">location_on</span>
            <span class="text-sm">123 Đường ABC, Quận 1, TP.HCM</span>
          </div>
          <div class="flex items-center gap-2 mb-2">
            <span class="material-symbols-outlined text-white">phone</span>
            <span class="text-sm">Hotline: 079 9191940</span>
          </div>
          <div class="flex items-center gap-2 mb-2">
            <span class="material-symbols-outlined text-white">mail</span>
            <span class="text-sm">rental@rentzy.vn</span>
          </div>
        </div>

        <!-- Quick Links -->
        <div>
          <h4 class="text-lg font-bold mb-4">Liên Kết Nhanh</h4>
          <ul class="space-y-2">
            <li>
              <router-link to="/products" class="text-gray-300 hover:text-white transition">Sản Phẩm</router-link>
            </li>
            <li>
              <router-link to="/about" class="text-gray-300 hover:text-white transition">Về Chúng Tôi</router-link>
            </li>
            <li>
              <router-link to="/contact" class="text-gray-300 hover:text-white transition">Liên Hệ</router-link>
            </li>
            <li>
              <router-link to="/blog" class="text-gray-300 hover:text-white transition">Blog</router-link>
            </li>
            <li>
              <router-link to="/faq" class="text-gray-300 hover:text-white transition">FAQ</router-link>
            </li>
          </ul>
        </div>

        <!-- Customer Service -->
        <div>
          <h4 class="text-lg font-bold mb-4">Dịch Vụ Khách Hàng</h4>
          <ul class="space-y-2">
            <li>
              <router-link to="/order-tracking" class="text-gray-300 hover:text-white transition">Theo Dõi Đơn Hàng</router-link>
            </li>
            <li>
              <router-link to="/returns" class="text-gray-300 hover:text-white transition">Chính Sách Đổi Trả</router-link>
            </li>
            <li>
              <router-link to="/shipping" class="text-gray-300 hover:text-white transition">Vận Chuyển</router-link>
            </li>
            <li>
              <router-link to="/privacy" class="text-gray-300 hover:text-white transition">Bảo Mật</router-link>
            </li>
            <li>
              <router-link to="/terms" class="text-gray-300 hover:text-white transition">Điều Khoản</router-link>
            </li>
          </ul>
        </div>
      </div>

      <!-- Social Media & Copyright -->
      <div class="border-t border-gray-700 mt-8 pt-6">
        <div class="flex flex-col md:flex-row justify-between items-center gap-4">
          <p class="text-sm text-gray-400">
            © {{ new Date().getFullYear() }} Luxury Fashion. Tất cả quyền được bảo lưu.
          </p>
        </div>
      </div>
    </div>
  </footer>
</template>

<script>
export default {
  name: 'AppFooter'
}
</script>
