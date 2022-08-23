<template>
  <div>
<van-nav-bar
  title="用户注册"
  left-text="返回"
  right-text="按钮"
  left-arrow
  @click-left="onClickLeft"
  @click-right="onClickRight"
/>
<mt-field v-model="name" :state="nameState" @blur.native.capture="checkName" label="用户名" type="text" placeholder="请输入用户名"></mt-field>
<mt-field v-model="pwd" :state="pwdState" @blur.native.capture="checkPwd"  label="密码" type="password" placeholder="请输入密码"></mt-field>
<mt-field v-model="repwd" :state="repwdState" @blur.native.capture="checkRepwd"  label="确认密码" type="password" placeholder="请再次输入密码"></mt-field>
  <van-button round type="info" @click.native="checkForm" size="large">立即注册</van-button>
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
        name: '',//绑定用户名
        pwd:'',
        repwd:'',
        nameState:'',//用户名输入框的状态
        pwdState:'',
        repwdState:'',
      }
    },
     methods: {
    onClickLeft() {
      Toast('返回');
    },
    onClickRight() {
      Toast('按钮');
    },
    checkName(){
      let exp=/^\w{3,15}$/;
      if(exp.test(this.name)){
        this.nameState='success';
        return true;
      }else{
        this.nameState='error';
         return false;
      }
    },
    checkPwd(){
      let exp=/^\w{3,15}$/;
      if(exp.test(this.pwd)){
        this.pwdState='success';
        return true;
      }else{
        this.pwdState='error'
         return false;
      }
    },
    checkRepwd(){
      let exp=/^\w{3,15}$/;
      if(exp.test(this.repwd)&&this.repwd==this.pwd){
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
      }else{
        console.log('验证失败...');
      }
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