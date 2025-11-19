# 🧠 AI Coding Workflow Guide for Cline (Fullstack: Frontend + Backend)

Tài liệu này giúp Cline hiểu rõ cấu trúc dự án của bạn và sinh code đúng chuẩn, nhất quán, sạch và phù hợp với kiến trúc **fullstack**.

---

## 1. Tech Stack Chuẩn
- **Frontend:** Vue 3 (Composition API + <script setup>), Vite, Pinia, Axios, TailwindCSS, Vue Router 4
- **Backend:** Spring Boot (Java) hoặc Node.js/Express
- **Database:** MySQL / SQL Sever
- **API:** RESTful JSON, chuẩn CRUD endpoints

---

## 2. Quy Tắc Coding Chuẩn
### 2.1 Frontend
- Composition API + `<script setup>`
- TailwindCSS, hạn chế CSS custom
- Component nhỏ, tái sử dụng, max 300 dòng
- State management: Pinia
- API calls: Axios wrapper
- Responsive: sm, md, lg

### 2.2 Backend
- Spring Boot: Controller → Service → Repository → Entity 
- Node.js: route → controller → service → model
- Clean code, DRY, dễ đọc hiểu sâu, comment ngắn gọn
- Validation dữ liệu đầu vào, xử lý lỗi
- Tên chuẩn: PascalCase class/entity, camelCase function/service

---

## 3. Cấu Trúc Thư Mục Chuẩn
### Frontend
```
src/
  api/
  assets/
  components/
  layouts/
  pages/
  router/
  stores/
  utils/
  App.vue
  main.js
```

### Backend (Spring Boot)
```
src/main/java/com/project/
  controllers/
  services/
  repositories/
  models/entities/
  dto/
  config/
  Application.java
```

### Backend (Node.js)
```
src/
  routes/
  controllers/
  services/
  models/
  config/
  app.js / server.js
```

---

## 4. Checklist Ngắn Gọn Cho AI
1. **Phân tích dự án**  
   - Xác định folder structure, tech stack, dependencies trước khi sinh code.  
   - Hỏi lại nếu thiếu thông tin quan trọng.

2. **Frontend (Vue 3 + Tailwind + Pinia)**  
   - Luôn dùng Composition API + `<script setup>`.  
   - Component nhỏ, tái sử dụng, max 300 dòng.  
   - State qua Pinia, gọi API qua Axios wrapper.  
   - Responsive: sm / md / lg.

3. **Backend (Spring Boot / Node.js)**  
   - Tuân theo pattern: Controller → Service → Repository → Entity (Spring) hoặc route → controller → service → model (Node.js).  
   - Validation dữ liệu, xử lý lỗi chuẩn.  
   - Không hardcode dữ liệu, luôn kết nối DB.

4. **Naming & Format**  
   - Component Vue: PascalCase  
   - Store: camelCase + Store  
   - API file: product.api.js / api/index.js  
   - Backend class: PascalCase, Node.js: camelCase  
   - Format code trả về: đặt file path rõ ràng, không ghép quá nhiều class/component dài, tách frontend/backend rõ ràng.

5. **Tuân thủ workflow**  
   - Không tạo framework mới hay file ngoài hướng dẫn.  
   - Luôn generate code sạch, dễ đọc và đồng bộ toàn dự án.

---

## 5. Store & State Management (Pinia)
```js
import { defineStore } from "pinia";
import api from "../api";

export const useProductStore = defineStore("product", {
  state: () => ({ list: [], loading: false }),
  actions: {
    async fetchAll() {
      this.loading = true;
      try {
        const res = await api.get("/products");
        this.list = res.data;
      } finally { this.loading = false; }
    }
  },
});
```

---

## 6. API Calls (Axios Wrapper)
```js
import axios from "axios";
const api = axios.create({ baseURL: import.meta.env.VITE_API_URL, timeout: 10000 });
api.interceptors.response.use(res => res, err => Promise.reject(err));
export default api;
```

---

## 7. Backend API Quy chuẩn
### Spring Boot CRUD Example
```java
@RestController
@RequestMapping("/products")
public class ProductController {
  private final ProductService service;
  public ProductController(ProductService service) { this.service = service; }

  @GetMapping
  public List<Product> getAll() { return service.getAll(); }

  @PostMapping
  public Product create(@RequestBody Product product) { return service.create(product); }
}
```

### Node.js/Express CRUD Example
```js
router.get('/products', async (req,res) => { const products = await productService.getAll(); res.json(products); });
```

---

## 8. UI/Frontend Nguyên Tắc
- Component nhỏ, reusable
- Forms: v-model chuẩn, validate cơ bản
- List: dùng API, không hardcode data
- Loading state khi fetch API
- TailwindCSS cho layout + responsive + hover effects

---

## 9. Backend Nguyên Tắc
- Validation dữ liệu, error handling chuẩn
- Entity/Model mapping với DB
- Tách rõ Controller → Service → Repository
- Không hardcode dữ liệu, dùng DB
- Authentication/Authorization nếu cần (JWT/session)

---

## 10. Cách AI Phải Nhận Yêu Cầu
- Phân tích cấu trúc dự án trước khi sinh code
- Hỏi nếu thông tin thiếu
- Sinh code theo chuẩn workflow
- Chia code dài thành nhiều file, đặt tên hợp lý
- Không tạo code thừa, không tự sáng tạo framework mới

---

## 11. Format Trả Lời Chuẩn
```
📁 File: src/pages/ProductList.vue
```vue
// Vue code
```
📁 File: src/stores/product.js
```js
// Pinia store code
```
📁 File: src/controllers/ProductController.java
```java
// Spring Boot controller code
```
```

---

## 12. Quy Ước Đặt Tên
- Component Vue: PascalCase → ProductCard.vue
- Store: camelCase + Store → productStore.js
- API file: product.api.js hoặc api/index.js
- Backend class: PascalCase → ProductService.java, ProductRepository.java
- Node.js: camelCase → productService.js, productController.js

---

## 13. Quy Tắc Không Được Phá Vỡ
- Frontend: Composition API + Tailwind + Pinia + Axios
- Backend: Controller → Service → Repository pattern
- Code phải clean, tách file, reusable
- Không tự tạo backend hoặc file server ngoài hướng dẫn
- Tên và structure chuẩn

---

✔ Khi làm theo workflow này, Cline sẽ biết cách generate code **fullstack** đúng chuẩn dự án Vue 3 + Vite + Pinia + Tailwind + Spring Boot/Node.js + MySQL/PostgreSQL.

