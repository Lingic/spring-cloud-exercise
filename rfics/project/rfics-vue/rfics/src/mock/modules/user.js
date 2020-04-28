/*
 * 用户管理模块
 */

// 保存
export function save() {
  return {
    url: 'user/save',
    type: 'post',
    data: {
      "code": 200,
      "msg": null,
    }
  }
}
// 修改
export function edit() {
  return {
    url: 'user/edit',
    type: 'post',
    data: {
      "code": 200,
      "msg": null,
    }
  }
}
// 批量删除
export function batchDelete() {
  return {
    url: 'user/delete',
    type: 'post',
    data: {
      "code": 200,
      "msg": null,
    }
  }
}
// 分页查询
export function findPage(params) {
  let findPageData = {
    "code": 200,
    "msg": null,
    "data": {}
  }
  let pageNum = 1
  let pageSize = 8
  if(params !== null) {
    // pageNum = params.pageNum
  }
  if(params !== null) {
    // pageSize = params.pageSize
  }
  let content = this.getContent(pageNum, pageSize)
  findPageData.data.pageNum = pageNum
  findPageData.data.pageSize = pageSize
  findPageData.data.totalSize = 50
  findPageData.data.content = content
  return {
    url: 'user/findPage',
    type: 'post',
    params:params,
    data: findPageData
  }
}
export function getContent(pageNum, pageSize) {
  let content = []
  for(let i=0; i<pageSize; i++) {
    let obj = {}
    let index = ((pageNum - 1) * pageSize) + i + 1
    obj.userId = index
    obj.userName = 'userName'+i
    obj.loginName = 'userName'+ i
    obj.checkFlag = 'true'
    obj.userRoles = ['role1','role2']
    obj.createTime = '2018-08-14 11:11:11'
    if(i % 2 === 0) {
      obj.organNo = 13
      obj.organName = '市场部'
    }else{
      obj.organNo = 12
      obj.organName = '技术部'
    }
    obj.updateTime= '2018-08-14 11:11:11'
    obj.remark= '备注'
    content.push(obj)
  }
  return content
}
