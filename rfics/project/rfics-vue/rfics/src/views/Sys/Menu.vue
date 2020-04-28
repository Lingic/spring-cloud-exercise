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
      rowKey="menuId" v-loading="loading" element-loading-text="加载中">
      <el-table-column
        prop="menuId" header-align="center" align="center" width="80" label="菜单编号">
      </el-table-column>
      <el-table-column prop="menuName" header-align="center" treeKey="menuId" width="150" label="菜单名称">
        <template slot-scope="scope">
          <span @click.prevent="toggleHandle(scope.$index, scope.row)" :style="childStyles(scope.row)">
            <i :class="iconClasses(scope.row)" :style="iconStyles(scope.row)"></i>
            {{ scope.row['menuName'] }}
          </span>
        </template>
      </el-table-column>
      <el-table-column prop="menuType" header-align="center" align="center" label="类型">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.type === 0" size="small">目录</el-tag>
          <el-tag v-else-if="scope.row.type === 1" size="small" type="success">菜单</el-tag>
          <el-tag v-else-if="scope.row.type === 2" size="small" type="info">按钮</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        prop="parentName" header-align="center" align="center" width="120" label="上级菜单">
      </el-table-column>
      <el-table-column
        prop="menuUrl" header-align="center" align="center" width="150"
        :show-overflow-tooltip="true" label="菜单URL">
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
          <el-button icon="fa fa-edit" :size="size" @click="handleEdit(scope.row)">修改</el-button>
          <el-button icon="fa fa-trash"  :size="size" type="danger" @click="handleDelete(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 新增修改界面 -->
    <el-dialog :title="!dataForm.id ? '新增' : '修改'" width="40%" :visible.sync="dialogVisible" :close-on-click-modal="false">
      <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="submitForm()"
        label-width="80px" :size="size" style="text-align:left;">
        <el-form-item label="菜单类型" prop="type">
          <el-radio-group v-model="dataForm.type">
            <el-radio v-for="(type, index) in menuTypeList" :label="index" :key="index">{{ type }}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="编号" prop="menuId" v-if="!operation">
          <el-input v-model="dataForm.menuId" :disabled="true" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item :label="menuTypeList[dataForm.type] + '名称'" prop="menuName">
          <el-input v-model="dataForm.menuName" :placeholder="menuTypeList[dataForm.type] + '名称'"></el-input>
        </el-form-item>
        <el-form-item label="上级菜单" prop="parentName">
          <div>
            <el-popover ref="popover" placement="right-start" trigger="click">
              <el-tree
                :data="popupTreeData"
                :props="popupTreeProps"
                :node-key="''+dataForm.parentId"
                ref="popupTree"
                @current-change="handleTreeSelectChange"
                :default-expand-all="false"
                :highlight-current="true"
                :expand-on-click-node="true">
              </el-tree>
            </el-popover>
            <el-input :value = "dataForm.parentName==null||dataForm.parentName==''?'顶级菜单':dataForm.parentName" v-popover:popover :readonly="true" placeholder="点击选择内容" style="cursor:pointer;"></el-input>
          </div>
        </el-form-item>
        <el-form-item v-if="dataForm.type === 1" label="菜单路由" prop="menuUrl">
          <el-row>
            <el-col :span="22">
                <el-input v-model="dataForm.menuUrl" placeholder="菜单路由"></el-input>
            </el-col>
            <el-col :span="2" class="icon-list__tips">
                <el-tooltip placement="top" effect="light" style="padding: 10px;">
                  <div slot="content">
                    <p>URL格式：</p>
                    <p>1.常规业务开发的功能URL，如用户管理，Views目录下页面路径为 /Sys/User, 此处填写 /sys/user。</p>
                    <p>2.嵌套外部网页，如通过菜单打开百度网页，此处填写 http://www.baidu.com，http:// 不可省略。</p>
                    <p>示例：用户管理：/sys/user 嵌套百度：http://www.baidu.com 嵌套网页：http://127.0.0.1:8000</p></div>
                  <i class="el-icon-warning"></i>
                </el-tooltip>
            </el-col>
          </el-row>
        </el-form-item>
        <el-form-item label="创建时间" prop="createTime">
          <el-input v-model="dataForm.createTime"  auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="更新时间" prop="updateTime">
          <el-input v-model="dataForm.updateTime" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="检查标识" prop="checkFlag" >
          <el-input v-model="dataForm.checkFlag" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="备注" prop="remark" >
          <el-input v-model="dataForm.remark"  auto-complete="off"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button :size="size"  @click="dialogVisible = false">取消</el-button>
        <el-button :size="size"  type="primary" @click="submitForm()">确认</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import isArray from 'lodash/isArray'
