<template>
  <div>
<mt-header title="雪糕刺客app登录页" style="backgroundColor: rgb(245, 97, 48)">
  <div slot="left">
    <router-link to="/home/index" style="color:white" class="link">返回</router-link>
  </div>
  <div slot="right">
    <router-link to="/register" style="color:white" class="link">注册</router-link>
  </div>
  </mt-header>
<mt-field v-model="username" :state="nameState" @blur.native.capture="checkName" label="用户名" type="text" placeholder="请输入用户名"></mt-field>
<mt-field v-model="password" :state="pwdState" @blur.native.capture="checkPwd"  label="密码" type="password" placeholder="请输入密码"></mt-field>
  <van-button @click="login" round type="info"  size="large" style="backgroundColor: rgb(245, 97, 48);border:none;width:200px;margin-left:60px">立即登录</van-button>
  </div>
</template>
import { Toast } from 'vant';
import { Field } from 'mint-ui';
Vue.component(Field.name, Field);
import { Button } from 'mint-ui';
Vue.component(Button.name, Button);
<script>
import { mapMutations } from 'vuex';
  export default {
    data() {
      return {
        username: '',//绑定用户名
        password:'',
        nameState:'',//用户名输入框的状态
        pwdState:'',
      }
    },
     methods: {
      ...mapMutations(["updateUname"]),
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
    // checkForm(){
    //   if(this.checkName()&&this.checkPwd()){
    //     console.log('验证成功...');
    //     // this.$router.push('/')
    //   }else{
    //     console.log('验证失败...');
    //   }
    // },
     login(){
        console.log(this.username,this.password);
        const url ="/login";
        const params =`username=${this. username}&password=${this.password}`
        this.axios.post(url,params).then((res)=>{
          console.log(url,params);
          if(res.data.code==200){
            alert("登陆成功");
            //登录成功后，要共享信息
            console.log(this.username);
      
            this.updateUname(this. username);
            this.$router.push("/");
          }else{
            alert("登录失败");
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