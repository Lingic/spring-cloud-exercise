<template>
  <div id="main-container" class="main-container">
    <!-- 标签页 -->
    <div class="tab-container">
      <el-tabs class="tabs"
        v-model="mainTabsActiveName" :closable="true" type="card"
        @tab-click="selectedTabHandle" @tab-remove="removeTabHandle">
        <el-tab-pane v-for="item in mainTabs"
          :key="item.name" :label="item.title" :name="item.name">
          <span slot="label"><i :class="item.icon"></i> {{item.title}} </span>
        </el-tab-pane>
      </el-tabs>
    </div>
    <!-- 主内容区域 -->
    <div class="main-content">
      <keep-alive>
        <transition name="fade" mode="out-in">
            <router-view></router-view>
        </transition>
      </keep-alive>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
    }
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
  methods: {
    // tabs, 选中tab
    selectedTabHandle (tab) {
      tab = this.mainTabs.filter(item => item.name === tab.name)
      if (tab.length >= 1) {
        this.$router.push({ name: tab[0].name })
      }
    },
    // tabs, 删除tab
    removeTabHandle (tabName) {
      this.mainTabs = this.mainTabs.filter(item => item.name !== tabName)
      if (this.mainTabs.length >= 1) {
        // 当前选中tab被删除
        if (tabName === this.mainTabsActiveName) {
          this.$router.push({ name: this.mainTabs[this.mainTabs.length - 1].name }, () => {
            this.mainTabsActiveName = this.$route.name
          })
        }
      } else {
        this.$router.push("/home")
      }
    },
  }
}
</script>

<style scoped lang="scss">
  .menu-bar-container {
    position: fixed;
    top: 0px;
    left: 0;
    bottom: 0;
    z-index: 1020;
    .el-menu {
      position:absolute;
      top: 60px;
      bottom: 0px;
      text-align: left;
      // background-color: #2968a30c;
    }
    .logo {
      position:absolute;
      top: 0px;
      height: 60px;
      line-height: 60px;
      background: #545c64;
      cursor:pointer;
      img {
          width: 40px;
          height: 40px;
          border-radius: 0px;
          margin: 10px 10px 10px 10px;
          float: left;
      }
      div {
        font-size: 25px;
        color: white;
        text-align: left;
        padding-left: 20px;
      }
    }
    .menu-bar-width {
      width: 200px;
    }
    .menu-bar-collapse-width {
      width: 65px;
    }
  }
</style>
