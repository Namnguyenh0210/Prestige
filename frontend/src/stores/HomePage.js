import { ref } from 'vue'
import { useRouter } from 'vue-router'

export function useHomeLogic() {
  const router = useRouter()

  // Reactive data
  const heroImage = ref('https://via.placeholder.com/1920x1080?text=Luxury+Fashion+Hero')
  const newsletterEmail = ref('')
  const newsletterMessage = ref('')

  const collections = ref([
    {
      id: 'outerwear',
      title: 'Áo Khoác',
      image: 'https://via.placeholder.com/600x800?text=Outerwear'
    },
    {
      id: 'accessories',
      title: 'Phụ kiện',
      image: 'https://via.placeholder.com/600x800?text=Accessories'
    },
    {
      id: 'eveningwear',
      title: 'Trang phục Tối',
      image: 'https://via.placeholder.com/600x800?text=Eveningwear'
    }
  ]) // Temporarily using mock data until API is ready

  const newArrivals = ref([
    {
      id: 1,
      name: 'Túi Tote Classic',
      category: 'Phụ kiện',
      price: 890,
      image: 'https://via.placeholder.com/400x500?text=Tote+Bag'
    },
    {
      id: 2,
      name: 'Giày Sneaker',
      category: 'Giày',
      price: 450,
      image: 'https://via.placeholder.com/400x500?text=Sneakers'
    },
    {
      id: 3,
      name: 'Đầm Silk',
      category: 'Váy đầm',
      price: 620,
      image: 'https://via.placeholder.com/400x500?text=Silk+Dress'
    },
    {
      id: 4,
      name: 'Áo khoác London',
      category: 'Áo khoác',
      price: 1250,
      image: 'https://via.placeholder.com/400x500?text=Trench+Coat'
    }
  ]) // Temporarily using mock data until API is ready

  // Methods
  const formatPrice = (price) => {
    return new Intl.NumberFormat('vi-VN', {
      style: 'currency',
      currency: 'VND',
      minimumFractionDigits: 0
    }).format(price * 24000) // Assuming USD to VND conversion
  }

  const scrollToCollections = () => {
    document.getElementById('collections').scrollIntoView({behavior: 'smooth'})
  }

  const viewCategory = (categoryId) => {
    router.push('/product-brand')
  }

  const viewProduct = (productId) => {
    router.push({name: 'product-detail', params: {id: productId}})
  }

  const subscribe = async () => {
    try {
      // API call for newsletter subscription
      await new Promise(resolve => setTimeout(resolve, 1000)) // Mock API
      newsletterMessage.value = 'Đăng ký thành công!'
      newsletterEmail.value = ''
    } catch (error) {
      newsletterMessage.value = 'Có lỗi xảy ra. Vui lòng thử lại.'
    }
  }

  const mount = async () => {
    // Use mock data
  }

  return {
    heroImage,
    newsletterEmail,
    newsletterMessage,
    collections,
    newArrivals,
    formatPrice,
    scrollToCollections,
    viewCategory,
    viewProduct,
    subscribe,
    mount
  }
}
