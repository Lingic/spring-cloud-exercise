<template>
  <div class="container" style="width:100%;">
    <!--工具栏-->
    <div class="toolbar" style="float:left; padding:18px;">
      <el-form :inline="true" :model="filters" size="small">
        <el-form-item>
          <el-input v-model="filters.name" placeholder="限行架名称"></el-input>
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
        :showBatchDelete='true' :showSelection='true' @handleSelectionChange='handleSelectionChange'
        @findPage="findPage" @handleEdit="handleEdit" @handleDelete="handleDelete"
        :loading = 'loading'>
      </wdf-table>
    </div>
    <!--新增编辑界面-->
    <el-dialog :title="operation?'新增':'编辑'" width="40%" :visible.sync="editDialogVisible" :close-on-click-modal="false">
      <el-form :model="dataForm" label-width="100px" :rules="dataFormRules" ref="dataForm">
        <el-form-item label="编号" prop="restrictNo" v-if="!operation">
          <el-input v-model="dataForm.restrictNo" :disabled="true" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="限行架名称" prop="restrictName">
          <el-input v-model="dataForm.restrictName" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="站点编号" prop="stationNo">
          <el-input v-model="dataForm.stationNo" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="站点名称" prop="stationName">
          <el-input v-model="dataForm.stationName" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="检查标识" prop="checkFlag">
          <el-input v-model="dataForm.checkFlag" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="dataForm.remark" auto-complete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click.native="editDialogVisible = false">取消</el-button>
        <el-button type="primary" @click.native="editSubmit" :loading="editLoading">提交</el-button>
      </div>
    </el-dialog>
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
          {prop:"restrictNo", label:"编号", minWidth:40,sortable:false},
          {prop:"restrictName", label:"限行架名称", minWidth:40,sortable:false},
          {prop:"stationNo", label:"站点编号", minWidth:40,sortable:false},
          {prop:"stationName", label:"站点名称", minWidth:40,sortable:false},
          {prop:"checkFlag", label:"检查标识", minWidth:40,sortable:false},
          {prop:"createTime", label:"创建时间", minWidth:40,sortable:false},
          {prop:"updateTime", label:"更新时间", minWidth:50,sortable:false},
          {prop:"remark", label:"备注", minWidth:60,sortable:false},
        ],
        pageResult: {},
        operation: false, // true:新增, false:编辑
        editDialogVisible: false, // 新增编辑界面是否显示
        editLoading: false,
        dataFormRules: {
          name: [{
            required: true,
            message: '请输入名称',
            trigger: 'blur'
          }]
        },
        // 新增编辑界面数据
        dataForm: {
          restrictNo: '',
          restrictName: '',
          stationNo:'',
          stationName: '',
          checkFlag:'',
          remark: '',
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
          this.$api.restrict.findPage(Object.assign(this.pageRequest,{name:this.filters.name})).then((res) => {
            this.pageResult = res.data
            this.loading=false
            return res
          }).then(data!=null?data.callback:'')
      },
      //选中数据变化
      handleSelectionChange:function(data){
      },
      //删除
      handleDelete: function (data) {
      	this.$api.restrict.batchDelete(data.params).then(data!=null?data.callback:'')
      },
      // 显示新增界面
      handleAdd: function() {
        this.editDialogVisible = true
        this.operation = true
        this.dataForm = {
          restrictNo: '',
          restrictName: '',
          stationNo:'',
          stationName: '',
          checkFlag:'',
          remark: '',
        }
      },
      // 显示编辑界面
      handleEdit: function(data) {
        this.editDialogVisible = true
        this.operation = false
        this.dataForm = Object.assign({}, data.row)
      },
      // 编辑
      editSubmit: function() {
        this.$refs.dataForm.validate((valid) => {
          if (valid) {
            this.$confirm('确认提交吗？', '提示', {}).then(() => {
              this.editLoading = true
              let params = Object.assign({}, this.dataForm)
              if(this.operation){
                this.$api.restrict.save(params).then((res) => {
                  this.editLoading = false
                  this.$message({
                    message: '提交成功',
                    type: 'success'
                  })
                  this.$refs['dataForm'].resetFields()
                  this.editDialogVisible = false
                  this.findPage(null)
                })
              }else{
                this.$api.restrict.edit(params).then((res) => {
                  this.editLoading = false
                  this.$message({
                    message: '提交成功',
                    type: 'success'
                  })
                  this.$refs['dataForm'].resetFields()
                  this.editDialogVisible = false
                  this.findPage(null)
                })
              }
            })
          }
        })
      },
    },
    mounted() {
    }
  }
</script>

<style scoped>

</style>
