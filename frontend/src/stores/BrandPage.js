import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'

export function useBrandLogic() {
  // Reactive data
  const router = useRouter()
  const heroImage = ref('https://via.placeholder.com/1920x1080?text=New+Season+Arrivals')

  // Filters
  const priceRange = ref(1250)
  const selectedSize = ref('M')
  const newProductsFilter = ref('all')
  const hotSale = ref(false)
  const memberSale = ref(false)
  const selectedGender = ref('nu')
  const sortBy = ref('popularity')
  const currentPage = ref(1)
  const itemsPerPage = ref(9)

  // Sizes
  const sizes = ref(['S', 'M', 'L', 'XL'])

  // Mock products
  const products = ref([
    {
      id: 1,
      name: 'Áo khoác Classic',
      brand: 'Tên thương hiệu',
      price: '$1,250.00',
      image: 'https://via.placeholder.com/400x500?text=Trench+Coat'
    },
    {
      id: 2,
      name: 'Áo lót lỗ blend',
      brand: 'Tên thương hiệu',
      price: '$450.00',
      image: 'https://via.placeholder.com/400x500?text=Silk+Blouse'
    },
    {
      id: 3,
      name: 'Giày boot da cổ cao',
      brand: 'Tên thương hiệu',
      price: '$890.00',
      image: 'https://via.placeholder.com/400x500?text=Leather+Boots'
    },
    {
      id: 4,
      name: 'Túi tote có cấu trúc',
      brand: 'Tên thương hiệu',
      price: '$995.00',
      image: 'https://via.placeholder.com/400x500?text=Structured+Tote'
    },
    {
      id: 5,
      name: 'Khăn len Cashmere',
      brand: 'Tên thương hiệu',
      price: '$220.00',
      image: 'https://via.placeholder.com/400x500?text=Cashmere+Scarf'
    },
    {
      id: 6,
      name: 'Quần len len may đo',
      brand: 'Tên thương hiệu',
      price: '$680.00',
      image: 'https://via.placeholder.com/400x500?text=Tailored+Wool+Trousers'
    }
  ])

  // Computed properties
  const filteredProducts = computed(() => {
    // Simple mock filtering - in real app, apply filters properly
    return products.value.slice(0, itemsPerPage.value)
  })

  const totalPages = computed(() => {
    return Math.ceil(products.value.length / itemsPerPage.value)
  })

  const paginatedPages = computed(() => {
    const pages = []
    const maxPages = 8
    if (totalPages.value <= maxPages) {
      for (let i = 1; i <= totalPages.value; i++) {
        pages.push(i)
      }
    } else {
      if (currentPage.value <= 4) {
        for (let i = 1; i <= 5; i++) {
          pages.push(i)
        }
        pages.push('...')
        pages.push(totalPages.value)
      } else if (currentPage.value >= totalPages.value - 3) {
        pages.push(1)
        pages.push('...')
        for (let i = totalPages.value - 4; i <= totalPages.value; i++) {
          pages.push(i)
        }
      } else {
        pages.push(1)
        pages.push('...')
        for (let i = currentPage.value - 1; i <= currentPage.value + 1; i++) {
          pages.push(i)
        }
        pages.push('...')
        pages.push(totalPages.value)
      }
    }
    return pages.filter(p => p !== '...' || typeof p !== 'string')
  })

  // Methods
  const resetFilters = () => {
    priceRange.value = 1250
    selectedSize.value = 'M'
    newProductsFilter.value = 'all'
    hotSale.value = false
    memberSale.value = false
    selectedGender.value = 'nu'
  }

  const addToCart = (product: any) => {
    console.log('Add to cart:', product)
    // TODO: Implement add to cart logic
  }

  const mount = () => {
    // TODO: Fetch products from API
  }

  return {
    heroImage,
    priceRange,
    selectedSize,
    newProductsFilter,
    hotSale,
    memberSale,
    selectedGender,
    sortBy,
    currentPage,
    itemsPerPage,
    sizes,
    products,
    filteredProducts,
    totalPages,
    paginatedPages,
    resetFilters,
    addToCart,
    mount
  }
}
