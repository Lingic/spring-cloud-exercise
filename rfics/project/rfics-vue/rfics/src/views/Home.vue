<template>
<div style="height: 100%;width: 100%;">
  <el-container style="height:100%;width: 100%; border: 1px solid #eee">
    <el-header style="text-align: right; font-size: 12px;background-color: #66b1ff;">
      <!-- 工具栏 -->
      <span class="toolbar">
        <el-menu class="el-menu-demo" background-color="#66b1ff" text-color="#66b1ff" active-text-color="#66b1ff" mode="horizontal">
          <el-menu-item index="1" v-popover:popover-message>
            <!-- 我的私信 -->
            <el-badge :value="5" :max="99" class="badge" type="success">
              <li style="color:#fff;" class="fa fa-envelope-o fa-lg"></li>
            </el-badge>
            <el-popover ref="popover-message" placement="bottom-end" trigger="click">
              <message-panel></message-panel>
            </el-popover>
          </el-menu-item>
          <el-menu-item index="2" v-popover:popover-notice>
            <!-- 系统通知 -->
            <el-badge :value="4" :max="99" class="badge" type="success">
              <li style="color:#fff;" class="fa fa-bell-o fa-lg"></li>
            </el-badge>
            <el-popover ref="popover-notice" placement="bottom-end" trigger="click">
              <notice-panel></notice-panel>
            </el-popover>
          </el-menu-item>
          <el-menu-item index="5" v-popover:popover-personal>
            <!-- 用户信息 -->
            <span class="user-info"><img :src="user.avatar"/>{{user.name}}</span>
            <el-popover ref="popover-personal" placement="bottom-end" trigger="click" :visible-arrow="false">
              <personal-panel :user="user"></personal-panel>
            </el-popover>
          </el-menu-item>
        </el-menu>
      </span>
    </el-header>
  <el-container>
    <el-aside width='200px'>
      <el-menu ref="navmenu" :default-active="active" class="el-menu-vertical-demo" :collapse="isCollapse" :collapse-transition="false" :unique-opened="true">
        <el-submenu index="1">
          <template slot="title">
            <i class="el-icon-menu"></i>
            <!-- <span slot="title">系统管理</span> -->
            <span slot="title">限行架系统</span>
          </template>
            <el-menu-item index="1-1" @click="changeMenu('/home/dept')">机构管理</el-menu-item>
            <el-menu-item index="1-2" @click="changeMenu('/home/user')">用户管理</el-menu-item>
            <el-menu-item index="1-3" @click="changeMenu('/home/role')">角色管理</el-menu-item>
            <el-menu-item index="1-4" @click="changeMenu('/home/menus')">菜单管理</el-menu-item>
            <el-menu-item index="1-5" @click="changeMenu('/home/cars')">车辆管理</el-menu-item>
            <el-menu-item index="1-6" @click="changeMenu('/home/white')">车辆白名单</el-menu-item>
            <el-menu-item index="1-7" @click="changeMenu('/home/blank')">车辆黑名单</el-menu-item>
            <el-menu-item index="1-8" @click="changeMenu('/home/station')">监测站</el-menu-item>
            <el-menu-item index="1-9" @click="changeMenu('/home/restrict')">限行架</el-menu-item>
            <el-menu-item index="1-10" @click="changeMenu('/home/log')">操作日志</el-menu-item>
        </el-submenu>
      </el-menu>
    </el-aside>
    <el-main width='auto'>
      <main-content></main-content>
    </el-main>
  </el-container>
  </el-container>
</div>
</template>
<script>
  import mock from "@/mock/index"
  import MainContent from "./Main/MainContent"
  import MessagePanel from "./Main/MessagePanel"
  import NoticePanel from "./Main/NoticePanel"
  import PersonalPanel from "./Main/PersonalPanel"
  export default {
    components:{
      MainContent,
      MessagePanel,
      NoticePanel,
      PersonalPanel
    },
    data() {
      return {
        user: {
          name: "admin",
          avatar: require("@/assets/user.png"),
          role: "管理员",
          registeInfo: "注册时间：2018-12-20 "
        },
        isCollapse: false,
        active:'',
      };
    },
    methods: {
      changeMenu(val){
        if(this.$route.path.endsWith(val)){
          return
        }
        this.$router.push(val)
      },
      handleRoute (route) {
        // tab标签页选中, 如果不存在则先添加
        var tab = this.mainTabs.filter(item => item.name === route.name)[0]
        if (!tab) {
          tab = {
            name: route.name,
            title: route.name,
            icon: route.meta.icon
          }
          this.mainTabs = this.mainTabs.concat(tab)
        }
        this.mainTabsActiveName = tab.name
        // 切换标签页时同步更新高亮菜单
        if(this.$refs.navmenu != null) {
          this.$refs.navmenu.activeIndex = '' + route.meta.index
          this.$refs.navmenu.initOpenedMenu()
        }
      }
    },
    watch: {
      $route: 'handleRoute'
    },
    created () {
      this.handleRoute(this.$route)
    },
    computed: {
      mainTabs: {
        get () { return this.$store.state.tab.mainTabs },
        set (val) { this.$store.commit('updateMainTabs', val) }
      },
      mainTabsActiveName: {
        get () { return this.$store.state.tab.mainTabsActiveName },
        set (val) { this.$store.commit('updateMainTabsActiveName', val) }
      }
    },
  }
</script>
<style scoped lang="scss">
  .el-menu-vertical-demo:not(.el-menu--collapse) {
    height: 100%;
  }
  .el-main{
    padding: 0px;
  }
  .toolbar {
    float: right;
  }
  .lang-item {
    font-size: 16px;
    padding-left: 8px;
    padding-top: 8px;
    padding-bottom: 8px;
    cursor: pointer;
  }
  .lang-item:hover {
    font-size: 18px;
    background: #b0d6ce4d;
  }
  .user-info {
    font-size: 20px;
    color: #fff;
    cursor: pointer;
    img {
      width: 30px;
      height: 30px;
      margin: 10px 0px 10px 10px;
      float: right;
    }
  }
  .badge {
    line-height: 18px;
  }
  .position-left {
    left: 200px;
  }
  .position-collapse-left {
    left: 65px;
  }
</style>
