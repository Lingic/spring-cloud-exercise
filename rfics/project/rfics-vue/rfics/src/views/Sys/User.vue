<template>
  <div class="container" style="width:100%;">
    <!--工具栏-->
    <div class="toolbar" style="float:left; padding:18px;">
      <el-form :inline="true" :model="filters" size="small">
        <el-form-item>
          <el-input v-model="filters.name" placeholder="用户名"></el-input>
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
      <el-form :model="dataForm" label-width="80px" :rules="dataFormRules" ref="dataForm">
        <el-form-item label="用户编号" prop="userId" v-if="!operation">
          <el-input v-model="dataForm.userId" :disabled="true" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="用户名" prop="userName">
          <el-input v-model="dataForm.userName" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="登录名" prop="loginName">
          <el-input v-model="dataForm.loginName" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input v-model="dataForm.password" type="password" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="检查标识" prop="checkFlag">
          <el-input v-model="dataForm.checkFlag" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="机构" prop="deptName">
          <div>
            <el-popover ref="popover" placement="right-start" trigger="click">
              <el-tree :data="deptData" :props="deptTreeProps" :nodeKey="''+dataForm.organNo" ref="popupTree"
                @current-change="deptTreeCurrentChangeHandle" :default-expand-all="false" :highlight-current="true"
                :expand-on-click-node="true">
              </el-tree>
            </el-popover>
            <el-input v-model="dataForm.organName" :readonly="true" v-popover:popover placeholder="点击选择内容" style="cursor:pointer;"></el-input>
          </div>
        </el-form-item>
        <el-form-item label="角色" prop="userRoles" v-if="!operation">
          <el-select v-model="dataForm.userRoles" multiple placeholder="请选择" style="width: 100%;">
            <el-option v-for="item in roles" :key="item.id" :label="item.remark" :value="item.id">
            </el-option>
          </el-select>
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
          {prop:"userId", label:"用户编号", minWidth:40,sortable:false},
          {prop:"organNo", label:"机构编号", minWidth:40,sortable:false},
          {prop:"organName", label:"机构名称", minWidth:40,sortable:false},
          {prop:"userName", label:"用户名称", minWidth:40,sortable:false},
          {prop:"loginName", label:"登录名", minWidth:40,sortable:false},
          {prop:"checkFlag", label:"检查标识", minWidth:40,sortable:false},
          {prop:"userRoles", label:"角色", minWidth:50,sortable:false},
          {prop:"createTime", label:"创建时间", minWidth:60,sortable:false},
          {prop:"updateTime", label:"更新时间", minWidth:60,sortable:false},
          {prop:"remark", label:"备注", minWidth:70,sortable:false},
        ],
        pageResult: {},
        operation: false, // true:新增, false:编辑
        editDialogVisible: false, // 新增编辑界面是否显示
        editLoading: false,
        dataFormRules: {
          name: [{
            required: true,
            message: '请输入用户名',
            trigger: 'blur'
          }]
        },
        // 新增编辑界面数据
        dataForm: {
          userId: '',
          userName: '',
          loginName:'',
          password: '',
          checkFlag:'',
          organNo: '',
          organName: '',
          userRoles: [],
          remark:''
        },
        deptData: [],
        deptTreeProps: {
          label: 'organName',
          children: 'children'
        },
        roles: [],
        loading:false
      }
    },
    methods: {
      findPage:function(data){
        this.loading = true
        if(data != null){
          this.pageRequest = data.pageRequest
        }
          this.$api.user.findPage(Object.assign(this.pageRequest,{name:this.filters.name})).then((res) => {
            this.pageResult = res.data
            this.findUserRoles()
            this.loading=false
            return res
          }).then(data!=null?data.callback:'')
      },
      //选中数据变化
      handleSelectionChange:function(data){
      },
      //删除
      handleDelete: function (data) {
      	this.$api.user.batchDelete(data.params).then(data!=null?data.callback:'')
      },
      // 显示新增界面
      handleAdd: function() {
        this.editDialogVisible = true
        this.operation = true
        this.dataForm = {
          userId: '',
          userName: '',
          loginName:'',
          password: '',
          checkFlag:'',
          organNo: '',
          organName: '',
          userRoles: [],
          remark:''
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
                this.$api.user.save(params).then((res) => {
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
                this.$api.user.edit(params).then((res) => {
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
      // 获取部门列表
      findDeptTree: function() {
        this.$api.dept.findDeptTree().then((res) => {
          this.deptData = res.data
        })
      },
      // 加载用户角色信息
      findUserRoles: function() {
        this.$api.role.findAll().then((res) => {
          // 加载角色集合
          this.roles = res.data
        })
      },
      // 菜单树选中
      deptTreeCurrentChangeHandle: function(data, node) {
        console.log(data)
        this.dataForm.organNo = data.organNo
        this.dataForm.organName = data.organName
      }
    },
    mounted() {
      this.findDeptTree()
      this.findUserRoles()
    }
  }
</script>

<style scoped>

</style>
