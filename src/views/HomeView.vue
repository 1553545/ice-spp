<template>
  <div class="home">
<router-view/>
<!-- 底部选项卡 -->
<mt-tabbar v-model="tabSelected" fixed>
  <mt-tab-item id="index">
    <img slot="icon" :src="require(`@/assets/${tabSelected=='index'?'房子':'房子 实心'}.png`)">首页
    </mt-tab-item>
<mt-tab-item id="shopcar">
    <img v-show="tabSelected=='shopcar'" slot="icon" src="../assets/购物车.png">购物车
    <img v-show="tabSelected!='shopcar'" slot="icon" src="../assets/购物车空.png">
    </mt-tab-item>
</mt-tabbar>
  </div>
</template>

<script>

export default {
 data() {
  return {
    tabSelected:'index'
  }
 },
 watch:{
  tabSelected(newval,oldval){
    if(newval=='index'){
      this.$router.push('index')
    }else if(newval=='shopcar'){
      this.$router.push('shopcar')
    }
  }
 },
}
</script>
