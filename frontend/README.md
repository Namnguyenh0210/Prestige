# 🎨 LUXURY FASHION - FRONTEND

Frontend cho hệ thống E-commerce bán quần áo cao cấp, xây dựng bằng **Vue 3** + **Vite** + **Tailwind CSS**.

---

## 📋 MỤC LỤC

- [Giới thiệu](#giới-thiệu)
- [Công nghệ sử dụng](#công-nghệ-sử-dụng)
- [Yêu cầu hệ thống](#yêu-cầu-hệ-thống)
- [Cài đặt](#cài-đặt)
- [Cấu trúc thư mục](#cấu-trúc-thư-mục)
- [Chạy ứng dụng](#chạy-ứng-dụng)

---

## 🎯 GIỚI THIỆU

**Luxury Fashion Frontend** là phần giao diện người dùng của hệ thống E-commerce, được xây dựng theo mô hình **SPA (Single Page Application)** với Vue 3.

### Tính năng chính:
- ✅ Giao diện responsive, hiện đại với Tailwind CSS
- ✅ Đăng ký, đăng nhập với JWT
- ✅ Quản lý giỏ hàng (đồng bộ với Backend khi đăng nhập)
- ✅ Xem sản phẩm, lọc, phân trang
- ✅ Đặt hàng và thanh toán
- ✅ Trang quản trị cho Admin

---

## 🚀 CÔNG NGHỆ SỬ DỤNG

| Công nghệ | Phiên bản | Mục đích |
|-----------|-----------|----------|
| **Vue 3** | 3.4.0 | Framework JavaScript |
| **Vite** | 5.0.8 | Build tool nhanh |
| **Vue Router** | 4.2.5 | Routing SPA |
| **Pinia** | 2.1.7 | State management |
| **Axios** | 1.6.2 | HTTP client |
| **Tailwind CSS** | 3.4.0 | CSS framework |
| **Chart.js** | 4.4.1 | Vẽ biểu đồ thống kê |

---

## 💻 YÊU CẦU HỆ THỐNG

- ✅ **Node.js 18+** ([Download](https://nodejs.org/))
- ✅ **npm 9+** hoặc **yarn** hoặc **pnpm**
- ✅ **IDE**: VS Code (khuyến nghị với Volar extension)

---

## 📦 CÀI ĐẶT

### Bước 1: Di chuyển vào thư mục frontend

```bash
cd /path/to/Prestige/frontend
```

### Bước 2: Cài đặt dependencies

```bash
npm install
```

Hoặc dùng yarn:

```bash
yarn install
```

### Bước 3: Cấu hình API endpoint

Mở file `src/api/axios.js` và kiểm tra baseURL:

```javascript
const apiClient = axios.create({
  baseURL: 'http://localhost:8080/api',  // Backend API URL
  // ...
})
```

---

## 🎨 CẤU TRÚC THƯ MỤC

```
frontend/
├── public/                      # Static assets
├── src/
│   ├── api/                     # API configuration
│   │   └── axios.js            # Axios instance với interceptors
│   ├── assets/                  # CSS, images
│   │   └── css/
│   │       └── main.css        # Tailwind CSS imports
│   ├── components/              # Reusable components
│   ├── router/                  # Vue Router
│   │   └── index.js            # Route definitions
│   ├── stores/                  # Pinia stores
│   │   ├── authStore.js        # Authentication state
│   │   └── cartStore.js        # Shopping cart state
│   ├── views/                   # Page components
│   │   ├── HomePage.vue
│   │   ├── LoginPage.vue
│   │   ├── RegisterPage.vue
│   │   ├── ProductListPage.vue
│   │   ├── ProductDetailPage.vue
│   │   ├── CartPage.vue
│   │   ├── CheckoutPage.vue
│   │   ├── OrderHistoryPage.vue
│   │   └── admin/              # Admin pages
│   │       └── AdminDashboard.vue
│   ├── App.vue                  # Root component
│   └── main.js                  # Entry point
├── index.html
├── package.json
├── vite.config.js
├── tailwind.config.js
└── README.md
```

---

## 🚀 CHẠY ỨNG DỤNG

### Development mode (với hot-reload)

```bash
npm run dev
```

Ứng dụng sẽ chạy tại: **http://localhost:5173**

### Build cho production

```bash
npm run build
```

Build output sẽ nằm trong thư mục `dist/`

### Preview production build

```bash
npm run preview
```

---

## 🔧 CẤU HÌNH

### 1. Thay đổi API URL

Nếu Backend chạy ở port khác hoặc server khác:

**File: `src/api/axios.js`**
```javascript
const apiClient = axios.create({
  baseURL: 'http://your-backend-url:port/api',
  // ...
})
```

### 2. Thay đổi port Frontend

**File: `vite.config.js`**
```javascript
export default defineConfig({
  // ...
  server: {
    port: 3000,  // Thay đổi port tùy ý
  }
})
```

---

## 📚 CÁC STORE (PINIA)

### authStore.js - Quản lý Authentication

```javascript
import { useAuthStore } from '@/stores/authStore'

const authStore = useAuthStore()

// Login
await authStore.login(email, password)

// Register
await authStore.register(userData)

// Logout
authStore.logout()

// Check authentication
if (authStore.isAuthenticated) {
  // User đã đăng nhập
}

// Check admin
if (authStore.isAdmin) {
  // User là admin
}
```

### cartStore.js - Quản lý Giỏ hàng

```javascript
import { useCartStore } from '@/stores/cartStore'

const cartStore = useCartStore()

// Lấy giỏ hàng
await cartStore.fetchCart()

// Thêm vào giỏ
await cartStore.addToCart(product, quantity)

// Cập nhật số lượng
await cartStore.updateQuantity(maBienThe, newQuantity)

// Xóa khỏi giỏ
await cartStore.removeFromCart(maBienThe)

// Tổng số lượng
console.log(cartStore.totalItems)

// Tổng tiền
console.log(cartStore.totalPrice)
```

---

## 🎨 TAILWIND CSS

Project đã cấu hình sẵn Tailwind CSS với custom colors:

```javascript
// tailwind.config.js
theme: {
  extend: {
    colors: {
      primary: {
        50: '#faf5ff',
        // ... đến 900
      }
    }
  }
}
```

Sử dụng trong component:

```vue
<button class="bg-primary-600 text-white hover:bg-primary-700">
  Click me
</button>
```

---

## 👥 PHÂN CÔNG NHIỆM VỤ

### 👨‍💻 Frontend Dev (Client)
- ⏳ Xây dựng UI: Trang chủ, Danh sách sản phẩm
- ⏳ Xây dựng UI: Chi tiết sản phẩm (với biến thể phức tạp)
- ⏳ Xây dựng UI: Giỏ hàng, Checkout
- ⏳ Tích hợp API: Products, Cart, Orders
- ✅ Đã setup: authStore, cartStore, router

### 👨‍💻 Frontend Dev (Admin)
- ⏳ Xây dựng UI: Admin Dashboard
- ⏳ Xây dựng UI: Quản lý sản phẩm (CRUD)
- ⏳ Xây dựng UI: Quản lý đơn hàng
- ⏳ Xây dựng UI: Quản lý kho (Phiếu nhập)
- ⏳ Xây dựng Dashboard với biểu đồ (Chart.js)

---

## 🐛 TROUBLESHOOTING

### Lỗi: Cannot connect to Backend
```
Giải pháp:
1. Kiểm tra Backend đã chạy chưa (http://localhost:8080)
2. Kiểm tra baseURL trong src/api/axios.js
3. Kiểm tra CORS đã được cấu hình trong Backend
```

### Lỗi: npm install failed
```
Giải pháp:
1. Xóa node_modules và package-lock.json
2. Chạy lại: npm install
3. Hoặc dùng: npm install --legacy-peer-deps
```

### Lỗi: Token invalid
```
Giải pháp:
1. Xóa token trong localStorage
2. Đăng nhập lại
3. Kiểm tra JWT secret key giống Backend
```

---

## 📞 LIÊN HỆ & HỖ TRỢ

- **Frontend Team Lead:** [Tên của bạn]
- **Email:** luxuryfashion@example.com
- **GitHub:** [Link repository]

---

## 📄 LICENSE

Copyright © 2025 Luxury Fashion Team. All rights reserved.

