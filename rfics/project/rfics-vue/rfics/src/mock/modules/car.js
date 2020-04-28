/*
 * 车辆管理模块
 */

// 黑名单
export function edit() {
  return {
    url: 'car/blank',
    type: 'post',
    data: {
      "code": 200,
      "msg": null,
    }
  }
}
// 白名单
export function batchDelete() {
  return {
    url: 'car/white',
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
    url: 'car/findPage',
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
    obj.checkNo = index
    obj.checkTime = '2018-08-14 11:11:11'
    obj.stationNo = index
    obj.truckNo = 'MKJ1948'
    obj.axisNum = 4
    obj.speed = 120
    obj.totalWeight = 100
    obj.overLimit = 20
    obj.overRate = 2
    obj.weightLimit = 80
    obj.direction = '南北'
    obj.trafficDir = '东西'
    obj.length = 12
    obj.width = 4
    obj.height = 5
    obj.overLength = 1
    obj.overWith = 1
    obj.overHeight = 1
    obj.orgNo = index
    obj.checkFlag ='true'
    obj.createTime = '2018-08-14 11:11:11'
    obj.updateTime= '2018-08-14 11:11:11'
    obj.remark= '备注'
    content.push(obj)
  }
  return content
}
