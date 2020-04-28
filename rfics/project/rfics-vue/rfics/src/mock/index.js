import Mock from 'mockjs'
import { baseUrl } from '@/utils/global'
import * as login from './modules/login'
import * as user from './modules/user'
import * as dept from './modules/dept'
import * as role from './modules/role'
import * as menu from './modules/menu'
import * as station from './modules/station'
import * as restrict from './modules/restrict'
import * as blank from './modules/blank'
import * as white from './modules/white'
import * as log from './modules/log'
import * as car from './modules/car'



// 1. 开启/关闭[所有模块]拦截, 通过调[openMock参数]设置.
// 2. 开启/关闭[业务模块]拦截, 通过调用fnCreate方法[isOpen参数]设置.
// 3. 开启/关闭[业务模块中某个请求]拦截, 通过函数返回对象中的[isOpen属性]设置.
// let openMock = true
let openMock = true
fnCreate(login, openMock)
fnCreate(user, openMock)
fnCreate(dept, openMock)
fnCreate(role, openMock)
fnCreate(menu, openMock)
fnCreate(station, openMock)
fnCreate(restrict, openMock)
fnCreate(blank, openMock)
fnCreate(white, openMock)
fnCreate(log, openMock)
fnCreate(car, openMock)


/**
 * 创建mock模拟数据
 * @param {*} mod 模块
 * @param {*} isOpen 是否开启?
 */
function fnCreate (mod, isOpen = true) {

  if (isOpen) {
    for (var key in mod) {
      ((res) => {
        if (res.isOpen !== false) {
          let url = baseUrl
          if(!url.endsWith("/")) {
            url = url + "/"
          }
          url = url + res.url
          Mock.mock(new RegExp(url), res.type, (opts) => {
            console.log('\n')
            console.log('%cmock拦截, 请求: ', 'color:blue', opts)
            console.log('%cmock拦截, 响应: ', 'color:blue', res.data)
            return res.data
          })
        }
      })(mod[key]() || {})
    }
  }
}
