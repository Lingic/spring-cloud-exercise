import axios from '../axios'

/*
 * 用户管理模块
 */

// 保存
export const save = (data) => {
    return axios({
        url: '/white/save',
        method: 'post',
        data:data
    })
}
// 保存
export const edit = (data) => {
    return axios({
        url: '/white/edit',
        method: 'post',
        data:data
    })
}
// 删除
export const batchDelete = (data) => {
    return axios({
        url: '/white/delete',
        method: 'post',
        data:data
    })
}
// 分页查询
export const findPage = (data) => {
    return axios({
        url: '/white/findPage',
        method: 'post',
        data:data
    })
}
