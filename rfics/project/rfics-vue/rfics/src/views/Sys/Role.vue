<template>
  <div class="page-container">
	<!--工具栏-->
	<div class="toolbar" style="float:left;padding-top:10px;padding-left:15px;">
		<el-form :inline="true" :model="filters" size="mini">
			<el-form-item>
				<el-input v-model="filters.name" placeholder="角色名"></el-input>
			</el-form-item>
			<el-form-item>
				<el-button icon="fa fa-search" label="查询"  type="primary" @click="findPage(null)">查询</el-button>
			</el-form-item>
			<el-form-item>
				<el-button icon="fa fa-plus" label="新增"  type="primary" @click="handleAdd">新增</el-button>
			</el-form-item>
		</el-form>
	</div>
	<!--表格栏-->
  <div>
    <el-table :data="pageResult.content" :highlight-current-row="true" @current-change="handleRoleSelectChange"
    v-loading="loading" element-loading-text="加载中" stripe :show-overflow-tooltip="true" size="mini" align="left" style="width:100%;" >
      <el-table-column v-for="column in columns" header-align="center" align="center"
        :prop="column.prop" :label="column.label" :width="column.width" :min-width="column.minWidth"
        :fixed="column.fixed" :key="column.prop" :type="column.type" :formatter="column.formatter"
        :sortable="column.sortable==null?true:column.sortable">
      </el-table-column>
      <el-table-column label="操作" width="185" fixed="right" v-if="showOperation" header-align="center" align="center">
        <template slot-scope="scope">
          <el-button icon="fa fa-edit" label="修改"  size="mini" @click="handleEdit(scope.$index, scope.row)">修改</el-button>
          <el-button icon="fa fa-trash" label="删除"  size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!--分页栏-->
    <div class="toolbar" style="padding:10px;">
      <el-pagination layout="total, prev, pager, next, jumper" @current-change="refreshPageRequest"
        :current-page="pageRequest.pageNum" :page-size="pageRequest.pageSize" :total="pageResult.totalSize" style="float:right;">
      </el-pagination>
    </div>
  </div>
	<!-- </el-col> -->
	<!--新增编辑界面-->
	<el-dialog :title="operation?'新增':'编辑'" width="40%" :visible.sync="dialogVisible" :close-on-click-modal="false">
		<el-form :model="dataForm" label-width="80px" :rules="dataFormRules" ref="dataForm" size="mini">
			<el-form-item label="编号" prop="roleId" v-if="!operation">
				<el-input v-model="dataForm.roleId" :disabled="true" auto-complete="off"></el-input>
			</el-form-item>
			<el-form-item label="角色名" prop="roleName">
				<el-input v-model="dataForm.roleName" auto-complete="off"></el-input>
			</el-form-item>
      <el-form-item label="检查标识" prop="checkFlag">
      	<el-input v-model="dataForm.checkFlag" auto-complete="off"></el-input>
      </el-form-item>
			<el-form-item label="备注 " prop="remark">
				<el-input v-model="dataForm.remark" auto-complete="off" type="textarea"></el-input>
			</el-form-item>
		</el-form>
		<div slot="footer" class="dialog-footer">
			<el-button size="mini" @click.native="dialogVisible = false">取消</el-button>
			<el-button size="mini" type="primary" @click.native="submitForm" :loading="editLoading">提交</el-button>
		</div>
	</el-dialog>
	<!--角色菜单，表格树内容栏-->
	<div class="menu-container" :v-if="true">
		<div class="menu-header">
			<span><B>角色菜单授权</B></span>
		</div>
		<el-tree :data="menuData" size="mini" show-checkbox node-key="id" :props="defaultProps"
			style="width: 100%;pading-top:20px;" ref="menuTree" :render-content="renderContent"
			v-loading="menuLoading" element-loading-text="拼命加载中" :check-strictly="true"
			@check-change="handleMenuCheckChange">
		</el-tree>
		<div style="float:left;padding-left:24px;padding-top:12px;padding-bottom:4px;">
			<el-checkbox v-model="checkAll" @change="handleCheckAll" :disabled="this.selectRole.id == null"><b>全选</b></el-checkbox>
		</div>
		<div style="float:right;padding-right:15px;padding-top:4px;padding-bottom:4px;">
			<el-button label="重置" type="primary" @click="resetSelection"
				:disabled="this.selectRole.id == null">重置</el-button>
			<el-button label="提交" type="primary" @click="submitAuthForm"
				:disabled="this.selectRole.id == null" :loading="authLoading">提交</el-button>
		</div>
	</div>
  </div>
