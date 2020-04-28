/*
 * 菜单管理模块
 */

// 获取菜单树
export function findMenuTree() {
  const menuTreeData = {
    "code": 200,
    "msg": null,
    "data": [{
        "menuId": 1,
        "updateTime": '2019-01-03',
        "createTime": '2019-01-03',
        "parentId": 0,
        "menuName": "系统管理",
        "menuUrl": null,
        "type": 0,
        "checkFlag": 'true',
        "parentName": null,
        "level": 0,
        "children": [{
          "menuId": 2,
          "updateTime": '2019-01-03',
          "createTime": '2019-01-03',
          "parentId": 1,
          "menuName": "用户管理",
          "menuUrl": "/sys/user",
          "type": 1,
          "checkFlag": 'true',
          "parentName": "系统管理",
          "level": 1,
          "children": [{
            "menuId": 9,
            "updateTime": '2019-01-03',
            "createTime": '2019-01-03',
            "parentId": 2,
            "menuName": "查看",
            "menuUrl": null,
            "type": 2,
            "checkFlag": 'true',
            "parentName": "用户管理",
            "level": 2,
            "children": []
          }, {
            "menuId": 10,
            "updateTime": '2019-01-03',
            "createTime": '2019-01-03',
            "parentId": 2,
            "menuName": "新增",
            "menuUrl": null,
            "type": 2,
            "checkFlag": 'true',
            "parentName": "用户管理",
            "level": 2,
            "children": []
          }, {
            "menuId": 11,
            "updateTime": '2019-01-03',
            "createTime": '2019-01-03',
            "parentId": 2,
            "menuName": "修改",
            "menuUrl": null,
            "type": 2,
            "checkFlag": 'true',
            "parentName": "用户管理",
            "level": 2,
            "children": []
          }, {
            "menuId": 12,
            "updateTime": '2019-01-03',
            "createTime": '2019-01-03',
            "parentId": 2,
            "menuName": "删除",
            "menuUrl": null,
            "type": 2,
            "checkFlag": 'true',
            "parentName": "用户管理",
            "level": 2,
            "children": []
          }]
        }, {
          "menuId": 3,
          "updateTime": '2019-01-03',
          "createTime": '2019-01-03',
          "parentId": 1,
          "menuName": "机构管理",
          "menuUrl": "/sys/dept",
          "type": 1,
          "checkFlag": 'true',
          "parentName": "系统管理",
          "level": 1,
          "children": [{
            "menuId": 13,
            "updateTime": '2019-01-03',
            "createTime": '2019-01-03',
            "parentId": 3,
            "menuName": "查看",
            "menuUrl": null,
            "type": 2,
            "checkFlag": 'true',
            "parentName": "机构管理",
            "level": 2,
            "children": []
          }, {
            "menuId": 14,
            "updateTime": '2019-01-03',
            "createTime": '2019-01-03',
            "parentId": 3,
            "menuName": "新增",
            "menuUrl": null,
            "type": 2,
            "checkFlag": 'true',
            "parentName": "机构管理",
            "level": 2,
            "children": []
          }, {
            "menuId": 15,
            "updateTime": '2019-01-03',
            "createTime": '2019-01-03',
            "parentId": 3,
            "menuName": "修改",
            "menuUrl": null,
            "type": 2,
            "checkFlag": 'true',
            "parentName": "机构管理",
            "level": 2,
            "children": []
          }, {
            "menuId": 16,
            "updateTime": '2019-01-03',
            "createTime": '2019-01-03',
            "parentId": 3,
            "menuName": "删除",
            "menuUrl": null,
            "type": 2,
            "checkFlag": 'true',
            "parentName": "机构管理",
            "level": 2,
            "children": []
          }]
        }, {
          "menuId": 4,
          "updateTime": '2019-01-03',
          "createTime": '2019-01-03',
          "parentId": 1,
          "menuName": "角色管理",
          "menuUrl": "/sys/role",
          "type": 1,
          "checkFlag": 'true',
          "parentName": "系统管理",
          "level": 1,
          "children": [{
            "menuId": 17,
            "updateTime": '2019-01-03',
            "createTime": '2019-01-03',
            "parentId": 4,
            "menuName": "查看",
            "menuUrl": null,
            "type": 2,
            "checkFlag": 'true',
            "parentName": "角色管理",
            "level": 2,
            "children": []
          }, {
            "menuId": 18,
            "updateTime": '2019-01-03',
            "createTime": '2019-01-03',
            "parentId": 4,
            "menuName": "新增",
            "menuUrl": null,
            "type": 2,
            "checkFlag": 'true',
            "parentName": "角色管理",
            "level": 2,
            "children": []
          }, {
            "menuId": 19,
            "updateTime": '2019-01-03',
            "createTime": '2019-01-03',
            "parentId": 4,
            "menuName": "修改",
            "menuUrl": null,
            "type": 2,
            "checkFlag": 'true',
            "parentName": "角色管理",
            "level": 2,
            "children": []
          }, {
            "menuId": 20,
            "updateTime": '2019-01-03',
            "createTime": '2019-01-03',
            "parentId": 4,
            "menuName": "删除",
            "menuUrl": null,
            "type": 2,
            "checkFlag": 'true',
            "parentName": "角色管理",
            "level": 2,
            "children": []
          }]
        }, {
          "menuId": 5,
          "updateTime": '2019-01-03',
          "createTime": '2019-01-03',
          "parentId": 1,
          "menuName": "菜单管理",
          "menuUrl": "/sys/menus",
          "type": 1,
          "checkFlag": 'true',
          "parentName": "系统管理",
          "level": 1,
          "children": [{
            "menuId": 21,
            "updateTime": '2019-01-03',
            "createTime": '2019-01-03',
            "parentId": 5,
            "menuName": "查看",
            "menuUrl": null,
            "type": 2,
            "checkFlag": 'true',
            "parentName": "菜单管理",
            "level": 2,
            "children": []
          }, {
            "menuId": 22,
            "updateTime": '2019-01-03',
            "createTime": '2019-01-03',
            "parentId": 5,
            "menuName": "新增",
            "menuUrl": null,
            "type": 2,
            "checkFlag": 'true',
            "parentName": "菜单管理",
            "level": 2,
            "children": []
          }, {
            "menuId": 23,
            "updateTime": '2019-01-03',
            "createTime": '2019-01-03',
            "parentId": 5,
            "menuName": "修改",
            "menuUrl": null,
            "type": 2,
            "checkFlag": 'true',
            "parentName": "菜单管理",
            "level": 2,
            "children": []
          }, {
            "menuId": 24,
            "updateTime": '2019-01-03',
            "createTime": '2019-01-03',
            "parentId": 5,
            "menuName": "删除",
            "menuUrl": null,
            "type": 2,
            "checkFlag": 'true',
            "parentName": "菜单管理",
            "level": 2,
            "children": []
          }]
        }]
      }]
  }
  return {
    url: 'menu/findMenuTree',
    type: 'post',
    data: menuTreeData
  }
}

export function setParentName(data) {
  if (data == null) {
    return
  }
  let len = data.length
  for (let i = 0; i < len; i++) {
    let menu = data[i]
    menu.parentName = 'menu' + menu.parentId
    if (menu.children != null) {
      setParentName(menu.children)
    }
  }
}

export function deleteMenu() {
  let data = {
    "code": 200,
    "msg": null,
    "data": []
  }
  return {
    url: 'menu/delete',
    type: 'post',
    data: data
  }
}
export function save() {
  let data = {
    "code": 200,
    "msg": null,
    "data": []
  }
  return {
    url: 'menu/save',
    type: 'post',
    data: data
  }
}
export function edit() {
  let data = {
    "code": 200,
    "msg": null,
    "data": []
  }
  return {
    url: 'menu/edit',
    type: 'post',
    data: data
  }
}
