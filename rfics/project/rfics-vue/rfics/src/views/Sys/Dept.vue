<template>
  <div class="page-container">
	<!--工具栏-->
	<div class="toolbar" style="float:left;padding-top:10px;padding-left:15px;">
		<el-form :inline="true" :model="filters" :size="size">
			<el-form-item>
				<el-input v-model="filters.name" placeholder="名称"></el-input>
			</el-form-item>
			<el-form-item>
				<el-button icon="fa fa-search" type="primary" @click="findTreeData(null)">查询</el-button>
			</el-form-item>
			<el-form-item>
				<el-button icon="fa fa-plus" type="primary" @click="handleAdd">新增</el-button>
			</el-form-item>
		</el-form>
	</div>
	<!--表格树内容栏-->
    <el-table :data="tableTreeDdata" size="mini" style="width: 100%;"
      rowKey="organNo" v-loading="loading" element-loading-text="加载中">
      <el-table-column
        prop="organNo" header-align="center" align="center" width="80" label="机构编号">
      </el-table-column>
      <el-table-column header-align="center" treeKey="organNo" width="150" label="机构名称">
        <template slot-scope="scope">
          <span @click.prevent="toggleHandle(scope.$index, scope.row)" :style="childStyles(scope.row)">
            <i :class="iconClasses(scope.row)" :style="iconStyles(scope.row)"></i>
            {{ scope.row['organName'] }}
          </span>
        </template>
      </el-table-column>
      <el-table-column
        prop="parentName" header-align="center" align="center" width="120" label="上级机构">
      </el-table-column>
      <el-table-column
        prop="organDesc" header-align="center" align="center" label="机构描述">
      </el-table-column>
      <el-table-column
        prop="checkFlag" header-align="center" align="center" label="检查标志">
      </el-table-column>
      <el-table-column
        prop="createTime" header-align="center" align="center" label="创建时间">
      </el-table-column>
      <el-table-column
        prop="updateTime" header-align="center" align="center" label="更新时间">
      </el-table-column>
      <el-table-column
        prop="remark" header-align="center" align="center" label="备注">
      </el-table-column>
      <el-table-column
        fixed="right" header-align="center" align="center" width="185" label="操作">
        <template slot-scope="scope">
          <el-button icon="fa fa-edit" :size='size' @click="handleEdit(scope.row)">修改</el-button>
          <el-button icon="fa fa-trash" :size='size' type="danger" @click="handleDelete(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 新增修改界面 -->
    <el-dialog :title="!dataForm.id ? '新增' : '修改'" width="40%" :visible.sync="dialogVisible" :close-on-click-modal="false">
      <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="submitForm()"
        label-width="80px" :size="size" style="text-align:left;">
        <el-form-item label="机构编号" prop="organNo">
          <el-input v-model="dataForm.organNo" :disabled="!operation" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="名称" prop="organName">
          <el-input v-model="dataForm.organName" placeholder="名称"></el-input>
        </el-form-item>
        <el-form-item label="描述" prop="organDesc">
          <el-input v-model="dataForm.organDesc" placeholder="描述"></el-input>
        </el-form-item>
        <el-form-item label="检查标志" prop="checkFlag">
          <el-input v-model="dataForm.checkFlag" placeholder="检查标志"></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="dataForm.remark" placeholder="备注"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button :size="size"  @click="dialogVisible = false">取消</el-button>
        <el-button :size="size"  type="primary" @click="submitForm()">提交</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import isArray from 'lodash/isArray'
