import axios from '../axios'

/*
 * 用户管理模块
 */

// 保存
export const save = (data) => {
    return axios({
        url: '/user/save',
        method: 'post',
        data:data
    })
}
// 保存
export const edit = (data) => {
    return axios({
        url: '/user/edit',
        method: 'post',
        data:data
    })
}
// 删除
export const batchDelete = (data) => {
    return axios({
        url: '/user/delete',
        method: 'post',
        data:data
    })
}
// 分页查询
export const findPage = (data) => {
    return axios({
        url: '/user/findPage',
        method: 'post',
        data:data
    })
}
// 查找用户的菜单权限标识集合
export const findPermissions = (params) => {
    return axios({
        url: '/user/findPermissions',
        method: 'get',
        data:params
    })
}