</template>

<script>
export default {
	data() {
		return {
      showOperation:true,
			filters: {
				name: ''
			},
			columns: [
				{prop:"roleId", label:"编号", minWidth:20},
				{prop:"roleName", label:"角色名称", minWidth:50},
				{prop:"checkFlag", label:"检查标识", minWidth:50},
				{prop:"createTime", label:"创建时间", minWidth:50},
				{prop:"updateTime", label:"更新时间", minWidth:50,},
        {prop:"remark", label:"备注", minWidth:50,}
			],
			pageRequest: { pageNum: 1, pageSize: 10 },
			pageResult: {},

			operation: false, // true:新增, false:编辑
			dialogVisible: false, // 新增编辑界面是否显示
			editLoading: false,
			dataFormRules: {
				name: [
					{ required: true, message: '请输入角色名', trigger: 'blur' }
				]
			},
			// 新增编辑界面数据
			dataForm: {
				roleId: '',
				roleName: '',
				checkFlag: '',
        remark:''
			},
			selectRole: {},
			menuData: [],
			menuSelections: [],
			menuLoading: false,
			authLoading: false,
			checkAll: false,
			currentRoleMenus: [],
			defaultProps: {
				children: 'children',
				label: 'name'
			},
      loading:false,
      selections:[]
		}
	},
	methods: {
		// 获取分页数据
		findPage: function () {
      this.loading = true
			this.$api.role.findPage(Object.assign({name:this.filters.name},this.pageRequest)).then((res) => {
				this.pageResult = res.data
				this.findTreeData()
        this.loading=false
			})
		},
    // 换页刷新
    refreshPageRequest: function (pageNum) {
      this.pageRequest.pageNum = pageNum
      this.findPage()
    },
		// 删除
		handleDelete : function (index,row) {
      this.$confirm("确认删除选中记录吗？", "提示", {
        type: "warning"
      }).then(() =>{
      this.$api.role.batchDelete(row).then(res => {
        if(res.code == 200) {
          this.$message({message: '删除成功', type: 'success'})
          this.findPage()
        } else {
          this.$message({message: '操作失败, ' + res.msg, type: 'error'})
        }
        this.loading = false
      })
      })
		},
		// 显示新增界面
		handleAdd: function () {
			this.dialogVisible = true
			this.operation = true
			this.dataForm = {
				roleId: '',
				roleName: '',
				checkFlag: '',
        remark:''
			}
		},
		// 显示编辑界面
		handleEdit: function (index, row) {
			this.dialogVisible = true
			this.operation = false
			this.dataForm = Object.assign({},row)
		},
		// 编辑
		submitForm: function () {
			this.$refs.dataForm.validate((valid) => {
				if (valid) {
					this.$confirm('确认提交吗？', '提示', {}).then(() => {
						this.editLoading = true
						let params = Object.assign({}, this.dataForm)
						if(this.operation){
              this.$api.role.save(params).then((res) => {
              	this.editLoading = false
              	if(res.code == 200) {
              		this.$message({ message: '操作成功', type: 'success' })
              		this.dialogVisible = false
              		this.$refs['dataForm'].resetFields()
              	} else {
              		this.$message({message: '操作失败, ' + res.msg, type: 'error'})
              	}
              	this.findPage(null)
              })
            }else{
              this.$api.role.edit(params).then((res) => {
              	this.editLoading = false
              	if(res.code == 200) {
              		this.$message({ message: '操作成功', type: 'success' })
              		this.dialogVisible = false
              		this.$refs['dataForm'].resetFields()
              	} else {
              		this.$message({message: '操作失败, ' + res.msg, type: 'error'})
              	}
              	this.findPage(null)
              })
            }
					})
				}
			})
		},
		// 获取数据
		findTreeData: function () {
			this.menuLoading = true
			this.$api.menu.findMenuTree().then((res) => {
				this.menuData = res.data
				this.menuLoading = false
			})
		},
		// 角色选择改变监听
		handleRoleSelectChange(val) {
			if(val == null || val == null) {
				return
			}
			this.selectRole =val
			this.$api.role.findRoleMenus({'roleId':val.id}).then((res) => {
				this.$refs.menuTree.setCheckedNodes(res.data)
			})
		},
		// 树节点选择监听
		handleMenuCheckChange(data, check, subCheck) {
			if(check) {
				// 节点选中时同步选中父节点
				let parentId = data.parentId
				this.$refs.menuTree.setChecked(parentId, true, false)
			} else {
				// 节点取消选中时同步取消选中子节点
				if(data.children != null) {
					data.children.forEach(element => {
						this.$refs.menuTree.setChecked(element.id, false, false)
					});
				}
			}
		},
		// 重置选择
		resetSelection() {
			this.checkAll = false
			this.$refs.menuTree.setCheckedNodes(this.currentRoleMenus)
		},
		// 全选操作
		handleCheckAll() {
			if(this.checkAll) {
				let allMenus = []
				this.checkAllMenu(this.menuData, allMenus)
				this.$refs.menuTree.setCheckedNodes(allMenus)
			} else {
				this.$refs.menuTree.setCheckedNodes([])
			}
		},
		// 递归全选
		checkAllMenu(menuData, allMenus) {
			menuData.forEach(menu => {
				allMenus.push(menu)
				if(menu.children) {
					this.checkAllMenu(menu.children, allMenus)
				}
			});
		},
		// 角色菜单授权提交
		submitAuthForm() {
			let roleId = this.selectRole.id
			if('admin' == this.selectRole.name) {
				this.$message({message: '超级管理员拥有所有菜单权限，不允许修改！', type: 'error'})
				return
			}
			this.authLoading = true
			let checkedNodes = this.$refs.menuTree.getCheckedNodes(false, true)
			let roleMenus = []
			for(let i=0, len=checkedNodes.length; i<len; i++) {
				let roleMenu = {id:checkedNodes[i].id }
				roleMenus.push(roleMenu)
			}
			this.$api.role.saveRoleMenus({roleId:roleId,menuIds:roleMenus}).then((res) => {
				if(res.code == 200) {
					this.$message({ message: '操作成功', type: 'success' })
				} else {
					this.$message({message: '操作失败, ' + res.msg, type: 'error'})
				}
				this.authLoading = false
			})
		},
		renderContent(h, { node, data, store }) {
			return (
			<div class="column-container">
				<span style="text-algin:center;margin-right:80px;">{data.name}</span>
				<span style="text-algin:center;margin-right:80px;">
					<el-tag type={data.type === 0?'':data.type === 1?'success':'info'} size="small">
						{data.type === 0?'目录':data.type === 1?'菜单':'按钮'}
					</el-tag>
				</span>
				<span style="text-algin:center;margin-right:80px;"> <i class={data.icon}></i></span>
				<span style="text-algin:center;margin-right:80px;">{data.parentName?data.parentName:'顶级菜单'}</span>
				<span style="text-algin:center;margin-right:80px;">{data.url?data.url:'\t'}</span>
			</div>);
      	},

	},
	mounted() {
    this.refreshPageRequest(1)
	}
}
</script>
<style>
.menu-container {
	margin-top: 10px;
}
.menu-header {
	padding-left: 8px;
	padding-bottom: 5px;
	text-align: left;
	font-size: 16px;
	color: rgb(20, 89, 121);

}
</style>
