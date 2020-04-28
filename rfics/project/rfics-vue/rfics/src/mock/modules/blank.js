/*
 * 用户管理模块
 */

// 保存
export function save() {
  return {
    url: 'white/save',
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
    url: 'white/edit',
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
    url: 'white/delete',
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
    url: 'white/findPage',
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
    obj.carNo = index
    obj.checkFlag = 'true'
    obj.createTime = '2018-08-14 11:11:11'
    obj.updateTime= '2018-08-14 11:11:11'
    obj.remark= '备注'
    content.push(obj)
  }
  return content
}
