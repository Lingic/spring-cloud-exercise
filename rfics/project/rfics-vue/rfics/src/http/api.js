/*
 * 接口统一集成模块
 */
import * as login from './moudules/login'
import * as user from './moudules/user'
import * as dept from './moudules/dept'
import * as role from './moudules/role'
import * as menu from './moudules/menu'
import * as station from './moudules/station'
import * as restrict from './moudules/restrict'
import * as blank from './moudules/blank'
import * as white from './moudules/white'
import * as log from './moudules/log'
import * as car from './moudules/car'


// 默认全部导出
export default {
    login,
    user,
    dept,
	  role,
    menu,
    station,
    restrict,
    blank,
    white,
    log,
    car
}
