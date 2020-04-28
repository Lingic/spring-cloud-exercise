/*
 * 机构管理模块
 */

// 保存
export function save() {
  return {
    url: 'dept/save',
    type: 'post',
    data: {
      "code": 200,
      "msg": null,
      "data": 1,
      'isOpen':false
    }
  }
}
// 修改
export function edit() {
  return {
    url: 'dept/edit',
    type: 'post',
    data: {
      "code": 200,
      "msg": null,
      "data": 1
    }
  }
}
// 批量删除
export function batchDelete() {
  return {
    url: 'dept/delete',
    type: 'post',
    data: {
      "code": 200,
      "msg": null,
      "data": 1
    }
  }
}
export function findDeptTree(params) {
  // 查询机构树
  let findTreeData = {
    "code": 200,
    "msg": null,
    "data": {}
  }
  let content = []
  for(let i=0; i<5; i++) {
    let obj = {}
    obj.organNo   = i + 1
    obj.parentNo   = 0
    obj.organName = '机构部门  ' + obj.organNo
    obj.parentName = ""
    obj.organDesc = "描述"
    obj.remark = "备注"
    obj.checkFlag = 'true'
    obj.createTime = "创建时间"
    obj.updateTime = "更新时间"
    obj.children = []
    content.push(obj)
  }
  for(let i=0; i<content.length; i++) {
    let parent = content[i]
    for(let j=0; j<3; j++) {
      let obj = {}
      obj.organNo = (i + 1) + "-" + (j + 1)
      obj.parentNo = parent.organNo
      obj.parentName = parent.organName
      obj.organName = '机构部门  ' + (i + 1) + "-" + (j + 1)
      obj.organDesc = "描述"
      obj.remark = "备注"
      obj.checkFlag = 'true'
      obj.createTime = "创建时间"
      obj.updateTime = "更新时间"
      parent.children.push(obj)
    }
  }
  findTreeData.data = content
  return {
    url: 'dept/findTree',
    type: 'post',
    data: findTreeData,
  }
}
