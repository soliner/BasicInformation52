import Vue from 'vue'
import Router from 'vue-router'
import Homepage from '@/components/Homepage'
import Kefu from '@/components/kefu'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Homepage',
      component: Homepage
    },
    {
      path: '/kefu',
      name: 'Kefu',
      component: Kefu
    }
  ]
})
