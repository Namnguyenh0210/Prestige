<template>
  <div class="relative flex h-auto min-h-screen w-full flex-col bg-brand-off-white dark:bg-background-dark group/design-root overflow-x-hidden font-display">
    <div class="flex flex-1 w-full">
      <div class="flex flex-col lg:flex-row w-full">
        <div class="hidden lg:block lg:w-1/2 relative">
          <div class="absolute inset-0 bg-center bg-no-repeat bg-cover" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuDsRkwoHclYd-zDt67R6RUTFK1a70eLo1LqQYce9e_oPoJWlmAGpnr1Kk7_qRAgbmPa6X4NAUts5g4nMv_X6CJtnJWehbp0PT7mB8tN7fC0fLkXZ72ka4n-tcfvyVeQIlxmF-cGUbHjkVXspiksEktzLFmSrC5YCGdgs4bOWe6LZ525iFpwgQKm9z8vtgt8HrMruRX-bNCoHOumWs9cLMiGeJj-kusQslmqYg_OJ7FmRk4L46YT03cKQOcgdZhwLi8Tl1nFJAzVYpU');"></div>
        </div>
        <div class="w-full lg:w-1/2 flex items-center justify-center p-8 lg:p-16">
          <div class="w-full max-w-md flex flex-col gap-8">
            <div class="flex flex-col gap-3 text-center">
              <p class="text-brand-dark-gray dark:text-white text-4xl font-black leading-tight tracking-[-0.033em]">Đăng Nhập</p>
              <p class="text-gray-500 dark:text-gray-400 text-base font-normal leading-normal">Chào mừng trở lại</p>
            </div>
            <form class="flex flex-col gap-6" @submit.prevent="handleLogin">
              <label class="flex flex-col w-full">
                <p class="text-brand-dark-gray dark:text-gray-300 text-base font-medium leading-normal pb-2">Số điện thoại hoặc Email</p>
                <input
                  v-model="emailOrPhone"
                  class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-lg text-brand-dark-gray dark:text-white dark:bg-background-dark focus:outline-0 focus:ring-2 focus:ring-brand-light-beige border border-brand-light-gray bg-white focus:border-brand-light-beige h-14 placeholder:text-gray-400 p-[15px] text-base font-normal leading-normal"
                  placeholder="Nhập số điện thoại hoặc email"
                />
              </label>
              <label class="flex flex-col w-full">
                <p class="text-brand-dark-gray dark:text-gray-300 text-base font-medium leading-normal pb-2">Mật khẩu</p>
                <div class="relative flex w-full flex-1 items-stretch rounded-lg">
                  <input
                    v-model="password"
                    :type="showPassword ? 'text' : 'password'"
                    class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-lg text-brand-dark-gray dark:text-white dark:bg-background-dark focus:outline-0 focus:ring-2 focus:ring-brand-light-beige border border-brand-light-gray bg-white focus:border-brand-light-beige h-14 placeholder:text-gray-400 p-[15px] text-base font-normal leading-normal"
                    placeholder="Nhập mật khẩu"
                  />
                  <button type="button" @click="showPassword = !showPassword" class="absolute inset-y-0 right-0 flex items-center pr-4 text-gray-500 hover:text-brand-dark-gray dark:hover:text-white">
                    <span class="material-symbols-outlined">visibility</span>
                  </button>
                </div>
              </label>
              <div class="flex justify-between items-center">
                <label class="flex gap-x-3 items-center cursor-pointer">
                  <input v-model="remember" type="checkbox" class="form-checkbox h-5 w-5 rounded border-brand-light-gray border-2 bg-transparent text-brand-deep-black checked:bg-brand-deep-black checked:border-brand-deep-black focus:ring-2 focus:ring-offset-2 focus:ring-offset-brand-off-white dark:focus:ring-offset-background-dark focus:ring-brand-light-beige focus:outline-none"/>
                  <p class="text-brand-dark-gray dark:text-gray-300 text-base font-normal leading-normal">Ghi nhớ đăng nhập</p>
                </label>
                <a class="text-sm font-medium text-brand-dark-gray dark:text-gray-300 hover:text-brand-deep-black dark:hover:text-white cursor-pointer" @click="forgotPassword">Quên mật khẩu?</a>
              </div>
              <button type="submit" class="flex items-center justify-center w-full h-14 px-6 py-3 rounded-lg bg-brand-deep-black text-white text-base font-bold uppercase tracking-wider hover:bg-opacity-90 transition-colors" :disabled="loading">
                {{ loading ? 'Đang đăng nhập...' : 'Đăng Nhập' }}
              </button>
              <button type="button" class="flex items-center justify-center w-full h-14 px-6 py-3 rounded-lg bg-white dark:bg-gray-800 text-brand-dark-gray dark:text-white text-base font-medium border border-brand-light-gray hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors">
                <img alt="Google logo" class="w-6 h-6 mr-3" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAsPxIsK6O4aFVnJErZKmC0savAjmvvZW3AXC_hOTIWlU_RacOBVDSdltaEVJPSi50hoLbD30aezPR9xOoQkO10ECK0dhHL6bi1Y_fR_FgULlp3bHdnnRRPsslNliYZTHvU8IoRHDUyJrS_nwYV1iK1co179CqNCNilbiMrjchOfsIVVBndBKPLZ5inQXQMXBOKMzla08A367oU2THt1uTshBpLqo0fccbITS-BRYJg5dUEgZ-vLGDbCfWmKZMhhc0VdbntLhmnnhM"/>
                Đăng nhập bằng Google
              </button>
              <div class="text-center">
                <p class="text-brand-dark-gray dark:text-gray-300 text-base font-normal">Bạn chưa có tài khoản? <router-link to="/register" class="font-bold hover:text-brand-deep-black dark:hover:text-white">Đăng ký ngay!</router-link></p>
              </div>
            </form>
            <div v-if="error" class="text-red-600 text-sm text-center">
              {{ error }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useLoginLogic } from '@/stores/LoginPage'

const { emailOrPhone, password, remember, showPassword, error, loading, handleLogin, forgotPassword } = useLoginLogic()
</script>

<style src="../assets/css/LoginPage.css">
</style>
