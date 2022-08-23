import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView'
Vue.use(VueRouter)

const routes = [
  {
    path:'/',
    redirect:'/home/index',
    meta:{
      title:'雪糕刺客app首页',
    }
  },
  {
    path:'/home',
    name:'home',
    component:HomeView,
    children:[{
      path: 'index',
      component:()=>import('../views/Index.vue')
    },{
      path: 'shopcar',
      component:()=>import('../views/Shopcar.vue')
    },]
  },
  {
    path:'/login',
    name:'Login',
    component:()=>import('../views/Login.vue')
  },
  {
    path:'/register',
    name:'Register',
    component:()=>import('../views/Register.vue')
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})
router.beforeEach((to,from,next)=>{
  document.title = to.meta.title
  next()//党性：让路由继续工作
})
export default router
