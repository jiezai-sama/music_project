SET NAMES utf8;
DROP DATABASE IF EXISTS `mj`;
CREATE DATABASE `mj` CHARSET=utf8;

USE `mj`;

--首页轮播图
CREATE TABLE `carousel` (
    `id` INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '轮播图的id,主键且自增',
    `img` VARCHAR(128) NOT NULL COMMENT '图片地址',
    `href` VARCHAR(128) NOT NULL COMMENT '跳转地址',
    `color` VARCHAR(128) NOT NULL COMMENT '背景颜色'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `carousel` (`id`,`img`,`href`,`color`) VALUES (1,'carousel/banner1.jpg','/','linear-gradient(-6deg,#da9c62 0%,#eee 100%)');
INSERT INTO `carousel` (`id`,`img`,`href`,`color`) VALUES (2,'carousel/banner2.jpg','/','linear-gradient(21deg,#C48B4D 0%,#eee 50%,#3E2408 100%)');
INSERT INTO `carousel` (`id`,`img`,`href`,`color`) VALUES (3,'carousel/banner3.jpg','/','linear-gradient(21deg,#C2D4FC 0%,#eee 50%,#ECDDF9 100%)');
INSERT INTO `carousel` (`id`,`img`,`href`,`color`) VALUES (4,'carousel/banner4.jpg','/','linear-gradient(21deg,#B2B6BF 0%,#666 50%,#C5C6C8 100%)');
INSERT INTO `carousel` (`id`,`img`,`href`,`color`) VALUES (5,'carousel/banner5.jpg','/','linear-gradient(21deg,#212C2E 0%,#666 50%,#1D2625 100%)');


--用户表
CREATE TABLE `user` (
    `id` INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '用户ID,主键且自增',
    `username` VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名(登录),唯一',
    `password` VARCHAR(50) NOT NULL COMMENT '密码，md5加密',
    `nickname` VARCHAR(30) DEFAULT '默认用户',
    `userSex` INT DEFAULT '2',
    `phone` VARCHAR(255) DEFAULT '',
    `imgURL` VARCHAR(255) DEFAULT 'touxiang.jpg'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (1,'ceshihao1','25d55ad283aa400af464c76d713c07ad','爱吃鱼的猫');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (2,'ceshihao2','25d55ad283aa400af464c76d713c07ad','油门踩到底');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (3,'ceshihao3','25d55ad283aa400af464c76d713c07ad','调皮的丘丘人');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (4,'ceshihao4','25d55ad283aa400af464c76d713c07ad','levi_me');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (5,'ceshihao5','25d55ad283aa400af464c76d713c07ad','一路向南');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (6,'ceshihao6','25d55ad283aa400af464c76d713c07ad','星星闪烁');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (7,'ceshihao7','25d55ad283aa400af464c76d713c07ad','jacklove');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (8,'ceshihao8','25d55ad283aa400af464c76d713c07ad','繁华人生');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (9,'ceshihao9','25d55ad283aa400af464c76d713c07ad',"Don't say so much");
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (10,'ceshihao10','25d55ad283aa400af464c76d713c07ad','like me');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (11,'ceshihao11','25d55ad283aa400af464c76d713c07ad','小米指挥官');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (12,'ceshihao12','25d55ad283aa400af464c76d713c07ad','青青草原');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (13,'ceshihao13','25d55ad283aa400af464c76d713c07ad','滴滴的小火车');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (14,'ceshihao14','25d55ad283aa400af464c76d713c07ad','红帽');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (15,'ceshihao15','25d55ad283aa400af464c76d713c07ad','龙不行我行');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (16,'ceshihao16','25d55ad283aa400af464c76d713c07ad','苦痛ing');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (17,'ceshihao17','25d55ad283aa400af464c76d713c07ad','我问你答');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (18,'ceshihao18','25d55ad283aa400af464c76d713c07ad','~萤~');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (19,'ceshihao19','25d55ad283aa400af464c76d713c07ad','星星点灯');
INSERT INTO `user` (`id`,`username`,`password`,`nickname`) VALUES (20,'ceshihao20','25d55ad283aa400af464c76d713c07ad','五彩斑斓的黑');

--歌曲表
CREATE TABLE `song` (
    `songId` INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '歌曲id，主键且自增',
    `songName` VARCHAR(30) NOT NULL COMMENT '歌曲名',
    `singerId` INT(10) COMMENT '歌手id,外键',
    `singerName` VARCHAR(30)  COMMENT '歌手名',
    `time` VARCHAR(30)  COMMENT '歌曲时长',
    `image` VARCHAR(30) NOT NULL COMMENT '歌曲图片',
    `songURL` VARCHAR(255) NOT NULL COMMENT '歌曲地址',
    `cyricURL` VARCHAR(255) COMMENT '歌词地址',
    `publishDate` VARCHAR(255) COMMENT '歌曲发行时间',
    `language` VARCHAR(255) COMMENT '语种',
    `CDId` INT COMMENT 'CD专辑编号',
    `CDName` VARCHAR(255) COMMENT '专辑名'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `song` (`songId`,`songName`,`singerId`,`singerName`,`time`,`image`,`songURL`,`cyricURL`,`publishDate`,`language`,`CDId`,`CDName`) VALUES (1,'爱笑的眼睛',1,'林俊杰','04:11','aixiaodeyanjing.jpg','aixiaodeyanjing.mp3','aixiaodeyanjing.lrc','2012-12-21','华语',1,'他是...JJ林俊杰');
INSERT INTO `song` (`songId`,`songName`,`singerId`,`singerName`,`time`,`image`,`songURL`,`cyricURL`,`publishDate`,`language`,`CDId`,`CDName`) VALUES (2,'背对背拥抱',1,'林俊杰','03:58','beiduibeiyongbao.jpg','beiduibeiyongbao.mp3','beiduibeiyongbao.lrc','2012-12-21','华语',1,'他是...JJ林俊杰');
INSERT INTO `song` (`songId`,`songName`,`singerId`,`singerName`,`time`,`image`,`songURL`,`cyricURL`,`publishDate`,`language`,`CDId`,`CDName`) VALUES (3,'被风吹过的夏天',2,'金莎','04:15','beifengchuiguodexiatian.jpg','beifengchuiguodexiatian.mp3','beifengchuiguodexiatian.lrc','2007-03-09','华语',2,'不可思议金选');
INSERT INTO `song` (`songId`,`songName`,`singerId`,`singerName`,`time`,`image`,`songURL`,`cyricURL`,`publishDate`,`language`,`CDId`,`CDName`) VALUES (4,'不潮不用花钱',1,'林俊杰','03:52','buchaobuyonghuaqian.jpg','buchaobuyonghuaqian.mp3','buchaobuyonghuaqian.lrc','2012-12-21','华语',1,'他是...JJ林俊杰');
INSERT INTO `song` (`songId`,`songName`,`singerId`,`singerName`,`time`,`image`,`songURL`,`cyricURL`,`publishDate`,`language`,`CDId`,`CDName`) VALUES (5,'不为谁而作的歌',1,'林俊杰','04:29','buweishuierzuodege.jpg','buweishuierzuodege.mp3','buweishuierzuodege.lrc','2012-12-21','华语',1,'他是...JJ林俊杰');
INSERT INTO `song` (`songId`,`songName`,`singerId`,`singerName`,`time`,`image`,`songURL`,`cyricURL`,`publishDate`,`language`,`CDId`,`CDName`) VALUES (6,'曹操',1,'林俊杰','04:03','caocao.jpg','caocao.mp3','caocao.lrc','2012-12-21','华语',1,'他是...JJ林俊杰');
INSERT INTO `song` (`songId`,`songName`,`singerId`,`singerName`,`time`,`image`,`songURL`,`cyricURL`,`publishDate`,`language`,`CDId`,`CDName`) VALUES (7,'江南',1,'林俊杰','04:27','jiangnan.jpg','jiangnan.mp3','jiangnan.lrc','2012-12-21','华语',1,'他是...JJ林俊杰'); 
INSERT INTO `song` (`songId`,`songName`,`singerId`,`singerName`,`time`,`image`,`songURL`,`cyricURL`,`publishDate`,`language`,`CDId`,`CDName`) VALUES (8,'加油',1,'林俊杰','03:47','jiayou.jpg','jiayou.mp3','jiayou.lrc','2012-12-21','华语',1,'他是...JJ林俊杰');
INSERT INTO `song` (`songId`,`songName`,`singerId`,`singerName`,`time`,`image`,`songURL`,`cyricURL`,`publishDate`,`language`,`CDId`,`CDName`) VALUES (9,'她说',1,'林俊杰','05:20','tashuo.jpg','tashuo.mp3','tashuo.lrc','2015-07-21','华语',4,'你，有没有过');
INSERT INTO `song` (`songId`,`songName`,`singerId`,`singerName`,`time`,`image`,`songURL`,`cyricURL`,`publishDate`,`language`,`CDId`,`CDName`) VALUES (10,'Cheer Singapore',1,'林俊杰','01:26','singapore.jpg','singapore.mp3','singapore.lrc','2010-04-16','华语',3,'Cheer Singapore');
INSERT INTO `song` (`songId`,`songName`,`singerId`,`singerName`,`time`,`image`,`songURL`,`cyricURL`,`publishDate`,`language`,`CDId`,`CDName`) VALUES (11,'你，有没有过',1,'林俊杰','04:00','niyoumeiyouguo.jpg','niyoumeiyouguo.mp3','niyoumeiyouguo.lrc','2015-07-21','华语',4,'你，有没有过');
INSERT INTO `song` (`songId`,`songName`,`singerId`,`singerName`,`time`,`image`,`songURL`,`cyricURL`,`publishDate`,`language`,`CDId`,`CDName`) VALUES (12,'独白',1,'林俊杰','01:34','dubai.jpg','dubai.mp3','dubai.lrc','2007-06-29','华语',5,'西界');

INSERT INTO `song` (`songId`,`songName`,`singerId`,`singerName`,`time`,`image`,`songURL`,`cyricURL`,`publishDate`,`language`,`CDId`,`CDName`) VALUES (13,'全世界我只贪一个他',2,'金莎','04:25','zhitanyigeta.jpg','zhitanyigeta.mp3','zhitanyigeta.lrc','2016-01-14','华语',6,'全世界我只贪一个他');
INSERT INTO `song` (`songId`,`songName`,`singerId`,`singerName`,`time`,`image`,`songURL`,`cyricURL`,`publishDate`,`language`,`CDId`,`CDName`) VALUES (14,'迷恋',2,'金莎','02:58','milian.jpg','milian.mp3','milian.lrc','2007-04-07','华语',7,'迷恋');
INSERT INTO `song` (`songId`,`songName`,`singerId`,`singerName`,`time`,`image`,`songURL`,`cyricURL`,`publishDate`,`language`,`CDId`,`CDName`) VALUES (15,'想听听你说谎',2,'金莎','05:28','xiangtingnishuohuang.jpg','xiangtingnishuohuang.mp3','xiangtingnishuohuang.lrc','2014-09-24','华语',8,'想听你说谎');




--歌单表
CREATE TABLE `songlist` (
    `id` INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '类型id，主键且自增',
    `listName` VARCHAR(30) NOT NULL COMMENT '类型名',
    `introduce` VARCHAR(255) COMMENT '简介',
    `image_sm` VARCHAR(30) NOT NULL COMMENT '类型图片',
    `image_lg` VARCHAR(30) NOT NULL COMMENT '类型图片',
    `typeId` INT COMMENT '类型编号',
    `tags` VARCHAR(255) COMMENT '歌单标签',
    `userId` INT COMMENT '用户id',
    `nickname` VARCHAR(255) COMMENT '用户昵称'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `songlist` (`id`,`listName`,`introduce`,`image_sm`,`image_lg`,`typeId`,`tags`,`userId`,`nickname`) VALUES (1,'最新华语音乐歌单','好听的华语歌曲，大家一起来倾听吧～','chinese.jpg','chinese.jpg',1,'流行|浪漫|华语',1,'爱吃鱼的猫');
INSERT INTO `songlist` (`id`,`listName`,`introduce`,`image_sm`,`image_lg`,`typeId`,`tags`,`userId`,`nickname`) VALUES (2,'日系励志歌曲','日系ACG歌曲，喜欢二次元的朋友们一起冲冲冲','jpan.jpg','jpan.jpg',3,'ACG|激情|日语',2,'油门踩到底');
INSERT INTO `songlist` (`id`,`listName`,`introduce`,`image_sm`,`image_lg`,`typeId`,`tags`,`userId`,`nickname`) VALUES (3,'【练球必备】 超燃英文BGM','给我个篮球，我能打到世界寂寞','ball.jpg','ball.jpg',2,'燃系|激情|欧美',3,'调皮的丘丘人');
INSERT INTO `songlist` (`id`,`listName`,`introduce`,`image_sm`,`image_lg`,`typeId`,`tags`,`userId`,`nickname`) VALUES (4,'Remix硬核车载','各大车主 车载必备精品','chezai.jpg','chezai.jpg',2,'激情|车载|欧美',4,'levi_me');
INSERT INTO `songlist` (`id`,`listName`,`introduce`,`image_sm`,`image_lg`,`typeId`,`tags`,`userId`,`nickname`) VALUES (5,'学习歌单||我的高三时光','歌单是我高三时期创建的，希望高三的学子能够在励志励志的歌曲下越走越远','study.jpg','study.jpg',1,'学习|舒缓|华语',5,'一路向南');
INSERT INTO `songlist` (`id`,`listName`,`introduce`,`image_sm`,`image_lg`,`typeId`,`tags`,`userId`,`nickname`) VALUES (6,'与孤独和解: 哪会孤独，只是更喜欢一个人','听完这些歌，恭喜你获得了与孤独和解的能力~','one.jpg','one.jpg',1,'孤独|低沉|华语',6,'星星闪烁');
INSERT INTO `songlist` (`id`,`listName`,`introduce`,`image_sm`,`image_lg`,`typeId`,`tags`,`userId`,`nickname`) VALUES (7,'工作背景音乐','无论你正在工作还是学习，就让这些音乐做你的BGM，聚精会神歌单，每日更新～','work.jpg','work.jpg',1,'工作|华语',7,'jacklove');
INSERT INTO `songlist` (`id`,`listName`,`introduce`,`image_sm`,`image_lg`,`typeId`,`tags`,`userId`,`nickname`) VALUES (8,'快乐节奏 | 愉悦心情 连呼吸都是甜蜜','双脚变得轻快，触手可及的蓝天，忍不住的把阳光收进口袋里','happy.jpg','happy.jpg',1,'愉悦|美好|华语',8,'繁华人生');
INSERT INTO `songlist` (`id`,`listName`,`introduce`,`image_sm`,`image_lg`,`typeId`,`tags`,`userId`,`nickname`) VALUES (9,'打野BGM | 游戏专用','音乐让你的游戏更具魅力','game.jpg','game.jpg',2,'激情|燃系|欧美',9,"Don't say so much");
INSERT INTO `songlist` (`id`,`listName`,`introduce`,`image_sm`,`image_lg`,`typeId`,`tags`,`userId`,`nickname`) VALUES (10,'一个人 一座坟','愿你被这世界温柔以待，即使生命总以刻薄荒芜相欺……','cry.jpg','cry.jpg',1,'温柔|舒缓|华语',10,'like me');
INSERT INTO `songlist` (`id`,`listName`,`introduce`,`image_sm`,`image_lg`,`typeId`,`tags`,`userId`,`nickname`) VALUES (11,'精致女孩的起床洗漱洗澡化妆bgm',' 没人能在我的专属化妆歌单里美过我','morning.jpg','morning.jpg',1,'女孩|精致|华语',11,'小米指挥官');
INSERT INTO `songlist` (`id`,`listName`,`introduce`,`image_sm`,`image_lg`,`typeId`,`tags`,`userId`,`nickname`) VALUES (12,'睡中良药','在睡梦中度过美好的夜晚','evening.jpg','evening.jpg',1,'夜晚|安静|华语',12,'青青草原');

--歌单对应歌曲表
CREATE TABLE `songlistwithsong` (
    `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '歌曲歌单编号，主键，自动增长',
    `songlistId` INT NOT NULL COMMENT '外键，歌单编号',
    `songId` INT NOT NULL COMMENT '歌曲编号，外键'
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (1,1);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (1,2);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (1,3);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (1,4);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (1,5);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (1,6);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (1,7);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (1,8);  

INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (2,1);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (2,6);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (2,14);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (2,15);  

INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (3,3);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (3,4);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (3,9);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (3,10); 

INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (4,11);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (4,12);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (4,13);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (4,14);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (4,6);  

INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (5,2);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (5,3);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (5,4);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (5,9);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (5,10);  

INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (6,11);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (6,12);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (6,13);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (6,14);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (6,15);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (6,9);  

INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (7,1);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (7,3);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (7,5);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (7,12);  

INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (8,13);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (8,15);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (8,1);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (8,2);  

INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (9,1);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (9,2);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (9,3);  

INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (10,1);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (10,3);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (10,9);  

INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (11,6);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (11,2);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (11,15);  

INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (12,5);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (12,9);  
INSERT INTO `songlistwithsong` (`songlistId`,`songId`) VALUES (12,13);  





--类型表
CREATE TABLE `type` (
    `typeId` INT NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '类型编号',
    `typeName` VARCHAR(255) COMMENT '类型名称'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO `type` (`typeId`,`typeName`) VALUES (1,'华语');
INSERT INTO `type` (`typeId`,`typeName`) VALUES (2,'欧美');
INSERT INTO `type` (`typeId`,`typeName`) VALUES (3,'日语');
INSERT INTO `type` (`typeId`,`typeName`) VALUES (4,'韩语');


--歌手表
CREATE TABLE `singer` (
    `singerId` INT PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT '歌手id,主键且自增',
    `singerName` VARCHAR(255) NOT NULL COMMENT '歌手名',
    `image_sm` VARCHAR(255) COMMENT '歌手图片',
    `image_lg` VARCHAR(255) COMMENT '歌手图片',
    `singerSex` VARCHAR(255)  COMMENT '性别',
    `introduce` VARCHAR(10000) COMMENT '自我简介'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `singer` (`singerId`,`singerName`,`image_sm`,`image_lg`,`singerSex`,`introduce`) VALUES (1,'林俊杰','linjunjie.jpg','linjunjie.jpg','男','<p class="title_f">林俊杰简介</p><p class="content_f">著名男歌手，作曲人、作词人、音乐制作人，偶像与实力兼具。林俊杰出生于新加坡的一个音乐世家。在父母的引导下，4岁就开始学习古典钢琴，不善言辞的他由此发现了另一种与人沟通的语言。小时候的林俊杰把哥哥林俊峰当作偶像，跟随哥哥的步伐做任何事，直到接触流行音乐后，便爱上创作这一条路。2003年以专辑《乐行者》出道，2004年一曲《江南》红遍两岸三地，凭借其健康的形象，迷人的声线，出众的唱功，卓越的才华，迅速成为华语流行乐坛的领军人物之一，迄今为止共创作数百首音乐作品，唱片销量在全亚洲逾1000万张。2007年成立个人音乐制作公司JFJ，2008创立潮流品牌SMG。2011年被媒体封为“新四大天王”之一，同年8月8日正式加盟华纳音乐，开启事业新乐章。2012年发行故事影像书《记得》，成功跻身畅销书作家行列。获得多项奖项：第15届台湾金曲奖最佳新人奖，6届新加坡金曲奖大奖，6届新加坡词曲版权协会大奖，8届全球华语歌曲排行榜大奖，5届MusicRadio中国TOP排行榜大奖。</p><p class="title_f">代表作品</p><p class="content_f">《江南》《一千年以后》《曹操》《小酒窝》《因你而在》</p><p class="title_f">主要成就</p><p class="content_f">第15届台湾金曲奖最佳新人奖</p><p class="content_f">6届新加坡金曲奖大奖</p><p class="content_f">6届新加坡词曲版权协会大奖</p><p class="content_f">8届全球华语歌曲排行榜大奖</p><p class="content_f">5届MusicRadio中国TOP排行榜大奖</p><p class="content_f">3届CCTV-MTV音乐盛典大奖</p><p class="content_f">第27届台湾金曲奖 最佳国语男歌手和最佳作曲人</p>');
INSERT INTO `singer` (`singerId`,`singerName`,`image_sm`,`image_lg`,`singerSex`,`introduce`) VALUES (2,'金莎','jinsha.jpg','jinsha.jpg','女','<p class="title_f">金莎简介</p><p class="content_f">金莎（kym），中国流行女歌手、演员。1983年3月14日生于上海。因2002年参演青春剧《十八岁的天空》而被大众知晓，后签约海蝶音乐，与林俊杰合唱歌曲《被风吹过的夏天》随即步入歌坛，先后共推出五张音乐专辑；2011年9月15日成立“金莎音乐工作室”。2013年与谭杰希、立威廉主演的电影《柠檬》于4月19日在全国各大院线上映</p><p class="title_f">主要成就</p><p class="content_f">2002年《东方新人》选秀比赛三甲（获奖曲目《橙色呼吸》）</p><p class="content_f">第六届百事音乐风云榜最佳新人《空气》</p><p class="content_f">Channe [V]第十二届全球华语音乐榜中榜最佳新人</p><p class="content_f">年第十三届东方风云榜最佳新人</p><p class="content_f">第五届中国金唱片奖内地十大金曲奖</p><p class="content_f">MUSIC RADIOTOP排行榜十大金曲（被风吹过的夏天）</p><p class="content_f">雪碧原创音乐流行榜新鲜榜内地金曲奖</p>');

--cd表
CREATE TABLE `cd` (
    `CDId` INT NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '专辑编号，主键，自动增长',
    `CDName` VARCHAR(255) NOT NULL COMMENT '专辑名称',
    `CDurl` VARCHAR(255) COMMENT '图片地址',
    `publishDate` VARCHAR(255) COMMENT '发行日期',
    `publisher` VARCHAR(255) COMMENT '发行商',
    `singerId` INT COMMENT '歌手编号，外键',
    `singerName` VARCHAR(255) COMMENT '歌手',
    `introduce` VARCHAR(10000) COMMENT 'cd简介'
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `cd` (`CDId`,`CDName`,`CDurl`,`publishDate`,`publisher`,`singerId`,`singerName`,`introduce`) VALUES (1,'他是... JJ林俊杰','id_1.jpg','2012-12-21',' 爱贝克思',1,'林俊杰','<p>近10年岁月，JJ林俊杰，如今被誉为华人歌坛最具影响力的创作歌手之一，光鲜亮丽的背后，蕴藏着许多不为人知的故事。 音乐，让他有了梦想。梦想，让他莫名勇敢。 与海蝶超过10年的共同成长，藴育出扎实的情感联结； 每一个阶段都体现一种成长，每一个过程都呈现最透明的故事。 从他的每一首创作裡，都体现一路上的学习，流露出所吸收的养分。 风风雨雨、美好回忆，点滴心头不言而喻</p><p>这张精选辑，不仅仅只是一张专辑的问世；或是将所有发表过的歌曲集结成辑，而是不管光荣、低潮、开心、沮丧、掌声、嘘声、看好、不看好……这是，JJ林俊杰和海蝶因为玩得开心，所以最专心的...3000多个日子…</p><p>一直以来，JJ林俊杰的音乐如同他一手创造的潮牌S.M.G [Still Move under Gunfire]，不但是JJ林俊杰在创作路上的初衷，也是他永不放弃的动人概念，更是未来的音乐之路上坚持的理想！</p><p>我们希望，用这张作品满载的JJ林俊杰京精神，落下一个完美句号。之后，那毛毛虫是破茧而出的蝶儿，继续翱翔他享受的旅程！</p>');
INSERT INTO `cd` (`CDId`,`CDName`,`CDurl`,`publishDate`,`publisher`,`singerId`,`singerName`,`introduce`) VALUES (2,'不可思议金选','id_2.jpg','2007-03-09','海蝶',2,'金莎','<p>乐坛成绩最亮眼的亚洲新人……</p><p>2007年即将献声……海蝶音乐 3月9日崭新发行……</p><p>一个拥有傲人纪录的精致女声-----【金莎】</p><p>甜蜜新滋味，口感动人，跨海峥嵘 内地艺人来台发片第一人</p><p>近年来内地与台湾之间的交流管道渐行开放，因此，海蝶音乐决定争取金莎来台发片的机会，让台湾除了能听见这个带点甜蜜滋味的新女声，也能见到金莎本人。虽然入境台湾的时间只有短短的14天，但她已经准备好，随时跟大家见面。</p><p>师兄们力挺；林俊杰交出生平第一首男女对唱曲‘被风吹过的夏天’阿杜‘刹那间’MV演出、林宇中量身订做‘不可思议’</p>'); 
INSERT INTO `cd` (`CDId`,`CDName`,`CDurl`,`publishDate`,`publisher`,`singerId`,`singerName`,`introduce`) VALUES (3,'Cheer Singapore','id_3.jpg','2010-04-16',' 海螺唱片',1,'林俊杰','<p>2010新加坡青奥会主题曲 林俊杰亲自操刀作曲</p>');
INSERT INTO `cd` (`CDId`,`CDName`,`CDurl`,`publishDate`,`publisher`,`singerId`,`singerName`,`introduce`) VALUES (4,'你，有没有过','id_4.jpg','2015-07-21','华纳音乐',1,'林俊杰','<p>金曲唱作天王林俊杰</p><p>携手英皇年度夏日热血巨作《破风》</p><p>电影「证人」、「激战」金奖导演林超贤指定邀约</p><p>打造专属青春主题曲—《你, 有没有过》</p><p>金曲唱作天王JJ林俊杰，最近不仅持续为筹备新专辑努力创作，在今年夏天更为电影献出最新作品。继2011年《夏日乐悠悠》创作主题曲《Love UU》之后，JJ这次受到曾执导电影《证人》、《激战》等大片的金奖导演林超贤指定邀约，特别为英皇年度夏日热血巨作《破风》打造专属主题曲—《你,有没有过》。</p>');
INSERT INTO `cd` (`CDId`,`CDName`,`CDurl`,`publishDate`,`publisher`,`singerId`,`singerName`,`introduce`) VALUES (5,'西界','id_5.jpg','2007-06-29','海蝶',1,'林俊杰','<p>JJ林俊杰《西界》第5张全新创作专辑 </p><p>非常 J Fusion 年度必杀专辑！</p><p>东方古典＋南欧浪漫＋美西灵魂＋北非热情 </p><p>每个人心中都有西界，通往那个未知的自己 </p><p>在爱与恨之间 在黑与白之间 在善与恶之间 </p><p>名曲曹操作词大师-林秋离 神来之笔创西界之说 </p><p>罗比威廉斯＆MR.Children＆Glay都崇拜的 </p>');

INSERT INTO `cd` (`CDId`,`CDName`,`CDurl`,`publishDate`,`publisher`,`singerId`,`singerName`,`introduce`) VALUES (6,'全世界我只贪一个他','id_6.jpg','2016-01-14','星琪文化',2,'金莎','<p>离开不对的人，是为了与全世界唯一的他更靠近</p><p>---金莎全新创作单曲 「全世界我只贪一个他」</p><p>爱情里最真实需要的是什么</p><p>不是浪漫、体贴、忠诚</p><p>而是勇敢</p><p>爱情来临时，勇敢去爱很难</p><p>爱情消失时，勇敢决定不爱更难</p><p>放下并非懦弱承认失败，离开需要比相爱更勇敢</p><p>拥有，必先懂得怎么接受失去</p><p>离开不对的人，是为了与全世界唯一的他更靠近</p><p>金莎为每个失恋的恋人，唱出心底最深的期盼</p><p>全世界我只贪一个他，他会舍弃森林只爱我</p>');
INSERT INTO `cd` (`CDId`,`CDName`,`CDurl`,`publishDate`,`publisher`,`singerId`,`singerName`,`introduce`) VALUES (7,'迷恋','id_7.jpg','2007-04-07','海蝶',2,'金莎','<p>全亚洲最亮眼的金致女声"金莎"这首“迷恋”是一首Demo歌曲</p>');
INSERT INTO `cd` (`CDId`,`CDName`,`CDurl`,`publishDate`,`publisher`,`singerId`,`singerName`,`introduce`) VALUES (8,'想听你说谎','id_8.jpg','2014-09-24','海蝶',2,'金莎','<p>只要我们继续说谎，是否我们就能继续相爱</p><p>在爱情里，谎言往往比真相更真实，或许，永远的谎言本身也是一种爱。</p><p>人们在爱情里总是不断追寻想听的答案，哪怕答案是一个谎言，听你说着遥远的梦想，说着未来彼此相伴，也许谎言说久了，有一天就能成真，谎言，才是恋人期待的答案。</p><p> 金莎，《想听听你说谎》，唱出恋人们在心里最真实的话语，想听听你说谎，我们从未有一天遗忘过对方，若要我说谎，我不曾奢望，时光倒流你还在我身旁，走过万千城市，为万千风光伫足，但只有你的情意在我心上留下印记，借着旅行寻找自己，却发现总是不断回想起那个无云的旧日午后。</p><p>爱情里真的容不下谎言吗，或许，永远的谎言本身也是一种爱。</p><p>金莎，《想听听你说谎》，全新创作单曲，为恋人们唱出心底最真实的话语。</p>');

--用户创建歌单表
CREATE TABLE `userwithsonglist` (
    `uListId` INT NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '用户歌单编号',
    `userId` INT NOT NULL COMMENT '用户名，外键',
    `userListName` VARCHAR(255) COMMENT '用户创建的表名',
    `createDate` VARCHAR(255) COMMENT '创建日期',
     `img` VARCHAR(255) COMMENT '图片'
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (1,1,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (2,2,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (3,3,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (4,4,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (5,5,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (6,6,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (7,7,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (8,8,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (9,9,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (10,10,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (11,11,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (12,12,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (13,13,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (14,14,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (15,15,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (16,16,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (17,17,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (18,18,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (19,19,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');
INSERT INTO `userwithsonglist` (`uListId`,`userId`,`userListName`,`createDate`,`img`) VALUES (20,20,'我喜欢的音乐','2020-10-10','/img/userimg/1.jpg');


-- 用户创建歌单表歌曲
CREATE TABLE `userlistwithsong`(
    `uSong` INT NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '用户歌单歌曲',
    `listId` INT NOT NULL COMMENT '外键，用户歌单表',
    `sId` INT NOT NULL COMMENT '外键，歌曲id'
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO `userlistwithsong` (`uSong`,`listId`,`sId`) VALUES (1,1,1);
INSERT INTO `userlistwithsong` (`uSong`,`listId`,`sId`) VALUES (2,1,2);