import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from './authStore'
import { useCartStore } from './cartStore'
import { useToast } from 'vue-toastification'

export function useLoginLogic() {
  const router = useRouter()
  const authStore = useAuthStore()
  const cartStore = useCartStore()

  // Nếu đã đăng nhập mà vào trang login -> chuyển về home luôn
  if (authStore.isAuthenticated) {
    router.replace('/')
  }

  const emailOrPhone = ref('')
  const password = ref('')
  const remember = ref(false)
  const showPassword = ref(false)
  const error = ref('')
  const loading = ref(false)

  async function handleLogin() {
    const toast = useToast()
    error.value = ''
    loading.value = true
    console.log('[LoginPage] handleLogin start')

    const email = emailOrPhone.value.trim()
    const pass = password.value

    if (!email || !pass) {
      error.value = 'Vui lòng nhập đầy đủ thông tin'
      toast.warning(error.value)
      loading.value = false
      console.log('[LoginPage] Thiếu thông tin đầu vào')
      return
    }

    const result = await authStore.login(email, pass)
    console.log('[LoginPage] login result:', result)

    if (result.success) {
      toast.info('Đang đồng bộ giỏ hàng...')
      if (remember.value) localStorage.setItem('remember_email', email)
      else localStorage.removeItem('remember_email')

      try {
        console.log('[LoginPage] syncCart bắt đầu')
        await cartStore.syncCart()
        console.log('[LoginPage] syncCart xong')
        toast.success('Đồng bộ giỏ hàng hoàn tất')
      } catch (e) {
        console.warn('[LoginPage] syncCart lỗi, bỏ qua:', e)
        toast.error('Không đồng bộ được giỏ hàng: ' + (e.message || 'Lỗi không rõ'))
      }

      let redirect = '/'
      if (authStore.isAdmin) redirect = '/admin'
      console.log('[LoginPage] Điều hướng tới', redirect)
      toast.info('Chuyển hướng tới ' + redirect)
      router.push(redirect).catch(e => {
        console.warn('[LoginPage] router.push lỗi:', e)
        toast.error('Lỗi chuyển trang: ' + e.message)
      })

      setTimeout(() => {
        if (router.currentRoute.value.name === 'login') {
          console.warn('[LoginPage] Fallback cưỡng bức chuyển trang do vẫn ở /login')
          toast.warning('Trang không chuyển – thực hiện fallback...')
          window.location.href = redirect
        }
      }, 800)
    } else {
      error.value = result.message
      toast.error('Đăng nhập lỗi: ' + error.value)
      console.log('[LoginPage] Hiển thị lỗi:', error.value)
    }

    loading.value = false
    console.log('[LoginPage] handleLogin end')
  }

  function forgotPassword() {
    // Handle forgot password
    console.log('Forgot password clicked')
  }

  return {
    emailOrPhone,
    password,
    remember,
    showPassword,
    error,
    loading,
    handleLogin,
    forgotPassword
  }
}
