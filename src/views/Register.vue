<template>
  <div>
<mt-header title="雪糕刺客app注册页" style="backgroundColor: rgb(245, 97, 48)">
  <div slot="left">
    <router-link to="/home/index" style="color:white" class="link">返回</router-link>
  </div>
  <div slot="right">
    <router-link to="/login" style="color:white" class="link">登录</router-link>
  </div>
  </mt-header>
<mt-field v-model="username" :state="nameState" @blur.native.capture="checkName" label="用户名" type="text" placeholder="请输入用户名"></mt-field>
<mt-field v-model="password" :state="pwdState" @blur.native.capture="checkPwd"  label="密码" type="password" placeholder="请输入密码"></mt-field>
<mt-field v-model="repwd" :state="repwdState" @blur.native.capture="checkRepwd"  label="确认密码" type="password" placeholder="请再次输入密码"></mt-field>
  <van-button @click="login" round type="info" @click.native="checkForm" size="large" style="backgroundColor: rgb(245, 97, 48);border:none;width:200px;margin-left:60px">立即注册</van-button>
  </div>
</template>
import { Toast } from 'vant';
import { Field } from 'mint-ui';
Vue.component(Field.name, Field);
import { Button } from 'mint-ui';
Vue.component(Button.name, Button);
<script>
  export default {
    data() {
      return {
        username: '',//绑定用户名
        password:'',
        repwd:'',
        nameState:'',//用户名输入框的状态
        pwdState:'',
        repwdState:'',
      }
    },
     methods: {  
    checkName(){
      let exp=/^\w{3,15}$/;
      if(exp.test(this.username)){
        this.nameState='success';
        return true;
      }else{
        this.nameState='error';
         return false;
      }
    },
    checkPwd(){
      let exp=/^\w{3,15}$/;
      if(exp.test(this.password)){
        this.pwdState='success';
        return true;
      }else{
        this.pwdState='error'
         return false;
      }
    },
    checkRepwd(){
      let exp=/^\w{3,15}$/;
      if(exp.test(this.repwd)&&this.repwd==this.password){
        this.repwdState='success';
        return true;
      }else{
        this.repwdState='error';
        return false;
      }
    },
    checkForm(){
      if(this.checkName()&&this.checkPwd()&&this.checkRepwd()){
        console.log('验证成功...');
        this.$router.push('/login')
      }else{
        console.log('验证失败...');
      }
    },
      login(){
        const url ='/register';
         const {username,password} =this;
        console.log(username,password);
        //post  请求，特点是  路径 与参数分开
        const params =`username=${username}&password=${password}`;
        console.log(params);
        this.axios.post(url,params).then((res)=>{
          console.log(res);
          if(res.data.code==200){
              alert("恭喜！注册成功！");
              this.$router.push("/login");
          }else{
            alert("糟糕！注册失败");
          }
        });
      },
  },
  }
</script>

<style >
*{
  padding: 0;
  margin: 0;
}
</style>