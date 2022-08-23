<template>
  <div>
<mt-header title="雪糕刺客app首页" fixed style="backgroundColor: rgb(245, 97, 48)">
  <div slot="right" v-if="!username">
    <router-link to="/login" style="color:white" class="link">登录</router-link>
    <router-link to="/register" style="color:white" class="link">注册</router-link>
  </div>
  <div slot="right" v-else>
    <li style="list-style:none">{{$store.state.username}} | <button style="backgroundColor:rgb(245, 97, 48);border:none" @click="updateUname(null)">退出</button></li>
  </div>
</mt-header>
<!-- 导航 -->
<mt-navbar
style="margin-top:40px"
 v-model="selected" fixed v-if="data">
  <mt-tab-item :id="item.id+''" v-for="item in data.results" :key="item.id">{{item.category_name}}</mt-tab-item>
</mt-navbar>
<!-- 轮播 -->
<mt-swipe style="height:56.2vw; margin-top:90px" :auto="4000" :speed="150">
  <mt-swipe-item>
    <img style="width:100%" src="../assets/1.webp" alt="">
  </mt-swipe-item>
 <mt-swipe-item>
    <img style="width:100%" src="../assets/2.webp" alt="">
  </mt-swipe-item>
 <mt-swipe-item>
    <img style="width:100%" src="../assets/3.webp" alt="">
  </mt-swipe-item>
  <mt-swipe-item>
    <img style="width:100%" src="../assets/4.webp" alt="">
  </mt-swipe-item>
</mt-swipe>
  <article-item v-for="item in articleList" :key="item.id" :p="item"></article-item>
  <div style="height:60px"></div>
  </div>
</template>
<script>
import ArticleItem from '@/components/ArticleItem.vue';
import { mapMutations, mapState } from 'vuex';
export default {
  components: { ArticleItem },
  data() {
    return {
      selected: '1',
      data:null,
      articleList:null,
    };
  },
  computed:{
    ...mapState(["username"]),
  },
  mounted(){
   this.getdata();
  },
  methods:{
    ...mapMutations(["updateUname"]),
    getdata(){
      const url ='/articles?cid=1&page=1';
       this.axios.get('/category').then(res=>{
      console.log('加载类别列表：',res);
      this.data=res.data;
    }),
    // 发送http请求，加载UI类别下首页文章列表
     this.axios.get(url).then(res=>{
      console.log('当前选中冰激凌种类列表',res);
      this.articleList = res.data.results;
    })
    }
  },
  watch:{
    selected(newval,oldval){
      console.log(`顶部导航选中项从${oldval}变成了${newval}`);
       this.axios.get(`/articles?cid=${newval}&page=1`).then(res=>{
      console.log('当前选中冰激凌种类列表',res);
      this.articleList = res.data.results;
    })
    }
  },
};
</script>

<style>
.link{
  color: aliceblue;
  margin: 0 3px;
}
</style>