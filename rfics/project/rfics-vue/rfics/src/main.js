// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import store from './store'
import api from './http'
import ElementUI from 'element-ui'
import echarts from 'echarts'
import 'element-ui/lib/theme-chalk/index.css'
import 'font-awesome/css/font-awesome.min.css' //第三方图标

Vue.config.productionTip = false
Vue.use(api)
Vue.use(ElementUI)
Vue.prototype.global = global
Vue.prototype.$echarts = echarts
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
