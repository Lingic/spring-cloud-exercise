import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/views/Login'
import User from '@/views/Sys/User'
import Role from '@/views/Sys/Role'
import Menu from '@/views/Sys/Menu'
import Dept from '@/views/Sys/Dept'
import Station from '@/views/Sys/Station'
import Restrict from '@/views/Sys/Restrict'
import BlankList from '@/views/Sys/BlankList'
import WhiteList from '@/views/Sys/WhiteList'
import Car from '@/views/Sys/Car'
import Log from '@/views/Sys/Log'
import Home from '@/views/Home'
Vue.use(Router)

export default new Router({
  routes: [
	  {
		path: '/home',
		name: '首页',
		component: Home,
    children: [
      { path: '/home/user', component: User, name: '用户管理' },
      { path: '/home/role', component: Role, name: '角色管理' },
      { path: '/home/menus', component: Menu, name: '菜单管理' },
      { path: '/home/dept', component: Dept, name: '部门管理' },
      { path: '/home/station', component: Station, name: '监测站管理' },
      { path: '/home/restrict', component: Restrict, name: '限行架' },
      { path: '/home/blank', component: BlankList, name: '黑名单' },
      { path: '/home/white', component: WhiteList, name: '白名单' },
      { path: '/home/log', component: Log, name: '操作记录' },
      { path: '/home/cars', component: Car, name: '车辆管理' },
    ]
	  },
    {
      // path: '/login',
      path: '/',
      name: '登录',
      component: Login
    },
  ]
})
