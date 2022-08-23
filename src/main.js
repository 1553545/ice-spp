import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import MintUI from 'mint-ui'
import 'mint-ui/lib/style.css'
import Vant from 'vant';
import 'vant/lib/index.css';
import { NavBar } from 'vant';
import axios from 'axios'
import VueAxios from 'vue-axios'
Vue.use(VueAxios,axios)
axios.defaults.baseURL="http://localhost:5000"
Vue.use(NavBar);
Vue.use(Vant);
Vue.config.productionTip = false
Vue.use(MintUI)
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
