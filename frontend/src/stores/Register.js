import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/authStore.js'

export function useRegisterLogic() {
  const router = useRouter()
  const authStore = useAuthStore()

  const formData = ref({
    hoTen: '',
    email: '',
    soDienThoai: '',
    matKhau: ''
  })

  const error = ref('')
  const success = ref(false)

  async function handleRegister() {
    error.value = ''
    success.value = false

    const result = await authStore.register(formData.value)

    if (result.success) {
      success.value = true
      setTimeout(() => {
        router.push('/login')
      }, 2000)
    } else {
      error.value = result.message
    }
  }

  return { formData, error, success, handleRegister }
}
