import axios from '../axios'

/*
 * 
 */

export const edit = (data) => {
    return axios({
        url: '/car/edit',
        method: 'post',
        data:data
    })
}
// 删除
export const batchDelete = (data) => {
    return axios({
        url: '/car/delete',
        method: 'post',
        data:data
    })
}
// 分页查询
export const findPage = (data) => {
    return axios({
        url: '/car/findPage',
        method: 'post',
        data:data
    })
}
