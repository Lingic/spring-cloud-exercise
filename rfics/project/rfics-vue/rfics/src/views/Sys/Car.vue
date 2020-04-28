<template>
  <div class="container" style="width:100%;">
    <!--工具栏-->
    <div class="toolbar" style="float:left; padding:18px;">
      <el-form :inline="true" :model="filters" size="small">
        <el-form-item>
          <el-input v-model="filters.name" placeholder="车辆编号"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" v-on:click="findPage(null)">查询</el-button>
        </el-form-item>
        <el-form-item>
          <el-button label="新增" type="primary" @click="handleAdd">新增</el-button>
        </el-form-item>
      </el-form>
    </div>
    <!--表格栏-->
    <div>
      <wdf-table :columns='columns' :data='pageResult' :showOperation='true'
        :showBatchDelete='false' :showSelection='false' @findPage="findPage" :loading = 'loading' width = 200>
        <template v-slot:operation="data" >
          <el-button icon="fa fa-edit" size="mini" @click="handleEdit(scope.$index, scope.row)">黑名单</el-button>
          <el-button icon="fa fa-trash" size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">白名单</el-button>
        </template>
      </wdf-table>
    </div>
  </div>
</template>

<script>
  import mock from "@/mock/index"
  import WdfTable from "@/components/WdfTable"
  export default {
    components:{
      WdfTable
    },
    data() {
      return {
        filters: {
          name: ''
        },
        columns: [
          {prop:"carNo", label:"车辆编号", width:100,sortable:false},
          {prop:"checkNo", label:"预检序号", width:100,sortable:false},
          {prop:"checkTime", label:"预检时间", width:150,sortable:false},
          {prop:"stationNo", label:"检测站号", width:100,sortable:false},
          {prop:"truckNo", label:"车牌号", width:80,sortable:false},
          {prop:"axisNum", label:"轴数", width:60,sortable:false},
          {prop:"speed", label:"车速", width:60,sortable:false},
          {prop:"totalWeight", label:"总重", width:60,sortable:false},
          {prop:"overLimit", label:"超重", width:60,sortable:false},
          {prop:"overRate", label:"超重率", width:60,sortable:false},
          {prop:"weightLimit", label:"车货限重", width:80,sortable:false},
          {prop:"direction", label:"方向", width:60,sortable:false},
          {prop:"trafficDir", label:"车流方向", width:80,sortable:false},
          {prop:"length", label:"长度", width:60,sortable:false},
          {prop:"width", label:"宽度", width:60,sortable:false},
          {prop:"height", label:"高度", width:60,sortable:false},
          {prop:"overLength", label:"超长", width:60,sortable:false},
          {prop:"overWith", label:"超宽", width:60,sortable:false},
          {prop:"overHeight", label:"超高", width:60,sortable:false},
          {prop:"orgNo", label:"机构编号", width:80,sortable:false},
          {prop:"checkFlag", label:"检查标识", width:80,sortable:false},
          {prop:"createTime", label:"创建时间", width:150,sortable:false},
          {prop:"updateTime", label:"更新时间", width:150,sortable:false},
          {prop:"remark", label:"备注", width:70,sortable:false},
        ],
        pageResult: {},
        dataFormRules: {
          name: [{
            required: true,
            message: '请输入用户名',
            trigger: 'blur'
          }]
        },
        loading:false
      }
    },
    methods: {
      findPage:function(data){
        this.loading = true
        if(data != null){
          this.pageRequest = data.pageRequest
        }
          this.$api.car.findPage(Object.assign(this.pageRequest,{name:this.filters.name})).then((res) => {
            this.pageResult = res.data
            this.loading=false
            return res
          }).then(data!=null?data.callback:'')
      },

      handleAdd: function() {

      },
      handleEdit: function(data) {

      },
    },
    mounted() {
    }
  }
</script>

<style scoped>

</style>
