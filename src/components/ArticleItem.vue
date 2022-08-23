<template>
  <div>
    <!-- 单一文章信息开始 -->
    <div class="articleItem">
      <!-- 文章标题开始 -->
      <div class="articleItem-header">{{p.subject}}</div>
      <!-- 文章标题结束 -->
      <!-- 文章图文信息开始 -->
      <div class="articleItem-wrapper">
        <!-- 文章图像开始  -->
        <div class="articleImg">
          <img v-if="p.image" :src="`/img-ice/`+p.image" />
        </div>
        <!-- 文章图像结束 -->
        <!-- 文章简介开始 -->
        <div>
        <div class="articleDes">
          {{p.description}}
        </div>
        <div class="btn" style="display:flex">
          <h3 style="margin-right:10px;line-height:30px;color: rgb(245, 97, 48)">￥{{p.price}}</h3>
         <van-button @click="add" icon="plus" type="primary" style="height:30px;width:95px;backgroundColor:rgb(245, 97, 48);border:none">购物车</van-button>
        </div>
        </div>
        <!-- 文章简介结束 -->
      </div>
      <!-- 文章图文信息结束 -->
    </div>
    <!-- 单一文章信息结束 -->
  </div>
</template>

<script>
export default {
  props:["p"],
  data() {
    return {
      price:this.p.price,
      subject:this.p.subject,
    };
  },
  methods:{
    add(){
      const url ="http://localhost:5000/shopcar";
        const {subject,price} =this;
        const params =`subject=${subject}&price=${price}`;
        console.log(params);
        this.axios.post(url,params).then((res)=>{
          console.log(res);
          if(res.data.code==200){
              alert("购物车添加信息成功！");
          }else{
            alert("购物车添加信息失败");
          }
        });
    }
  },
};
</script>
<style scoped>
.articleItem {
  padding: 10px 0;
  margin: 0 10px;
  border-bottom: 1px solid #999;
}
.articleItem-header {
  font-weight: 600;
  font-size: 17px;
  color: #1a1a1a;
  line-height: 22px;
}
.articleItem-wrapper {
  display: flex;
  align-items: center;
  padding-top: 10px;
  width: 100%;
}
.articleImg {
  margin-right: 15px;
}
.articleImg img{
  width: 110px;
  height: 74px;
  border-radius: 5px;
}
/* .articleImg img{
  width: 100%;
  height: 100%;
} */
.articleDes {
  height: 65px;
  font-size: 15px;
  overflow: hidden;
  font-weight: 400;
  text-overflow: ellipsis;
  line-height: 21px;
  letter-spacing: normal;
  color: #444;
}
</style>
