import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from '../views/Index.vue'
import Register from '../views/Register.vue'
import Register_success from '../views/Register_success.vue'
import Login from '../views/Login.vue'
import Songlist from '../views/Songlist.vue'
import Song from '../views/Song.vue'
import Album from '../views/Album.vue'
import Singer from '../views/Singer.vue'
import Me from '../views/Me.vue'
import MyMessage from '../views/MyMessage.vue'



Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    component: Index
  },
  {
    path: '/register',
    component: Register
  },
  {
    path: '/register/success',
    component: Register_success
  },
  {
    path: '/login',
    component: Login
  },
  {
    path: '/songlist/:id',
    component: Songlist
  },
  {
    path: '/song/:id',
    component: Song
  },
  {
    path: '/album/:id',
    component: Album
  },
  {
    path: '/singer/:id',
    component: Singer
  },
  {
    path:'/me',
    component: Me
  },
  {
    path:'/mymessage',
    component: MyMessage
  },
]

const router = new VueRouter({
  mode:'hash',
  routes
})

export default router
