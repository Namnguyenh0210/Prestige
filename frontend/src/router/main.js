import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from '../App.vue'
import router from './index.js'
import '../assets/css/main.css'
import Toast from 'vue-toastification'
import 'vue-toastification/dist/index.css'

const app = createApp(App)

app.use(createPinia())
app.use(router)
app.use(Toast, {
  position: 'top-right',
  timeout: 3500,
  closeOnClick: true,
  pauseOnHover: true,
  hideProgressBar: false,
  draggable: true
})

app.mount('#app')