export default {
  data() {
    return {
      size: "small",
      loading: false,
      filters: {
        name: ""
      },
      tableTreeDdata: [],
      operation:false,
      dialogVisible: false,
      menuTypeList: ["目录", "菜单", "按钮"],
      dataForm: {
        id: 0,
        type: 1,
        name: "",
        parentId: 0,
        parentName: "",
        url: "",
        perms: "",
        orderNum: 0,
        icon: "",
        iconList: []
      },
      dataRule: {
        name: [{ required: true, message: "菜单名称不能为空", trigger: "blur" }]
      },
      popupTreeData: [],
      popupTreeProps: {
        label: "menuName",
        children: "children"
      }
    };
  },
  methods: {
    // 获取数据
    findTreeData: function() {
      this.loading = true;
      this.$api.menu.findMenuTree({name:this.filters.name}).then(res => {
        this.tableTreeDdata = res.data;
        this.popupTreeData = this.getParentMenuTree(res.data);
        this.loading = false;
      });
    },
    // 获取上级菜单树
    getParentMenuTree: function(tableTreeDdata) {
      let parent = {
        parentId: 0,
        menuName: "顶级菜单",
        children: tableTreeDdata
      };
      return [parent];
    },
    // 显示新增界面
    handleAdd: function() {
      this.dialogVisible = true;
      this.operation=true
      this.dataForm = {
        menuId: '',
        menuName:'',
        type: 1,
        typeList: ["目录", "菜单", "按钮"],
        parentId: null,
        parentName: "",
        menuUrl: "",
        createTime:'',
        updateTime:'',
        checkFlag:'',
        remark:''
      };
    },
    // 显示编辑界面
    handleEdit: function(row) {
      this.dialogVisible = true;
      this.operation=false
      Object.assign(this.dataForm, row);
    },
    // 删除
    handleDelete(row) {
      this.$confirm("确认删除选中记录吗？", "提示", {
        type: "warning"
      }).then(() => {
        let params = this.getDeleteIds([], row);
        this.$api.menu.batchDelete(params).then(res => {
          this.findTreeData();
          this.$message({ message: "删除成功", type: "success" });
        });
      });
    },
    // 获取删除的包含子菜单的id列表
    getDeleteIds(ids, row) {
      ids.push(row.id);
      if (row.children != null) {
        for (let i = 0, len = row.children.length; i < len; i++) {
          this.getDeleteIds(ids, row.children[i]);
        }
      }
      return ids;
    },
    // 菜单树选中
    handleTreeSelectChange(data, node) {
      this.dataForm.parentId = data.menuId;
      this.dataForm.parentName = data.menuName;
    },
    // 图标选中
    iconActiveHandle(iconName) {
      this.dataForm.icon = iconName;
    },
    // 表单提交
    submitForm() {
      this.$refs["dataForm"].validate(valid => {
        if (valid) {
          this.$confirm("确认提交吗？", "提示", {}).then(() => {
            this.editLoading = true;
            let params = Object.assign({}, this.dataForm);
            if(this.operation){
              this.$api.menu.save(params).then(res => {
                this.editLoading = false;
                if (res.code == 200) {
                  this.$message({ message: "操作成功", type: "success" });
                  this.$refs["dataForm"].resetFields();
                  this.dialogVisible = false;
                } else {
                  this.$message({
                    message: "操作失败, " + res.msg,
                    type: "error"
                  });
                }
                this.findTreeData();
              });
            }else{
              this.$api.menu.edit(params).then(res => {
                this.editLoading = false;
                if (res.code == 200) {
                  this.$message({ message: "操作成功", type: "success" });
                  this.$refs["dataForm"].resetFields();
                  this.dialogVisible = false;
                } else {
                  this.$message({
                    message: "操作失败, " + res.msg,
                    type: "error"
                  });
                }
                this.findTreeData();
              });
            }
          });
        }
      });
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
        this.store.commit('setData', data)
        this.$nextTick(() => {
          this.doLayout()
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
    this.findTreeData();
  }
};
</script>

<style>
  .el-table .cell {
      padding-right: 0px;
  }
</style>
