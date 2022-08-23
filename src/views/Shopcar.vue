<template>
  <div>
<mt-header title="雪糕刺客app购物车" style="backgroundColor: rgb(245, 97, 48)">
</mt-header>
<van-notice-bar
  left-icon="volume-o"
  text="请您在下方有效时间内进行支付。"
/>
<!-- 内容 -->
<table>
 <thead>
        <tr>
          <!-- <td><input type="checkbox"></td> -->
          <td>名称</td>
          <td>价格</td>
          <td>数量</td>
          <td>小计</td>
          <td>操作</td>
        </tr>
      </thead>
<tbody v-if="data">
         <tr v-for="(p,i) in data.data" :key="i">
          <!-- <td><input type="checkbox" v-model="checked"/></td> -->
          <td>{{p.subject}}</td>
          <td>￥{{p.price}}</td>
          <td>
            <button @click="p.count--" :disabled="p.count==1" style="backgroundColor:rgb(246, 127, 72);border:none;padding:1px 5px;color:white">-</button>
            <span style="padding:4px">{{p.count}}</span>
            <button @click="p.count++" style="backgroundColor:rgb(246, 127, 72);border:none;padding:1px 5px;color:white">+</button>
          </td>
          <td>￥{{p.price*p.count}}</td>
          <td><button @click="data.data.splice(i,1)" style="backgroundColor:rgb(246, 127, 72);border:none;padding:3px;color:white">×</button></td>
          <tr/>
      </tbody>
    </table>  
        <van-button type="warning" block style="width:100%;margin-top:30px">宝贝共计金额：￥{{total}}</van-button>
        <div style="width:100%;position:fixed;bottom:50px">
          <div style="display:flex;height:50px;line-height:28px;">
            <img src="../assets/注意.png" alt="" style="width:25px;height:25px;margin-right:7px"><span>您的支付时间还剩：</span><van-count-down :time="time" style="line-height:28px"/>
        <van-button type="warning" style="width:80px;height:30px;margin-left:5px">去支付</van-button>
          </div>
        </div>
        <div></div>
        </div>
</template>

<script>
  export default {
    data() {
      return {
        // checked:false,
        time: 30 * 60 * 1000,
        data:null
      }
    },
    mounted(){
      this.getdata();
    },
     methods:{
      // checkAll(e){
      //   this.items.forEach((value) =>{
      //     return value.checked = e.target.checked;
      //   })
      // },
      getdata(){
        const url ="http://localhost:5000/car";
        this.axios.get(url).then(res=>{
          console.log(res);
            this.data=res.data;
        })
      },
    },
    computed:{
      total(){
       return this.data.data.reduce((sum,value)=>{
          const { price,count} =value
          return sum +price * count ;
        },0)
      },
  }
  }
</script>

<style>
.goods-card {
    margin: 0;
    background-color: white;
  }

  .delete-button {
    height: 100%;
  }
  table{

    width: 100%;

    border-collapse: collapse;}table caption{

    font-size: 1.3em;

    font-weight: bold;

    margin: 0.5em 0;}th,td{

    border: 1px solid white;

    text-align: center;

    padding: 5px 0;}table thead tr{

    background-color:  rgb(246, 127, 72);

    color: #fff;}table tbody tr:nth-child(odd){

    background-color: #eee;}table tbody tr:hover{

    background-color: #ccc;}table tbody tr td:first-child{

    color:rgb(245, 97, 48);}
</style>