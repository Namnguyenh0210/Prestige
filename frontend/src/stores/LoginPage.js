import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from './authStore'
import { useCartStore } from './cartStore'

export function useLoginLogic() {
  const router = useRouter()
  const authStore = useAuthStore()
  const cartStore = useCartStore()

  const emailOrPhone = ref('')
  const password = ref('')
  const remember = ref(false)
  const showPassword = ref(false)
  const error = ref('')
  const loading = ref(false)

  async function handleLogin() {
    error.value = ''
    loading.value = true

    const result = await authStore.login(emailOrPhone.value, password.value, remember.value)

    if (result.success) {
      await cartStore.syncCart()
      router.push('/')
    } else {
      error.value = result.message
    }

    loading.value = false
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
