import axios from '../axios'

/*
 * 机构管理模块
 */

// 保存
export const save = (data) => {
    return axios({
        url: '/organs',
        method: 'post',
        data:data
    })
}
// 修改
export const edit = (data) => {
    return axios({
        url: '/dept/edit',
        method: 'post',
        data:data
    })
}
// 删除
export const batchDelete = (data) => {
    return axios({
        url: '/dept/delete',
        method: 'post',
        data:data
    })
}
// 查询机构树
export const findDeptTree = (data) => {
    return axios({
        url: '/dept/findTree',
        method: 'post',
        data:data
    })
}
