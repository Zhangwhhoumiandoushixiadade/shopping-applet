import { createApp } from 'vue'
import App from './App.vue'
import store from './store'
import router from "./router";
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import '@/router/permission'
import { QuillEditor } from '@vueup/vue-quill'
import '@vueup/vue-quill/dist/vue-quill.snow.css';

const app = createApp(App)

app.component('QuillEditor', QuillEditor)


app.use(store).use(router).use(ElementPlus).mount('#app')
