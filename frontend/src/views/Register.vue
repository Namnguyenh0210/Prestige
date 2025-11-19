<template>
  <div class="register-bg relative flex min-h-screen w-full flex-col items-center justify-center bg-background-light dark:bg-background-dark overflow-x-hidden p-4 md:p-8">
    <div class="absolute inset-0 bg-background-light/80 dark:bg-background-dark/90 backdrop-blur-sm"></div>
    <div class="relative z-10 flex w-full max-w-md flex-col items-center rounded-xl bg-white/80 dark:bg-black/50 p-6 shadow-2xl backdrop-blur-lg md:p-10">
      <div class="mb-6 flex flex-col items-center">
        <svg class="h-10 w-auto text-[#111111] dark:text-[#FAFAFA]" fill="none" viewbox="0 0 138 32" xmlns="http://www.w3.org/2000/svg">
          <path d="M10.8753 23.5385L2.11538 32H0L10.3385 18.0615L2.11538 4.30769H0L10.8753 12.6154V0H13.6369V12.6154L24.5385 4.30769H26.6538L16.3169 18.0615L26.6538 32H24.5385L13.6369 23.5385V32H10.8753V23.5385Z" fill="currentColor"></path>
          <path d="M46.756 32H44.0327L38.4019 19.3231V32H35.6403V0H38.4019V17.0462L43.8347 4.30769H46.756L40.2813 18.2769L46.756 32Z" fill="currentColor"></path>
          <path d="M68.3077 32H50.8308V0H68.3077V2.86154H53.5923V14.4H67.2308V17.2615H53.5923V29.1385H68.3077V32Z" fill="currentColor"></path>
          <path d="M86.1105 32H71.0766V0H88.5535V2.86154H73.8381V14.4H86.4335V17.2615H73.8381V32H86.1105Z" fill="currentColor"></path>
          <path d="M106.942 32H104.219L98.5881 19.3231V32H95.8265V0H98.5881V17.0462L104.021 4.30769H106.942L100.467 18.2769L106.942 32Z" fill="currentColor"></path>
          <path d="M116.324 32V0H137.478V2.86154H119.085V14.4H133.564V17.2615H119.085V29.1385H137.924V32H116.324Z" fill="currentColor"></path>
        </svg>
      </div>
      <div class="w-full">
        <div class="mb-8 text-center">
          <p class="text-3xl font-black leading-tight tracking-[-0.033em] text-[#111111] dark:text-white">Tạo Tài Khoản</p>
        </div>
        <form class="flex w-full flex-col gap-5" @submit.prevent="handleRegister">
          <label class="flex flex-col">
            <p class="pb-2 text-sm font-medium leading-normal text-[#111111] dark:text-[#FAFAFA]">Họ tên</p>
            <input v-model="formData.hoTen" class="form-input h-12 w-full flex-1 resize-none overflow-hidden rounded border border-[#CFCFCF] bg-white/50 p-3 text-base font-normal leading-normal text-[#111111] placeholder:text-[#CFCFCF] focus:border-[#D5BFA3] focus:outline-none focus:ring-1 focus:ring-[#D5BFA3] dark:border-gray-600 dark:bg-black/30 dark:text-white dark:placeholder:text-gray-500" placeholder="Nhập họ và tên" required />
          </label>
          <label class="flex flex-col">
            <p class="pb-2 text-sm font-medium leading-normal text-[#111111] dark:text-[#FAFAFA]">Email</p>
            <input v-model="formData.email" class="form-input h-12 w-full flex-1 resize-none overflow-hidden rounded border border-[#CFCFCF] bg-white/50 p-3 text-base font-normal leading-normal text-[#111111] placeholder:text-[#CFCFCF] focus:border-[#D5BFA3] focus:outline-none focus:ring-1 focus:ring-[#D5BFA3] dark:border-gray-600 dark:bg-black/30 dark:text-white dark:placeholder:text-gray-500" placeholder="Nhập email" type="email" required />
          </label>
          <label class="flex flex-col">
            <p class="pb-2 text-sm font-medium leading-normal text-[#111111] dark:text-[#FAFAFA]">Đặt mật khẩu</p>
            <div class="relative flex w-full flex-1 items-stretch">
              <input v-model="formData.matKhau" class="form-input h-12 w-full flex-1 resize-none overflow-hidden rounded border border-[#CFCFCF] bg-white/50 p-3 pr-10 text-base font-normal leading-normal text-[#111111] placeholder:text-[#CFCFCF] focus:border-[#D5BFA3] focus:outline-none focus:ring-1 focus:ring-[#D5BFA3] dark:border-gray-600 dark:bg-black/30 dark:text-white dark:placeholder:text-gray-500" placeholder="Nhập mật khẩu" type="password" required />
              <button class="material-symbols-outlined absolute right-3 top-1/2 -translate-y-1/2 text-gray-500 dark:text-gray-400" type="button">visibility_off</button>
            </div>
          </label>
          <label class="flex flex-col">
            <p class="pb-2 text-sm font-medium leading-normal text-[#111111] dark:text-[#FAFAFA]">Số điện thoại</p>
            <input v-model="formData.soDienThoai" class="form-input h-12 w-full flex-1 resize-none overflow-hidden rounded border border-[#CFCFCF] bg-white/50 p-3 text-base font-normal leading-normal text-[#111111] placeholder:text-[#CFCFCF] focus:border-[#D5BFA3] focus:outline-none focus:ring-1 focus:ring-[#D5BFA3] dark:border-gray-600 dark:bg-black/30 dark:text-white dark:placeholder:text-gray-500" placeholder="Nhập số điện thoại" type="tel" required />
          </label>
          <div v-if="error" class="text-red-600 text-sm text-center">
            {{ error }}
          </div>
          <div v-if="success" class="text-green-600 text-sm text-center">
            Đăng ký thành công! Đang chuyển đến trang đăng nhập...
          </div>
          <button class="mt-4 flex h-12 w-full items-center justify-center rounded bg-[#000000] text-base font-bold text-white transition-opacity hover:opacity-90" type="submit">Đăng kí</button>
          <div class="my-2 flex items-center gap-4">
            <hr class="w-full border-t border-[#CFCFCF] dark:border-gray-700" />
            <p class="text-sm text-gray-500 dark:text-gray-400">hoặc</p>
            <hr class="w-full border-t border-[#CFCFCF] dark:border-gray-700" />
          </div>
          <button class="flex h-12 w-full items-center justify-center gap-3 rounded border border-[#CFCFCF] bg-white dark:bg-transparent dark:border-gray-600 dark:hover:bg-gray-800 text-base font-semibold text-[#111111] dark:text-white transition-colors hover:bg-gray-50" type="button">
            <svg class="h-5 w-5" fill="none" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"></path><path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"></path><path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l3.66-2.84z" fill="#FBBC05"></path><path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"></path></svg>
            Đăng kí bằng Google
          </button>
        </form>
        <div class="mt-8 text-center">
          <p class="text-sm text-[#111111] dark:text-[#FAFAFA]">
            Đã có tài khoản?
            <router-link to="/login" class="font-bold text-[#111111] hover:text-[#000000] dark:text-white dark:hover:text-primary">Đăng nhập</router-link>
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRegisterLogic } from '../stores/Register.js'

const { formData, error, success, handleRegister } = useRegisterLogic()
</script>

<style src="../assets/css/Register.css">
</style>