export default {
	data() {
		return {
			size: 'small',
			loading: false,
			filters: {
				name: ''
      },
      tableTreeDdata: [],
      operation:false,
      dialogVisible: false,
      dataForm: {
        organNo: '',
        organName: '',
        organDesc: '',
        checkFlag: '',
        remark:''
      },
      dataRule: {
        organName: [
          { required: true, message: '机构名称不能为空', trigger: 'blur' }
        ]
      },
      popupTreeData: [],
      popupTreeProps: {
				label: 'name',
				children: 'children'
			}
		}
	},
	methods: {
		// 获取数据
    findTreeData: function () {
      this.loading = true
			this.$api.dept.findDeptTree({name:this.filters.name}).then((res) => {
        this.tableTreeDdata = res.data
        this.popupTreeData = this.getParentMenuTree(res.data)
        this.loading = false
			})
    },
		// 获取上级机构树
    getParentMenuTree: function (tableTreeDdata) {
      let parent = {
        parentId: 0,
        name: '顶级菜单',
        children: tableTreeDdata
      }
      return [parent]
    },
		// 显示新增界面
		handleAdd: function () {
			this.dialogVisible = true
      this.operation = true
      this.dataForm = {
        organNo: '',
        organName: '',
        organDesc: '',
        checkFlag: '',
        createTime: '',
        updateTime:'',
        remark:''
      }
		},
		// 显示编辑界面
		handleEdit: function (row) {
      this.dialogVisible = true
      this.operation = false
      this.dataForm = Object.assign({}, row);
		},
    // 删除
    handleDelete (row) {
      this.$confirm('确认删除选中记录吗？', '提示', {
				type: 'warning'
      }).then(() => {
        let params = this.getDeleteIds([], row)
        this.$api.dept.batchDelete({ids:params}).then( res => {
          this.findTreeData()
          this.$message({message: '删除成功', type: 'success'})
        })
      })
    },
    // 获取删除的包含子机构的id列表
    getDeleteIds (ids, row) {
      ids.push(row.id)
      if(row.children != null) {
        for(let i=0, len=row.children.length; i<len; i++) {
          this.getDeleteIds(ids, row.children[i])
        }
      }
      return ids
    },
      // 机构树选中
    handleTreeSelectChange (data, node) {
      this.dataForm.parentId = data.id
      this.dataForm.parentName = data.name
    },
    // 表单提交
    submitForm () {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
					this.$confirm('确认提交吗？', '提示', {}).then(() => {
						this.editLoading = true
						let params = Object.assign({}, this.dataForm)
						if(this.operation){
              this.$api.dept.save(params).then((res) => {
                this.editLoading = false
                if(res.code == 200) {
              		this.$message({ message: '操作成功', type: 'success' })
                  this.dialogVisible = false
                  this.$refs['dataForm'].resetFields()
              	} else {
              		this.$message({message: '操作失败, ' + res.msg, type: 'error'})
              	}
              	this.findTreeData()
              })
            }else{
              this.$api.dept.edit(params).then((res) => {
                this.editLoading = false
                if(res.code == 200) {
              		this.$message({ message: '操作成功', type: 'success' })
                  this.dialogVisible = false
                  this.$refs['dataForm'].resetFields()
              	} else {
              		this.$message({message: '操作失败, ' + res.msg, type: 'error'})
              	}
              	this.findTreeData()
              })
            }
					})
				}
      })
    },
    childStyles (row) {
        return { 'padding-left': (row[this.levelKey] * 25) + 'px' }
      },
      iconClasses (row) {
        return [ !row._expanded ? 'el-icon-caret-right' : 'el-icon-caret-bottom' ]
      },
      iconStyles (row) {
        return { 'visibility': this.hasChild(row) ? 'visible' : 'hidden' }
      },
      hasChild (row) {
        return (isArray(row[this.childKey]) && row[this.childKey].length >= 1) || false
      },
      // 切换处理
      toggleHandle (index, row) {
        if (this.hasChild(row)) {
          var data = this.$parent.store.states.data.slice(0)
          data[index]._expanded = !data[index]._expanded
          if (data[index]._expanded) {
            data = data.splice(0, index + 1).concat(row[this.childKey]).concat(data)
          } else {
            data = this.removeChildNode(data, row[this.treeKey])
          }
          this.$parent.store.commit('setData', data)
          this.$nextTick(() => {
            this.$parent.doLayout()
          })
        }
      },
      // 移除子节点
      removeChildNode (data, parentId) {
        var parentIds = isArray(parentId) ? parentId : [parentId]
        if (parentId.length <= 0) {
          return data
        }
        var ids = []
        for (var i = 0; i < data.length; i++) {
          if (parentIds.indexOf(data[i][this.parentKey]) !== -1 && parentIds.indexOf(data[i][this.treeKey]) === -1) {
            ids.push(data.splice(i, 1)[0][this.treeKey])
            i--
          }
        }
        return this.removeChildNode(data, ids)
      }
	},
	mounted() {
    this.findTreeData()
	}
}
</script>

<style scoped>

</style>
