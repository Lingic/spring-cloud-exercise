<template>
  <el-form :model="loginForm" :rules="fieldRules" ref="loginForm" label-position="left" label-width="0px" class="demo-ruleForm login-container">
    <h2 class="title" style="padding-left:22px;" >系统登录</h2>
    <el-form-item prop="account">
      <el-input type="text" v-model="loginForm.account" auto-complete="off" placeholder="账号"></el-input>
    </el-form-item>
    <el-form-item prop="password">
      <el-input type="password" v-model="loginForm.password" auto-complete="off" placeholder="密码"></el-input>
    </el-form-item>
    <el-form-item >
      <el-col :span="12">
        <el-form-item prop="captcha">
          <el-input type="test" v-model="loginForm.captcha" auto-complete="off" placeholder="验证码, 单击图片刷新"
            style="width: 100%;">
          </el-input>
        </el-form-item>
      </el-col>
      <el-col class="line" :span="1">&nbsp;</el-col>
      <el-col :span="11">
        <el-form-item>
            <Identify :identifyCode = 'code'></Identify>
        </el-form-item>
      </el-col>
    </el-form-item>
    <el-form-item style="width:100%;">
      <el-button type="primary" style="width:48%;" @click.native.prevent="reset">重 置</el-button>
      <el-button type="primary" style="width:48%;" @click.native.prevent="login" :loading="loading">登 录</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
import mock from "@/mock/index"
import Cookies from "js-cookie"
import Identify from '@/identify/Identify'
export default {
  components:{
    Identify
  },
  name: 'Login',
  data() {
    return {
      code:'2345',
      loading: false,
      loginForm: {
        account: 'admin',
        password: 'admin',
        captcha:'',
        src: ''
      },
      fieldRules: {
        account: [
          { required: true, message: '请输入账号', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' }
        ]
      },
      checked: true
    }
  },
  methods: {
    login() {
      let userInfo = {account:this.loginForm.account, password:this.loginForm.password, captcha:this.loginForm.captcha}
      this.$api.login.login(userInfo).then((res) => {
          if(res.msg != null) {
            this.$message({
              message: res.msg,
              type: 'error'
            })
          } else {
            Cookies.set('token', res.data.token) // 放置token到Cookie
            this.$router.push('/home')  // 登录成功，跳转到主页
          }
        }).catch((res) => {
          this.$message({
          message: res.message,
          type: 'error'
          })
        });
    },
    refreshCaptcha: function(){
      this.loginForm.src = this.global.baseUrl + "/captcha?t=" + new Date().getTime();
    },
    reset() {
      this.$refs.loginForm.resetFields()
    },
  },
  mounted() {
    this.refreshCaptcha()
  },
  computed:{
  }
}
</script>

<style lang="scss" scoped>
  .login-container {
    -webkit-border-radius: 5px;
    border-radius: 5px;
    -moz-border-radius: 5px;
    background-clip: padding-box;
    margin: 100px auto;
    width: 350px;
    padding: 35px 35px 15px 35px;
    background: #fff;
    border: 1px solid #eaeaea;
    box-shadow: 0 0 25px #cac6c6;
    .title {
      margin: 0px auto 30px auto;
      text-align: center;
      color: #505458;
    }
    .remember {
      margin: 0px 0px 35px 0px;
    }
  }
</style>
