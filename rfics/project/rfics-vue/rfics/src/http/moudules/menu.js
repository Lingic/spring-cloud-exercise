import axios from '../axios'

/*
 * 菜单管理模块
 */

 // 保存
export const save = (data) => {
    return axios({
        url: '/menu/save',
        method: 'post',
        data:data
    })
}
 // 保存
export const edit = (data) => {
    return axios({
        url: '/menu/edit',
        method: 'post',
        data:data
    })
}
// 删除
export const batchDelete = (data) => {
    return axios({
        url: '/menu/delete',
        method: 'post',
        data:data
    })
}
// 查找导航菜单树
export const findMenuTree = (data) => {
    return axios({
        url: '/menu/findMenuTree',
        method: 'post',
        data:data
    })
}
