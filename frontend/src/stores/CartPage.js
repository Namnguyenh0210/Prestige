import { defineStore } from 'pinia'
import { computed, ref } from 'vue'
import { useCartStore } from './cartStore'

export const useCartPageStore = defineStore('cartPage', () => {
  // Reactive data
  const voucherCode = ref('')
  const discount = ref(0)

  // Static order info (could be from auth or user store)
  const orderInfo = ref({
    fullName: 'Nguyen Van A',
    phone: '0901234567',
    address: '123 Duong ABC, Phuong 1, Quan 2, Thanh pho Ho Chi Minh',
    notes: '',
    shippingMethod: 'standard',
    paymentMethod: 'card'
  })

  // Imported cartStore
  const cartStore = useCartStore()

  // Computed properties
  const cartItems = computed(() => {
    return cartStore.items.length > 0 ? cartStore.items : [
      {
        id: 1,
        brand: 'MAISON ELITE',
        name: 'Oversized Poplin Shirt',
        size: 'Size: M',
        color: 'Color: White',
        quantity: 1,
        price: 3500000,
        alt: 'White oversized shirt',
        image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCCjRm4udgZD31GdcEpB4yjXNnv9pjZnmu2BTO0gEsaN80jdzWjVZ5iQvDNrPkOQHZ11PSDlSzsbgvf2ujVkqbB505XYbEP8Yxn0zkCcfRuxT3io4Rzv90GJlZuTdnlaVLIZ_3IQXz4AHI7dn8T4hdkwB9zVujtCp0sBwtrxWZdy3ro7RnM_jzfPEE_v3pGmrEu4r4KG8hyxveLc76VKtrpw_KnCxItFL_lvoKa_MpRZMRG6q5xdhHl1z0QR-mWgpMv6je_tspKeag'
      },
      {
        id: 2,
        brand: 'STUDIO REN',
        name: 'Wide-Leg Linen Trousers',
        size: 'Size: S',
        color: 'Color: Beige',
        quantity: 1,
        price: 4200000,
        alt: 'Beige wide-leg trousers',
        image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAd3rptzSO0M7vbHnIr5grTHX5Sy2s2tbMAw8LQfe9aalE1XOIoL0MZNsgcmnYsvo_-_e_4m996_CkHLLsL63hEMhbxuNpAZiUtbJwE8ASGAxQk1GbbyDNODxmEK9Ygw7xmdLteSJ0Ek_lDPGa3yeEPN2JPlQBAoddD5Evo3JthIFzyvmnPg9KNLws0ro3wj2hJoRUWEMDIlIkdyroH14XODcIcO-mYmWBamN1sfmFAWHldz1Jme00ksE2CLmzHJrxeJCvImCkE6Z4'
      }
    ]
  })

  const cartItemCount = computed(() => cartItems.value.length)

  const subtotal = computed(() => {
    return cartItems.value.reduce((sum, item) => sum + item.price * item.quantity, 0)
  })

  const shippingCost = computed(() => {
    return orderInfo.value.shippingMethod === 'express' ? 75000 : 50000
  })

  const total = computed(() => {
    return subtotal.value + shippingCost.value - discount.value
  })

  // Methods
  const formatPrice = (price) => {
    return new Intl.NumberFormat('vi-VN', {
      style: 'currency',
      currency: 'VND',
      minimumFractionDigits: 0
    }).format(price)
  }

  const increaseQuantity = (id) => {
    cartStore.increaseQuantity(id)
  }

  const decreaseQuantity = (id) => {
    cartStore.decreaseQuantity(id)
  }

  const removeItem = (id) => {
    cartStore.removeItem(id)
  }

  const applyVoucher = () => {
    // Mock voucher apply
    if (voucherCode.value === 'DISCOUNT10') {
      discount.value = subtotal.value * 0.1
    } else {
      discount.value = 0
    }
    voucherCode.value = ''
  }

  return {
    voucherCode,
    discount,
    orderInfo,
    cartItems,
    cartItemCount,
    subtotal,
    shippingCost,
    total,
    formatPrice,
    increaseQuantity,
    decreaseQuantity,
    removeItem,
    applyVoucher
  }
})
