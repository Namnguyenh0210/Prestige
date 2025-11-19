import { ref, computed } from 'vue'

export function useBlogLogic() {
  // Data
  const activeFilter = ref('all')

  const featuredArticles = ref([
    {
      id: 1,
      title: 'Phỏng vấn với Nhà Thiết kế Tài Ba',
      excerpt: 'Khám phá nguồn cảm hứng đằng sau bộ sưu tập mới nhất đang làm say đắm thế giới thời trang.',
      image: 'https://via.placeholder.com/400x350?text=Designer+Interview',
      link: '#'
    },
    {
      id: 2,
      title: 'Thu Đông 2024: Phân tích Bộ sưu tập',
      excerpt: 'Phân tích các xu hướng chính và những món đồ phải có trong mùa thu đông năm nay.',
      image: 'https://via.placeholder.com/400x350?text=Autumn+Lookbook',
      link: '#'
    }
  ])

  const brands = ref([
    { name: 'Chanel', logo: 'https://via.placeholder.com/100x100?text=Chanel' },
    { name: 'Dior', logo: 'https://via.placeholder.com/100x100?text=Dior' },
    { name: 'Gucci', logo: 'https://via.placeholder.com/100x100?text=Gucci' },
    { name: 'Prada', logo: 'https://via.placeholder.com/100x100?text=Prada' },
    { name: 'Versace', logo: 'https://via.placeholder.com/100x100?text=Versace' },
    { name: 'Fendi', logo: 'https://via.placeholder.com/100x100?text=Fendi' }
  ])

  const filters = ref([
    { key: 'all', label: 'Tất cả' },
    { key: 'men', label: 'Thời trang Nam' },
    { key: 'women', label: 'Thời trang Nữ' }
  ])

  const articles = ref([
    {
      id: 1,
      category: 'Thời trang Nam',
      title: 'Phòng ăn của Người đàn ông hiện đại',
      excerpt: 'Những món đồ thiết yếu định hình thời trang nam hiện đại và nâng cao mọi diện mạo.',
      image: 'https://via.placeholder.com/400x350?text=Mens+Wards'
    },
    {
      id: 2,
      category: 'Thời trang Nữ',
      title: 'Màu sắc Táo Bạo và Thời trang Chỉnh nịch',
      excerpt: 'Cách kết hợp màu sắc tươi sáng với trang phục để tạo hình ảnh tự tin.',
      image: 'https://via.placeholder.com/400x350?text=Bold+Colors'
    },
    {
      id: 3,
      category: 'Phụ kiện',
      title: 'Nghệ thuật đồng hồ cao cấp',
      excerpt: 'Khám phá về thủ công và di sản đằng sau những chiếc đồng hồ danh tiếng.',
      image: 'https://via.placeholder.com/400x350?text=Luxury+Watches'
    },
    {
      id: 4,
      category: 'Thời trang Nữ',
      title: 'Trang sức Thuận chất: Ít hơn là Nhiều hơn',
      excerpt: 'Sức mạnh tinh tế của trang sức tinh tế và cách hòa quyện để tác động tối đa.',
      image: 'https://via.placeholder.com/400x350?text=Minimalist+Jewelry'
    },
    {
      id: 5,
      category: 'Thời trang Nam',
      title: 'Hướng dẫn Giày dép Nam hoàn hảo',
      excerpt: 'Từ Oxford cổ điển đến sneaker hiện đại, đánh giá về các phong cách giày thiết yếu.',
      image: 'https://via.placeholder.com/400x350?text=Mens+Footwear'
    },
    {
      id: 6,
      category: 'Mỹ phẩm',
      title: 'Tìm Mùi hương Chữ ký của Bạn',
      excerpt: 'Lời khuyên của chuyên gia về việc điều hướng thế giới nước hoa cao cấp.',
      image: 'https://via.placeholder.com/400x350?text=Signature+Scent'
    }
  ])

  // Computed
  const filteredArticles = computed(() => {
    if (activeFilter.value === 'all') {
      return articles.value
    }
    if (activeFilter.value === 'men') {
      return articles.value.filter(article => article.category === 'Thời trang Nam')
    }
    if (activeFilter.value === 'women') {
      return articles.value.filter(article => article.category === 'Thời trang Nữ')
    }
    return articles.value
  })

  return {
    activeFilter,
    featuredArticles,
    brands,
    filters,
    articles,
    filteredArticles
  }
}
