const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const md5 = require('md5');
const pool = mysql.createPool({
  host: '127.0.0.1',   //MySQL服务器地址
  port: 3306,          //MySQL服务器端口号
  user: 'root',        //数据库用户的用户名
  password: '',        //数据库用户密码
  database: 'xzqa',    //数据库名称
  connectionLimit: 20, //最大连接数
  charset: 'utf8'      //数据库服务器的编码方式
});

// 创建服务器对象
const server = express();

server.use(bodyParser.urlencoded({
  extended: false
}));


// 加载CORS模块
const cors = require('cors');

// 使用CORS中间件
server.use(cors({
  origin: ['http://localhost:8080', 'http://127.0.0.1:8080']
}));

// 获取所有雪糕分类的接口
server.get('/category', (req, res) => {
  // SQL语句以获取雪糕分类表的数据
  let sql = 'SELECT id,category_name FROM xzqa_category ORDER BY id';
  // 执行SQL语句
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({ message: 'ok', code: 200, results: results });
  });
});
// 获取指定分类下包含雪糕数据的接口
//接口：http://localhost:5000/register
server.get('/articles', (req, res) => {
  // 获取客户端传递的cid参数
  let cid = req.query.cid;

  // 获取客户端传递的page参数
  let page = req.query.page? req.query.page : 1;

  // 存储每页显示的记录数
  let pagesize = 20;

  // 通过公式来计算从第几条记录开始返回
  let offset = (page - 1) * pagesize;

  // 用于存储获取到的总记录数
  let rowcount;

  // 获取指定分类下的雪糕总数
  let sql = 'SELECT COUNT(id) AS count FROM xzqa_article WHERE category_id=?';

  pool.query(sql, [cid], (error, results) => {
    if (error) throw error;
    // 将获取到总记录数赋给rowcount变量
    rowcount = results[0].count;
    /**************************************************/
    // 根据总记录数和每页显示的记录数来计算总页数
    let pagecount = Math.ceil(rowcount / pagesize);

    // 查询SQL语句
    sql = 'SELECT id,subject,description,image,price FROM xzqa_article WHERE category_id=? LIMIT ?,?';
    // 执行SQL
    pool.query(sql, [cid, offset, pagesize], (error, results) => {
      if (error) throw error;
      res.send({ message: 'ok', code: 200, results: results, pagecount: pagecount });
    });

    /**************************************************/
  });

});

// 获取特定雪糕数据的接口
server.get('/detail', (req, res) => {
  //获取地址栏中的id参数
  let id = req.query.id;

  // SQL查询
  let sql = "SELECT r.id,subject,content,created_at,nickname,avatar,article_number FROM xzqa_article AS r INNER JOIN xzqa_author AS u ON author_id = u.id WHERE r.id=?";

  // 执行SQL查询
  pool.query(sql, [id], (error, results) => {
    if (error) throw error;
    // 返回数据到客户端
    res.send({ message: 'ok', code: 200, result: results[0] });
  });

});

//1.管理员注册接口
//地址:http://localhost:5000/register
//请求方式:post
server.post('/register',(req,res,next)=>{
	//获得参数
	var obj=req.body
	console.log(obj)
	//验证用户名密码不能为空
	if(!obj.username){
		res.send({code:401,msg:'username不能为空'})
		return;
	}else if(!obj.password){
		res.send({code:402,msg:'password不能为空'})
		return;
	}
	//将数据插入到数据库表中
	pool.query('insert into xzqa_user set?',[obj],(err,result)=>{
		if(err){
			next(err);
			return;
		}
		console.log(result);
		//执行成功再响应
		res.send({code:200,msg:'员工添加成功'})
	})
});
//2.管理员登录接口
//地址:127.0.0.1:5000/login
//请求方式post
server.post('/login',(req,res,next)=>{
	var obj=req.body
	//console.log(obj)
	if(!obj.username){
		res.send({code:401,msg:'username不能为空'})
		return;
	}else if(!obj.password){
		res.send({code:402,msg:'password不能为空'})
		return;
	}
	pool.query('select * from xzqa_user where username=? and password=?',[obj.username,obj.password],(err,result)=>{
		if (err)
		{
			next(err);
			return;
		}
		if(result.length!=0){
			res.send({code:200,msg:"登录成功"})
		}else{
			res.send({code:501,msg:"登陆失败"})
		}
	})
})
// //3.管理员用户接口
// //地址:http://localhost:5000/del
// //请求方式delete
// //请求方式delete
// server.delete('/del:username',(req,res,next)=>{
// 	var obj = req.params;
// 	pool.query('delete from xzqa_user where username=?',[obj.username],(err,result)=>{
// 		if(err){
// 			next(err);
// 			return;
// 		}
// 		if(result.affectedRows===0){
// 			res.send({code:501,msg:'删除失败'});
// 		}else{
// 			res.send({code:200,msg:'删除成功'});
// 		}
// 	})
// })
//商品信息添加购物车
//接口：http://localhost:5000/shopcar
//请求方式：post
server.post('/shopcar',(req,res,next)=>{
	var obj=req.body
	console.log(obj)
	pool.query('insert into xzqa_shopcar set?',[obj],(err,result)=>{
		if(err){
			next(err);
			return;
		}
		console.log(result);
		res.send({code:200,msg:'添加成功'})
	})
});
//商品信息移除购物车
//接口：http://localhost:5000/shop
//请求方式：delete
server.delete('/shop',(req,res,next)=>{
	var obj = req.params;
	pool.query('delete from xzqa_shopcar where uid=?',[obj.uid],(err,result)=>{
		if(err){
			next(err);
			return;
		}
		if(result.affectedRows===0){
			res.send({code:501,msg:'删除失败'});
		}else{
			res.send({code:200,msg:'删除成功'});
		}
	})
})
//查询购物车接口：http://localhost:5000/car
server.get('/car',(req,res,next)=>{
	var obj=req.params;
	console.log(req.params)
	pool.query('select * from xzqa_shopcar',[obj],(err,result)=>{
		if(err){
			next(err);
			return;
		}
		if(result.length===0){
			res.send({code:501,msg:'信息查询失败'});
		}else{
			res.send({code:200,msg:'信息查询成功',data:result});
		}
	})
})
// 指定服务器对象监听的端口号
server.listen(5000, () => {
  console.log('server is running...');
});