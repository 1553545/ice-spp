DROP DATABASE  IF EXISTS `xzqa`;

CREATE DATABASE IF  NOT EXISTS  `xzqa` DEFAULT  CHARACTER SET 'utf8';

USE `xzqa`;
/**管理员信息**/
CREATE TABLE xzqa_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(32),
  password VARCHAR(32)
);
INSERT INTO xzqa_user VALUES
(NULL, 'ltian','123456');
/**冰激凌内容信息**/
DROP TABLE IF EXISTS `xzqa_article`;
CREATE TABLE `xzqa_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '雪糕ID,主键且自增',
  `subject` varchar(50) NOT NULL COMMENT '雪糕标题',
  `description` varchar(255) NOT NULL COMMENT '雪糕简介',
  `price` varchar(10) NOT NULL COMMENT '雪糕价格',
  `image` varchar(50) DEFAULT NULL COMMENT '雪糕缩略像',
  `category_id` smallint(5) unsigned NOT NULL COMMENT '外键,雪糕分类ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1107 DEFAULT CHARSET=utf8;
LOCK TABLES `xzqa_article` WRITE;
INSERT INTO `xzqa_article` (`id`, `subject`, `description`, `price`, `image`, `category_id`) VALUES 
(1,'咖啡冰巧','甜度较高，奶味浓郁','13.00','2ecee46320bcf6e49434ddce2a88ec90.jpeg',1),
(2,'纯脆','甜度较高，奶味浓郁，脂肪含量不低于10%','34.00','3ba5e254c6974233dd4636cf8345c34d.jpeg',2),
(3,'和路雪','糖度低，突出的是水果的原味与芳香，口感清爽，无脂肪','21.00','3dff3bffc5633b4a80bfbfb0d2a1498b.jpeg',3),
(4,'巧乐兹','采用新鲜酸奶制成，口感细腻滑顺','12.00','5c4b439f2e7312e548e9adb4dd5971be.jpeg',4),
(5,'绿舌头','“绿舌头”是1998年推出的一款深受人们喜爱的组合型冰棍','14.00','5cfa095b8c9770bb49cc5f1ea7365f6b.jpeg',1),
(6,'冰工厂','不含胆固醇无糖无奶','8.00','5eedb7f531a3cc875e91cad8030da860.jpeg',2),
(7,'花脸雪糕','花脸雪糕又称娃娃头，是外来品，最早是1983年出现在意大利，中国最早的花脸雪糕由引进的生产线制作的，初期的主要原料，配方都是引进的','33.00','6b6275429b9080304019dd61b1130326.jpeg',1),
(8,'趣享杯','巧乐兹香草曲奇阿华田冰淇淋，将香草口味冰淇淋与阿华田口味冰淇淋融于一杯之中，带来双重美味享受；坚果颗粒和奥利奥曲奇颗粒的加入。','21.00','44c007fe33108ba31f793b6e69b50964.jpeg',2),
(9,'可爱多','可爱多属于联合利华（中国）有限公司旗下和路雪品牌，以其强大品牌形象和独特口感征服了无数消费者','19.00','57d7e835334f99977a254825cee62150.jpeg',4),
(10,'豆乳盒子','营养价值较高的豆乳','26.00','84a848085f336d467dd17a0b9d7eba06.jpeg',3),
(11,'Gelato','新鲜牛奶为基底料搭配最浓厚的各式调味原料，直接搅拌冷冻而成','24.00','236ae01a300897a6d084de82a6d82b64.jpeg',3),
(12,'柠檬雪芭','口感细腻滑顺，爽口不腻健康自然，还可帮助消化','16.00','256eea05d510f432853d3710bd3c0da8.jpeg',1),
(13,'杨梅冰糕','没有多余的水和空气在里面，分量厚实','17.00','16075df78f200db0216d49cb2233928c.jpeg',4),
(14,'百多兹',' 汽车有劳斯莱斯，冰淇淋有哈根达斯','24.00','20367e036298f8b55e256c2208c79c14.jpeg',2),
(15,'圣代','百变口味，吃出真滋味','44.00','5230616de52e769a8c49d022479cd6c4.jpeg',2),
(16,'火焰雪糕','冰纷百变，健康奶味','23.00','374045190b81ca5effb30cc17960990d.jpeg',2),
(17,'icecream','无菌有益，酸奶甜蜜','11.00','b3b4ffb05c240ed3d1d5fad1bba1f423.jpeg',2),
(18,'棒棒冰','低卡路里，蚂蚁不理','54.00','b5891d5e3e2b7c40de4c4ca6d7ce7b69.jpeg',1),
(19,'冰岛之恋','百变口味，吃出真滋味','23.00','c0bd02f12336afa3a5368d3616c4b0d1.jpeg',1),
(20,'冰爽港湾','吮在你口，甜在我心','16.00','ca3ba968e1485362b4ef182084a258ef.jpeg',1),
(21,'陌上花开','纯正酸奶，新鲜看得见','21.00','cb3751df95cad91af123fd059698cd76.jpeg',3),
(22,'炸土司','奶香满杯，小心黏手','51.00','df9ae691abe29c6f9c0038248450fffb.jpeg',3),
(23,'焦糖冰激凌','确实有料，健康看得见','11.00','fc6c699785127087d6063f0409935934.jpeg',3),
(24,'冰激凌奶酪','零度生活，快乐我选择','17.00','ffd7f15b3ac6fcce73e16d344eb94907.jpeg',4),
(25,'冰激凌','随意搭配，尽显滋味','48.00','93ead045a9d12a8fbdd1210ac09d3645.jpeg',4),
(26,'桑葚冰激凌','因为冰爽，所以畅饮','19.00','597752508c8d2701588dc95bedf74267.jpeg',4);
UNLOCK TABLES;

-- DROP TABLE IF EXISTS `xzqa_author`;
-- CREATE TABLE `xzqa_author` (
--   `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '作者ID,主键且自增',
--   `username` varchar(30) NOT NULL COMMENT '用户名,唯一',
--   `password` varchar(32) NOT NULL COMMENT '密码,MD5',
--   `nickname` varchar(30) DEFAULT NULL,
--   `avatar` varchar(50) NOT NULL DEFAULT 'unnamed.jpg' COMMENT '用户头像',
--   `article_number` mediumint(9) NOT NULL DEFAULT '0' COMMENT '发表的文章数量',
--   PRIMARY KEY (`id`),
--   UNIQUE KEY `username` (`username`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;


-- LOCK TABLES `xzqa_author` WRITE;
-- INSERT INTO `xzqa_author` (`id`, `username`, `password`, `nickname`, `avatar`, `article_number`) VALUES 
-- (1,'Richard','c51c8bbd9e8c8bc49042ccd5d3e9864d','黑色纯牛M奶','00183a5ab206aea80120be1472a6f5.jpg',0),
-- (2,'Johnny','d0f59baadadd3349e4a9b2674bcceae8','风之谷z','001f075ad3feeda8012138670b58f0.jpg',0),
-- (3,'Martin','81d6f316d169150d0e8733866c38684d','庚方丽理','008c8f59e96a55a801216a4bbcbcb0.jpg',0),
-- (4,'Christina','92109e2189cd79072b7df39317d94fa1','阐炜辉','00adca5a0d93daa80121985c9ef05f.jpg',0),
-- (5,'Margaret','0513a3da7ff53b1aeb42245ebcc5a16e','伯启根','00b2e259575a7da8012193a331099a.jpg',0),
-- (6,'Barbara','5c39b18d77d5f297ff92e4942e5522b5','旅行泡沫','00b3755b2b6eb6a8012034f78d8b5b.jpg',0),
-- (7,'Diana','93b63feb993716772ef3b15b08b8e8a8','燕雨y传','00c1d55af1178ca801206abad941b6.jpg',0),
-- (8,'Melody','ce2f3a5579d231b3b8f8b9e5fc46d361','稀稀哩哩','00d1345abc83d5a801218207516561.jpg',0),
-- (9,'Debbie','28527cdbcc65c696f11897327cb9a6bb','最爱Kitty','00d4325a72b3b6a8012134661d177d.jpg',0),
-- (10,'Scott','bc28af6f750004729474ccbb403bd0ee','游客学者麦','00da335a266f21a80120ba3858f56a.jpg',0),
-- (11,'Shelly','f7ba507db5b5b1150eabf5707f0334dd','天街小雨','00fb2f5b2c9a39a8012034f76e8c48.jpg',0),
-- (12,'Bob','2fc1c0beb992cd7096975cfebf9d5c3b','浮云不说话','010b6f5bb09ad5a8012099c8b8a41f.jpg',0),
-- (13,'Amanda','9d910c8bf395fce35216f0f4fa85432e','左耳似水正','011b395cdd9efaa801208f8b1fb812.jpg',0),
-- (14,'George','578ad8e10dc4edb52ff2bd4ec9bc93a3','吃草莓要吐籽','011c4e5ba0fabba801213deacb693c.jpg',0),
-- (15,'Benjamin','861a744bccc0da5432f097d5838e4b83','没表有时间','0120cd5dc0e038a801209e1fc96ef7.jpg',0);
-- UNLOCK TABLES;

/**冰激凌种类信息**/
DROP TABLE IF EXISTS `xzqa_category`;
CREATE TABLE `xzqa_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型ID,主键且自增',
  `category_name` varchar(30) NOT NULL COMMENT '类型名称,唯一',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
LOCK TABLES `xzqa_category` WRITE;
INSERT INTO `xzqa_category` (`id`, `category_name`) VALUES (1,'性价比冰糕'),(4,'工艺冰大福'),(2,'网红冰激凌'),(3,'口味酸奶盒子');
UNLOCK TABLES;
-- 购物车列表
CREATE TABLE xzqa_shopcar(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  subject VARCHAR(32),
  price varchar(10),
  count varchar(10) default 1
);