<template>
  <div>
    <el-table :data="data.content" :stripe='stripe' :border="border" :height='height'
      :max-height='maxHeight' :highlight-current-row='highlightCurrentRow' :fit='fit'
      :size='size' v-loading ='loading' :align="align" :show-overflow-tooltip='showOverflow'
      :element-loading-text="loadingText" @current-change='handleCurrentChange'
      @selection-change='handleSelectionChange' style="width: 100%" ref='wdftable'>
        <el-table-column type="selection" width="40" v-if="showSelection"></el-table-column>
        <el-table-column
          v-for="column in columns"
          :header-align="column.headerAlign==null?align:column.headerAlign"
          :align="column.align==null?align:column.align" :max-width = 'column.maxWidth'
          :prop="column.prop" :label="column.label" :width="column.width"
          :min-width="column.minWidth" :fixed="column.fixed" :key="column.prop"
          :type="column.type" :formatter="column.formatter"
          :sortable="column.sortable==null?true:column.sortable">
        </el-table-column>
        <el-table-column label="操作" :width="width" fixed="right" v-if="showOperation" header-align="center" align="center">
          <template slot-scope="scope">
            <slot name="operation" v-bind:scope="scope">
              <el-button icon="fa fa-edit" label="修改" :size="buttonSize" @click="handleEdit(scope.$index, scope.row)">修改</el-button>
              <el-button icon="fa fa-trash" label="删除" :size="buttonSize" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
            </slot>
          </template>
        </el-table-column>
    </el-table>
    <!--分页栏-->
    <div class="toolbar" style="padding:10px;">
      <el-button label="批量删除" :size="buttonSize" type="danger" @click="handleBatchDelete()"
        :disabled="this.selections.length===0" style="float:left;" v-if="showSelection & showBatchDelete">批量删除</el-button>
      <el-pagination layout="sizes, total, prev, pager, next, jumper"
        @current-change="handleCurrentPageChange" @size-change="handleSizeChange"
        :current-page="pageRequest.pageNum" :page-size="pageRequest.pageSize"
        :page-sizes="pageSizes" :total="data.totalSize" style="float:right;">
      </el-pagination>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'WdfTable',
    props: {
      columns: Array, // 表格列配置
      data: Object, // 表格数据
      size: { // 尺寸
        type: String,
        default: 'mini'
      },
      fit:{
        type: Boolean,
        default: true
      },
      align: {  // 文本对齐方式
        type: String,
        default: 'center'
      },
      maxHeight: { // 表格最大高度
        type: Number,
        default: 500
      },
      height: { // 表格高度
        type: Number,
        default: 500
      },
      border: { // 是否显示边框
        type: Boolean,
        default: false
      },
      stripe: { // 是否显示斑马线
        type: Boolean,
        default: true
      },
      highlightCurrentRow: { // // 是否高亮当前行
        type: Boolean,
        default: true
      },
      showOverflowTooltip: { // 内容过长时是否提示显示
        type: Boolean,
        default: true
      },
      showSelection: { //是否显示多选框
        type: Boolean,
        default: false
      },
      showOperation: { // 是否显示操作列
        type: Boolean,
        default: false
      },
      width:{//操作行宽度
        type: String,
        default: '185'
      },
      buttonSize: { // 按钮尺寸
        type: String,
        default: 'mini'
      },
      showOverflow:{
        type: Boolean,
        default: true
      },
      showBatchDelete:{
        type: Boolean,
        default: false
      },
      loading:{
        type:Boolean,
        default:false
      },
      loadingText:{
        type: String,
        default: '数据加载中'
      }
    },
    data() {
      return {
        selections:[],
        pageRequest:{pageNum: 1,pageSize: 10},
        pageSizes:[10, 20, 30, 40]
      }
    },
    methods: {
      // 查询
      findPage: function () {
          let callback = res => {
          }
        this.$emit('findPage', {pageRequest:this.pageRequest, callback:callback})
      },
      // 选择切换
      handleSelectionChange: function (selections) {
        this.selections = selections
        this.$emit('selectionChange', {selections:selections})
      },
      // //点击每行时
      // handleClick:function(row){
      //   if(this.selections.indexOf(row)!=-1){
      //     this.$refs.wdftable.toggleRowSelection(row, false)
      //   }else{
      //     this.$refs.wdftable.toggleRowSelection(row,true);
      //   }
      // },
      // 选择切换
      handleCurrentChange: function (val,oldVal) {
        this.$emit('handleCurrentChange', {row:val,oldRow:oldVal})
      },
      // 换页刷新
    	handleCurrentPageChange: function (pageNum) {
        this.pageRequest.pageNum = pageNum
        this.findPage()
      },
      // 换页刷新
      handleSizeChange: function (pageSize) {
        this.pageRequest.pageSize = pageSize
        this.findPage()
      },
      // 编辑
    	handleEdit: function (index, row) {
        this.$emit('handleEdit', {index:index, row:row})
    	},
      // 删除
    	handleDelete: function (index, row) {
    		this.delete(row.id)
    	},
    	// 批量删除
    	handleBatchDelete: function () {
    		let ids = this.selections.map(item => item.id).toString()
    		this.delete(ids)
    	},
    	// 删除操作
    	delete: function (ids) {
    		this.$confirm('确认删除选中记录吗？', '提示', {
    			type: 'warning'
    		}).then(() => {
    			let params = []
    			let idArray = (ids+'').split(',')
    			for(var i=0; i<idArray.length; i++) {
    				params.push({'id':idArray[i]})
          }
          let callback = res => {
            if(res.code == 200) {
              this.$message({message: '删除成功', type: 'success'})
              this.findPage()
            } else {
              this.$message({message: '操作失败, ' + res.msg, type: 'error'})
            }
          }
          this.$emit('handleDelete', {params:params, callback:callback})
    		}).catch(() => {
    		})
    	}
    },
    mounted() {
      this.handleCurrentPageChange(1)
    }
  }
</script>

<style>
</style>
