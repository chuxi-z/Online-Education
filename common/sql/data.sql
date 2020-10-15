show databases;
create database online_education;
use online_education;

create table edu_teacher(
	`id` varchar(19) NOT NULL COMMENT '讲师ID',
	`name` varchar(20) NOT NULL COMMENT '讲师姓名',
	`intro` varchar(255) NOT NULL default '' COMMENT '讲师资历,一句话说明讲师',
	`career` text default NULL COMMENT '讲师简介',
	`level` int(10) UNSIGNED NOT NULL COMMENT '头衔 1高级讲师 2首席讲师',
	`avatar` varchar(255) DEFAULT NULL COMMENT '讲师头像',
	`sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
	`is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
	`gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
	`gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `idx_name`(`name`) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

show tables;
-- drop table if exists edu_teacher;

insert into edu_teacher(id, name, intro, career, level, avatar, gmt_create, gmt_modified) values(1, "Jerry", "nothing is impossible", "good teacher", 5, "xxx", "1889-10-19", "1990-10-09");
insert into edu_teacher(id, name, intro, career, level, avatar, gmt_create, gmt_modified) values(2, "Herry", "everything is possible", "nice teacher", 6, "yyy", "1888-10-19", "2000-10-09");


insert into edu_teacher(id, name, intro, career, level, avatar, gmt_create, gmt_modified) values(4, "a", "everything is possible", "nice teacher", 1, "yyy", "1888-10-19", "2000-10-09");
insert into edu_teacher(id, name, intro, career, level, avatar, gmt_create, gmt_modified) values(5, "s", "everything is possible", "nice teacher", 1, "xxx", "1888-10-19", "2000-10-09");
insert into edu_teacher(id, name, intro, career, level, avatar, gmt_create, gmt_modified) values(6, "d", "everything is possible", "nice teacher", 2, "ydf", "1888-10-19", "2000-10-09");
insert into edu_teacher(id, name, intro, career, level, avatar, gmt_create, gmt_modified) values(7, "f", "everything is possible", "nice teacher", 2, "yga", "1888-10-19", "2000-10-09");
insert into edu_teacher(id, name, intro, career, level, avatar, gmt_create, gmt_modified) values(8, "g", "everything is possible", "nice teacher", 3, "yag", "1888-10-19", "2000-10-09");
insert into edu_teacher(id, name, intro, career, level, avatar, gmt_create, gmt_modified) values(9, "h", "everything is possible", "nice teacher", 1, "yj", "1888-10-19", "2000-10-09");
insert into edu_teacher(id, name, intro, career, level, avatar, gmt_create, gmt_modified) values(10, "k", "everything is possible", "nice teacher", 1, "yj", "1888-10-19", "2000-10-09");
insert into edu_teacher(id, name, intro, career, level, avatar, gmt_create, gmt_modified) values(11, "j", "everything is possible", "nice teacher", 1, "yj", "1888-10-19", "2000-10-09");
insert into edu_teacher(id, name, intro, career, level, avatar, gmt_create, gmt_modified) values(12, "jack", "I am super good", "excellent teacher", 2, "fly", "2020-10-19", "3000-10-09");

select * from edu_teacher;
select * from edu_teacher where name like "%e%";

CREATE TABLE `edu_subject` (
  `id` char(19) NOT NULL COMMENT '课程类别ID',
  `title` varchar(10) NOT NULL COMMENT '类别名称',
  `parent_id` char(19) NOT NULL DEFAULT '0' COMMENT '父ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序字段',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='课程科目';

#
# Data for table "edu_subject"
#
drop table if exists edu_subject;

show tables;
use online_education;
INSERT INTO `edu_subject` VALUES ('1178214681118568449','后端开发','0',1,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681139539969','Java','1178214681118568449',1,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681181483010','前端开发','0',3,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681210843137','JavaScript','1178214681181483010',4,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681231814658','云计算','0',5,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681252786178','Docker','1178214681231814658',5,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681294729217','Linux','1178214681231814658',6,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681324089345','系统/运维','0',7,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681353449473','Linux','1178214681324089345',7,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681382809602','Windows','1178214681324089345',8,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681399586817','数据库','0',9,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681428946945','MySQL','1178214681399586817',9,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681454112770','MongoDB','1178214681399586817',10,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681483472898','大数据','0',11,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681504444418','Hadoop','1178214681483472898',11,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681529610242','Spark','1178214681483472898',12,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681554776066','人工智能','0',13,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681584136193','Python','1178214681554776066',13,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681613496321','编程语言','0',14,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178214681626079234','Java','1178214681613496321',14,'2019-09-29 15:47:25','2019-09-29 15:47:25'),('1178585108407984130','Python','1178214681118568449',2,'2019-09-30 16:19:22','2019-09-30 16:19:22'),('1178585108454121473','HTML/CSS','1178214681181483010',3,'2019-09-30 16:19:22','2019-09-30 16:19:22');
select * from edu_subject;



CREATE TABLE `edu_chapter` (
  `id` char(19) NOT NULL COMMENT '章节ID',
  `course_id` char(19) NOT NULL COMMENT '课程ID',
  `title` varchar(50) NOT NULL COMMENT '章节名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '显示排序',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='课程';

INSERT INTO `edu_chapter` VALUES ('1','14','第一章：HTML',0,'2019-01-01 12:27:40','2019-01-01 12:55:30'),('1181729226915577857','18','第七章：I/O流',70,'2019-10-09 08:32:58','2019-10-09 08:33:20'),('1192252428399751169','1192252213659774977','第一章节',0,'2019-11-07 09:28:25','2019-11-07 09:28:25'),('15','18','第一章：Java入门',0,'2019-01-01 12:27:40','2019-10-09 09:13:19'),('3','14','第二章：CSS',0,'2019-01-01 12:55:35','2019-01-01 12:27:40'),('32','18','第二章：控制台输入和输出',0,'2019-01-01 12:27:40','2019-01-01 12:27:40'),('44','18','第三章：控制流',0,'2019-01-01 12:27:40','2019-01-01 12:27:40'),('48','18','第四章：类的定义',0,'2019-01-01 12:27:40','2019-01-01 12:27:40'),('63','18','第五章：数组',0,'2019-01-01 12:27:40','2019-01-01 12:27:40'),('64','18','第六章：继承',61,'2019-01-01 12:27:40','2019-10-09 08:32:47');

drop table if exists edu_course;
CREATE TABLE `edu_course` (
  `id` char(19) NOT NULL COMMENT '课程ID',
  `teacher_id` char(19) NOT NULL COMMENT '课程讲师ID',
  `subject_id` char(19) NOT NULL COMMENT '课程专业ID',
  `subject_parent_id` char(19) NOT NULL default "0" COMMENT '课程专业父级ID',
  `title` varchar(50) NOT NULL COMMENT '课程标题',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总课时',
  `cover` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '课程封面图片路径',
  `buy_count` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `view_count` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `version` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `status` varchar(10) NOT NULL DEFAULT 'Draft' COMMENT '课程状态 Draft未发布  Normal已发布',
  `is_deleted` tinyint(3) DEFAULT NULL COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`),
  KEY `idx_subject_id` (`subject_id`),
  KEY `idx_teacher_id` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='课程';

INSERT INTO `edu_course` VALUES ('1192252213659774977','1189389726308478977','1178214681139539969','1178214681118568449','java基础课程：test',0.01,2,'https://guli-file-190513.oss-cn-beijing.aliyuncs.com/cover/default.gif',4,387,1,'Normal',0,'2019-11-07 09:27:33','2019-11-18 13:35:03'),('14','1189389726308478977','1101348944971091969','1101348944920760321','XHTML CSS2 JS整站制作教程课程学习',0.00,3,'http://guli-file.oss-cn-beijing.aliyuncs.com/cover/2019/03/13/d0086eb0-f2dc-45f7-bba1-744d95e5be0f.jpg',3,44,15,'Normal',0,'2018-04-02 18:33:34','2019-11-16 21:21:45'),('15','1189389726308478977','1101348944971091969','1101348944920760321','HTML5入门课程学习',0.00,23,'http://guli-file.oss-cn-beijing.aliyuncs.com/cover/2019/03/13/22997b8e-3606-4d2e-9b4f-09f48418b6e4.jpg',0,51,17,'Normal',0,'2018-04-02 18:34:32','2019-11-12 10:19:20'),('18','1189389726308478977','1178214681139539969','1178214681118568449','Java精品课程',0.01,20,'http://guli-file.oss-cn-beijing.aliyuncs.com/cover/2019/03/06/866e9aca-b530-4f71-a690-72d4a4bfd1e7.jpg',151,737,6,'Normal',0,'2018-04-02 21:28:46','2019-11-18 11:14:52');

CREATE TABLE `edu_course_description` (
  `id` char(19) NOT NULL COMMENT '课程ID',
  `description` text COMMENT '课程简介',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程简介';

INSERT INTO `edu_course_description` VALUES ('1104870479077879809','<p>11</p>','2019-03-11 06:23:44','2019-03-11 06:23:44'),('1192252213659774977','<p>测试</p>','2019-11-07 09:27:33','2019-11-13 16:21:28'),('14','','2019-03-13 06:04:43','2019-03-13 06:05:33'),('15','','2019-03-13 06:03:33','2019-03-13 06:04:22'),('18','<p>本套Java视频完全针对零基础学员，课堂实录，自发布以来，好评如潮！Java视频中注重与学生互动，讲授幽默诙谐、细致入微，覆盖Java基础所有核心知识点，同类Java视频中也是代码量大、案例多、实战性强的。同时，本Java视频教程注重技术原理剖析，深入JDK源码，辅以代码实战贯穿始终，用实践驱动理论，并辅以必要的代码练习。</p>\n<p>------------------------------------</p>\n<p>视频特点：</p>\n<p>通过学习本Java视频教程，大家能够真正将Java基础知识学以致用、活学活用，构架Java编程思想，牢牢掌握\"源码级\"的Javase核心技术，并为后续JavaWeb等技术的学习奠定扎实基础。<br /><br />1.通俗易懂，细致入微：每个知识点高屋建瓴，深入浅出，简洁明了的说明问题<br />2.具实战性：全程真正代码实战，涵盖上百个企业应用案例及练习<br />3.深入：源码分析，更有 Java 反射、动态代理的实际应用等<br />4.登录尚硅谷官网，技术讲师免费在线答疑</p>','2019-03-06 18:06:36','2019-10-30 19:58:36');


CREATE TABLE `edu_video` (
  `id` char(19) NOT NULL COMMENT '视频ID',
  `course_id` char(19) NOT NULL COMMENT '课程ID',
  `chapter_id` char(19) NOT NULL COMMENT '章节ID',
  `title` varchar(50) NOT NULL COMMENT '节点名称',
  `video_source_id` varchar(100) DEFAULT NULL COMMENT '云端视频资源',
  `video_original_name` varchar(100) DEFAULT NULL COMMENT '原始文件名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序字段',
  `play_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '播放次数',
  `is_free` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以试听：0收费 1免费',
  `duration` float NOT NULL DEFAULT '0' COMMENT '视频时长（秒）',
  `status` varchar(20) NOT NULL DEFAULT 'Empty' COMMENT 'Empty未上传 Transcoding转码中  Normal正常',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '视频源文件大小（字节）',
  `version` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_course_id` (`course_id`),
  KEY `idx_chapter_id` (`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='课程视频';

INSERT INTO `edu_video` VALUES ('1182499307429339137','18','32','第一节','','',0,0,0,0,'',0,1,'2019-10-11 11:32:59','2019-10-11 11:57:38'),('1185312444399071234','14','1','12','','',0,0,0,0,'Empty',0,1,'2019-10-19 05:51:23','2019-10-19 05:51:33'),('1189434737808990210','18','44','测试','','',1,0,0,0,'Empty',0,1,'2019-10-30 14:51:55','2019-10-30 14:51:55'),('1189471423678939138','18','1181729226915577857','test','2b887dc9584d4dc68908780ec57cd3b9','视频',1,0,0,0,'Empty',0,1,'2019-10-30 17:17:41','2019-10-30 17:17:41'),('1189476403626409986','18','1181729226915577857','22','5155c73dc112475cbbddccf4723f7cef','视频.mp4',0,0,0,0,'Empty',0,1,'2019-10-30 17:37:29','2019-10-30 17:37:29'),('1192252824606289921','1192252213659774977','1192252428399751169','第一课时','756cf06db9cb4f30be85a9758b19c645','eae2b847ef8503b81f5d5593d769dde2.mp4',0,0,0,0,'Empty',0,1,'2019-11-07 09:29:59','2019-11-07 09:29:59'),('1192628092797730818','1192252213659774977','1192252428399751169','第二课时','2a02d726622f4c7089d44cb993c531e1','eae2b847ef8503b81f5d5593d769dde2.mp4',0,0,1,0,'Empty',0,1,'2019-11-08 10:21:10','2019-11-08 10:21:22'),('1192632495013380097','1192252213659774977','1192252428399751169','第三课时','4e560c892fdf4fa2b42e0671aa42fa9d','eae2b847ef8503b81f5d5593d769dde2.mp4',0,0,1,0,'Empty',0,1,'2019-11-08 10:38:40','2019-11-08 10:38:40'),('1194117638832111617','1192252213659774977','1192252428399751169','第四课时','4e560c892fdf4fa2b42e0671aa42fa9d','eae2b847ef8503b81f5d5593d769dde2.mp4',0,0,0,0,'Empty',0,1,'2019-11-12 13:00:05','2019-11-12 13:00:05'),('1196263770832023554','1192252213659774977','1192252428399751169','第五课时','27d21158b0834cb5a8d50710937de330','eae2b847ef8503b81f5d5593d769dde2.mp4',5,0,0,0,'Empty',0,1,'2019-11-18 11:08:03','2019-11-18 11:08:03'),('17','18','15','第一节：Java简介','196116a6fee742e1ba9f6c18f65bd8c1','1',1,1000,1,100,'Draft',0,1,'2019-01-01 13:08:57','2019-10-11 11:26:39'),('18','18','15','第二节：表达式和赋值语句','2d99b08ca0214909899910c9ba042d47','7 - How Do I Find Time for My ',2,999,1,100,'Draft',0,1,'2019-01-01 13:09:02','2019-03-08 03:30:27'),('19','18','15','第三节：String类','51120d59ddfd424cb5ab08b44fc8b23a','eae2b847ef8503b81f5d5593d769dde2.mp4',3,888,0,100,'Draft',0,1,'2019-01-01 13:09:05','2019-11-12 12:50:45'),('20','18','15','第四节：程序风格','2a38988892d84df598752226c50f3fa3','00-day10总结.avi',4,666,0,100,'Draft',0,1,'2019-01-01 13:09:05','2019-10-11 09:20:09');

-- delete from edu_chapter;
-- delete from edu_video;
-- SET SQL_SAFE_UPDATES=1;


CREATE TABLE `crm_banner` (
  `id` char(19) NOT NULL DEFAULT '' COMMENT 'ID',
  `title` varchar(20) DEFAULT '' COMMENT '标题',
  `image_url` varchar(500) NOT NULL DEFAULT '' COMMENT '图片地址',
  `link_url` varchar(500) DEFAULT '' COMMENT '链接地址',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='首页banner表';

select * from crm_banner;

INSERT INTO `crm_banner` VALUES ('1194556896025845762','test1','https://online-teach-file.oss-cn-beijing.aliyuncs.com/cms/2019/11/14/297acd3b-b592-4cfb-a446-a28310369675.jpg','/course',1,0,'2019-11-13 18:05:32','2019-11-18 10:28:22'),('1194607458461216769','test2','https://online-teach-file.oss-cn-beijing.aliyuncs.com/cms/2019/11/13/8f80790d-d736-4842-a6a4-4dcb0d684d4e.jpg','/teacher',2,0,'2019-11-13 21:26:27','2019-11-14 09:12:15');


CREATE TABLE `ucenter_member` (
  `id` char(19) NOT NULL COMMENT '会员id',
  `openid` varchar(128) DEFAULT NULL COMMENT '微信openid',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(2) unsigned DEFAULT NULL COMMENT '性别 1 女，2 男',
  `age` tinyint(3) unsigned DEFAULT NULL COMMENT '年龄',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `sign` varchar(100) DEFAULT NULL COMMENT '用户签名',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用 1（true）已禁用，  0（false）未禁用',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员表';


-- Data for table "ucenter_member"


-- INSERT INTO `ucenter_member` VALUES ('1',NULL,'13700000001','96e79218965eb72c92a549dd5a330112','小三123',1,5,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-01-01 12:11:33','2019-11-08 11:56:01'),('1080736474267144193',NULL,'13700000011','96e79218965eb72c92a549dd5a330112','用户XJtDfaYeKk',1,19,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-01-02 12:12:45','2019-01-02 12:12:56'),('1080736474355224577',NULL,'13700000002','96e79218965eb72c92a549dd5a330112','用户wUrNkzAPrc',1,27,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-01-02 12:13:56','2019-01-02 12:14:07'),('1086387099449442306',NULL,'13520191388','96e79218965eb72c92a549dd5a330112','用户XTMUeHDAoj',2,20,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-01-19 06:17:23','2019-01-19 06:17:23'),('1086387099520745473',NULL,'13520191389','96e79218965eb72c92a549dd5a330112','用户vSdKeDlimn',1,21,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-01-19 06:17:23','2019-01-19 06:17:23'),('1086387099608825858',NULL,'13520191381','96e79218965eb72c92a549dd5a330112','用户EoyWUVXQoP',1,18,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-01-19 06:17:23','2019-01-19 06:17:23'),('1086387099701100545',NULL,'13520191382','96e79218965eb72c92a549dd5a330112','用户LcAYbxLNdN',2,24,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-01-19 06:17:23','2019-01-19 06:17:23'),('1086387099776598018',NULL,'13520191383','96e79218965eb72c92a549dd5a330112','用户dZdjcgltnk',2,25,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-01-19 06:17:23','2019-01-19 06:17:23'),('1086387099852095490',NULL,'13520191384','96e79218965eb72c92a549dd5a330112','用户wNHGHlxUwX',2,23,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-01-19 06:17:23','2019-01-19 06:17:23'),('1106746895272849410','o1R-t5u2TfEVeVjO9CPGdHPNw-to',NULL,NULL,'檀梵\'',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/zZfLXcetf2Rpsibq6HbPUWKgWSJHtha9y1XBeaqluPUs6BYicW1FJaVqj7U3ozHd3iaodGKJOvY2PvqYTuCKwpyfQ/132',NULL,0,0,'2019-03-16 10:39:57','2019-03-16 10:39:57'),('1106822699956654081',NULL,NULL,NULL,NULL,NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-03-16 15:41:10','2019-03-16 15:41:10'),('1106823035660357634','o1R-t5i4gENwHYRb5lVFy98Z0bdk',NULL,NULL,'GaoSir',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJI53RcCuc1no02os6ZrattWGiazlPnicoZQ59zkS7phNdLEWUPDk8fzoxibAnXV1Sbx0trqXEsGhXPw/132',NULL,0,0,'2019-03-16 15:42:30','2019-03-16 15:42:30'),('1106823041599492098',NULL,NULL,NULL,NULL,NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-03-16 15:42:32','2019-03-16 15:42:32'),('1106823115788341250','o1R-t5l_3rnbZbn4jWwFdy6Gk6cg',NULL,NULL,'换个网名哇、',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/jJHyeM0EN2jhB70LntI3k8fEKe7W6CwykrKMgDJM4VZqCpcxibVibX397p0vmbKURGkLS4jxjGB0GpZfxCicgt07w/132',NULL,0,0,'2019-03-16 15:42:49','2019-03-16 15:42:49'),('1106826046730227714','o1R-t5gyxumyBqt0CWcnh0S6Ya1g',NULL,NULL,'我是Helen',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKDRfib8wy7A2ltERKh4VygxdjVC1x5OaOb1t9hot4JNt5agwaVLdJLcD9vJCNcxkvQnlvLYIPfrZw/132',NULL,0,0,'2019-03-16 15:54:28','2019-03-16 15:54:28'),('1106828185829490690','o1R-t5nNlou5lRwBVgGNJFm4rbc4',NULL,NULL,' 虎头',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKxCqRzuYWQmpwiaqQEjNxbC7WicebicXQusU306jgmfoOzUcFg1qaDq5BStiblwBjw5dUOblQ2gUicQOQ/132',NULL,0,0,'2019-03-16 16:02:58','2019-03-16 16:02:58'),('1106830599651442689','o1R-t5hZHQB1cbX7HZJsiM727_SA',NULL,NULL,'是吴啊',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ9CsqApybcs7f3Dyib9IxIh0sBqJb7LicbjU4WticJFF0PVwFvHgtbFdBwfmk3H2t3NyqmEmVx17tRA/132',NULL,0,0,'2019-03-16 16:12:34','2019-03-16 16:12:34'),('1106830976199278593','o1R-t5meKOoyEJ3-IhWRCBKFcvzU',NULL,NULL,'我才是Helen',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epMicP9UT6mVjYWdno0OJZkOXiajG0sllJTbGJ9DYiceej2XvbDSGCK8LCF7jv1PuG2uoYlePWic9XO8A/132',NULL,0,0,'2019-03-16 16:14:03','2019-03-16 16:14:03'),('1106831936900415490','o1R-t5jXYSWakGtnUBnKbfVT5Iok',NULL,NULL,'文若姬',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/3HEmJwpSzguqqAyzmBwqT6aicIanswZibEOicQInQJI3ZY1qmu59icJC6N7SahKqWYv24GvX5KH2fibwt0mPWcTJ3fg/132',NULL,0,0,'2019-03-16 16:17:52','2019-03-16 16:17:52'),('1106832491064442882','o1R-t5sud081Qsa2Vb2xSKgGnf_g',NULL,NULL,'Peanut',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-03-16 16:20:04','2019-03-16 16:20:04'),('1106833021442510849','o1R-t5lsGc3I8P5bDpHj7m_AIRvQ',NULL,NULL,'食物链终结者',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/MQ7qUmCprK9am16M1Ia1Cs3RK0qiarRrl9y8gsssBjIZeS2GwKSrnq7ZYhmrzuzDwBxSMMAofrXeLic9IBlW4M3Q/132',NULL,0,0,'2019-03-16 16:22:11','2019-03-16 16:22:11'),('1191600824445046786',NULL,'15210078344','96e79218965eb72c92a549dd5a330112','IT妖姬',1,5,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-11-05 14:19:10','2019-11-08 18:04:43'),('1191616288114163713',NULL,'17866603606','96e79218965eb72c92a549dd5a330112','xiaowu',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-11-05 15:20:37','2019-11-05 15:20:37'),('1195187659054329857',NULL,'15010546384','96e79218965eb72c92a549dd5a330112','qy',NULL,NULL,'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132',NULL,0,0,'2019-11-15 11:51:58','2019-11-15 11:51:58');


CREATE TABLE `edu_comment` (
  `id` char(19) NOT NULL COMMENT '讲师ID',
  `course_id` varchar(19) NOT NULL DEFAULT '' COMMENT '课程id',
  `teacher_id` char(19) NOT NULL DEFAULT '' COMMENT '讲师id',
  `member_id` varchar(19) NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) DEFAULT NULL COMMENT '会员昵称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '会员头像',
  `content` varchar(500) DEFAULT NULL COMMENT '评论内容',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_course_id` (`course_id`),
  KEY `idx_teacher_id` (`teacher_id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评论';

#
# Data for table "edu_comment"
#

INSERT INTO `edu_comment` VALUES ('1194499162790211585','1192252213659774977','1189389726308478977','1','小三123','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','课程很好',0,'2019-11-13 14:16:08','2019-11-13 14:16:08'),('1194898406466420738','1192252213659774977','1189389726308478977','1','小三123','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','11',0,'2019-11-14 16:42:35','2019-11-14 16:42:35'),('1194898484388200450','1192252213659774977','1189389726308478977','1','小三123','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','111',0,'2019-11-14 16:42:53','2019-11-14 16:42:53'),('1195251020861317122','1192252213659774977','1189389726308478977','1',NULL,NULL,'2233',0,'2019-11-15 16:03:45','2019-11-15 16:03:45'),('1195251382720700418','1192252213659774977','1189389726308478977','1',NULL,NULL,'4455',0,'2019-11-15 16:05:11','2019-11-15 16:05:11'),('1195252819177570306','1192252213659774977','1189389726308478977','1','小三1231','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','55',0,'2019-11-15 16:10:53','2019-11-15 16:10:53'),('1195252899448160258','1192252213659774977','1189389726308478977','1','小三1231','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','55',0,'2019-11-15 16:11:13','2019-11-15 16:11:13'),('1195252920587452417','1192252213659774977','1189389726308478977','1','小三1231','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','223344',0,'2019-11-15 16:11:18','2019-11-15 16:11:18'),('1195262128095559681','14','1189389726308478977','1','小三1231','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','11',0,'2019-11-15 16:47:53','2019-11-15 16:47:53'),('1196264505170767874','1192252213659774977','1189389726308478977','1','小三1231','http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132','666666',0,'2019-11-18 11:10:58','2019-11-18 11:10:58');


CREATE TABLE `t_order` (
  `id` char(19) NOT NULL DEFAULT '',
  `order_no` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `course_id` varchar(19) NOT NULL DEFAULT '' COMMENT '课程id',
  `course_title` varchar(100) DEFAULT NULL COMMENT '课程名称',
  `course_cover` varchar(255) DEFAULT NULL COMMENT '课程封面',
  `teacher_name` varchar(20) DEFAULT NULL COMMENT '讲师名称',
  `member_id` varchar(19) NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) DEFAULT NULL COMMENT '会员昵称',
  `mobile` varchar(11) DEFAULT NULL COMMENT '会员手机',
  `total_fee` decimal(10,2) DEFAULT '0.01' COMMENT '订单金额（分）',
  `pay_type` tinyint(3) DEFAULT NULL COMMENT '支付类型（1：微信 2：支付宝）',
  `status` tinyint(3) DEFAULT NULL COMMENT '订单状态（0：未支付 1：已支付）',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_order_no` (`order_no`),
  KEY `idx_course_id` (`course_id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单';

INSERT INTO `t_order` VALUES ('1195693605513891841','1195693605555834880','18','Java精品课程','http://guli-file.oss-cn-beijing.aliyuncs.com/cover/2019/03/06/866e9aca-b530-4f71-a690-72d4a4bfd1e7.jpg','晴天','1','小三1231','13700000001',1,NULL,0,0,'2019-11-16 21:22:25','2019-11-16 21:22:25'),('1195694200178118657','1195694200186507264','18','Java精品课程','http://guli-file.oss-cn-beijing.aliyuncs.com/cover/2019/03/06/866e9aca-b530-4f71-a690-72d4a4bfd1e7.jpg','晴天','1','小三1231','13700000001',1,NULL,0,0,'2019-11-16 21:24:47','2019-11-16 21:24:47'),('1196264007411744769','1196264005255872512','1192252213659774977','java基础课程：test','https://guli-file-190513.oss-cn-beijing.aliyuncs.com/cover/default.gif','晴天','1','小三1231','13700000001',1,NULL,1,0,'2019-11-18 11:09:00','2019-11-18 11:10:14'),('1196265495278174209','1196265495273979904','18','Java精品课程','http://guli-file.oss-cn-beijing.aliyuncs.com/cover/2019/03/06/866e9aca-b530-4f71-a690-72d4a4bfd1e7.jpg','晴天','1','小三1231','13700000001',1,NULL,0,0,'2019-11-18 11:14:54','2019-11-18 11:14:54');


CREATE TABLE `t_pay_log` (
  `id` char(19) NOT NULL DEFAULT '',
  `order_no` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `pay_time` datetime DEFAULT NULL COMMENT '支付完成时间',
  `total_fee` decimal(10,2) DEFAULT '0.01' COMMENT '支付金额（分）',
  `transaction_id` varchar(30) DEFAULT NULL COMMENT '交易流水号',
  `trade_state` char(20) DEFAULT NULL COMMENT '交易状态',
  `pay_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付类型（1：微信 2：支付宝）',
  `attr` text COMMENT '其他属性',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付日志表';

INSERT INTO `t_pay_log` VALUES ('1194498446013001730','1194498300579704832','2019-11-13 14:13:17',1,'4200000469201911130676624386','SUCCESS',1,'{\"transaction_id\":\"4200000469201911130676624386\",\"nonce_str\":\"2Lc23ILl231It53M\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"CFT\",\"openid\":\"oNpSGwR-QGG5DaZtDkh2UZlsFDQE\",\"sign\":\"5404850AA3ED0E844DE104651477F07A\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1473426802\",\"cash_fee\":\"1\",\"out_trade_no\":\"1194498300579704832\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx8397f8696b538317\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20191113141314\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}',0,'2019-11-13 14:13:17','2019-11-13 14:13:17'),('1195253787449430017','1195253049260314624','2019-11-15 16:14:44',1,'4200000454201911150981874895','SUCCESS',1,'{\"transaction_id\":\"4200000454201911150981874895\",\"nonce_str\":\"MAM5UM4Xhv1lItvO\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"CFT\",\"openid\":\"oNpSGwR-QGG5DaZtDkh2UZlsFDQE\",\"sign\":\"7DBDCAF4A078B30BB3EF073E6A238C20\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1473426802\",\"cash_fee\":\"1\",\"out_trade_no\":\"1195253049260314624\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx8397f8696b538317\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20191115161440\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}',0,'2019-11-15 16:14:44','2019-11-15 16:14:44'),('1196264321397342210','1196264005255872512','2019-11-18 11:10:14',1,'4200000453201911184025781554','SUCCESS',1,'{\"transaction_id\":\"4200000453201911184025781554\",\"nonce_str\":\"D1dHexCLIFIxAAg2\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"CFT\",\"openid\":\"oNpSGwR-QGG5DaZtDkh2UZlsFDQE\",\"sign\":\"C9F5CA1EE49EA7891736D73BEB423962\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1473426802\",\"cash_fee\":\"1\",\"out_trade_no\":\"1196264005255872512\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx8397f8696b538317\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20191118111011\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}',0,'2019-11-18 11:10:14','2019-11-18 11:10:14');





use online_education;
show tables;

select * from edu_chapter;
select * from edu_video;
select * from edu_course;
select * from edu_course_description;
select * from edu_teacher;
select * from edu_subject;
select * from ucenter_member;
select * from edu_comment;
select * from t_order;
select * from t_pay_log;



CREATE TABLE `acl_permission` (
  `id` char(19) NOT NULL DEFAULT '' COMMENT '编号',
  `pid` char(19) NOT NULL DEFAULT '' COMMENT '所属上级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '类型(1:菜单,2:按钮)',
  `permission_value` varchar(50) DEFAULT NULL COMMENT '权限值',
  `path` varchar(100) DEFAULT NULL COMMENT '访问路径',
  `component` varchar(100) DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限';

#
# Data for table "acl_permission"
#

INSERT INTO `acl_permission` VALUES ('1','0','全部数据',0,NULL,NULL,NULL,NULL,NULL,0,'2019-11-15 17:13:06','2019-11-15 17:13:06'),('1195268474480156673','1','权限管理',1,NULL,'/acl','Layout',NULL,NULL,0,'2019-11-15 17:13:06','2019-11-18 13:54:25'),('1195268616021139457','1195268474480156673','用户管理',1,NULL,'user/list','/acl/user/list',NULL,NULL,0,'2019-11-15 17:13:40','2019-11-18 13:53:12'),('1195268788138598401','1195268474480156673','角色管理',1,NULL,'role/list','/acl/role/list',NULL,NULL,0,'2019-11-15 17:14:21','2019-11-15 17:14:21'),('1195268893830864898','1195268474480156673','菜单管理',1,NULL,'menu/list','/acl/menu/list',NULL,NULL,0,'2019-11-15 17:14:46','2019-11-15 17:14:46'),('1195269143060602882','1195268616021139457','查看',2,'user.list','','',NULL,NULL,0,'2019-11-15 17:15:45','2019-11-17 21:57:16'),('1195269295926206466','1195268616021139457','添加',2,'user.add','user/add','/acl/user/form',NULL,NULL,0,'2019-11-15 17:16:22','2019-11-15 17:16:22'),('1195269473479483394','1195268616021139457','修改',2,'user.update','user/update/:id','/acl/user/form',NULL,NULL,0,'2019-11-15 17:17:04','2019-11-15 17:17:04'),('1195269547269873666','1195268616021139457','删除',2,'user.remove','','',NULL,NULL,0,'2019-11-15 17:17:22','2019-11-15 17:17:22'),('1195269821262782465','1195268788138598401','修改',2,'role.update','role/update/:id','/acl/role/form',NULL,NULL,0,'2019-11-15 17:18:27','2019-11-15 17:19:53'),('1195269903542444034','1195268788138598401','查看',2,'role.list','','',NULL,NULL,0,'2019-11-15 17:18:47','2019-11-15 17:18:47'),('1195270037005197313','1195268788138598401','添加',2,'role.add','role/add','/acl/role/form',NULL,NULL,0,'2019-11-15 17:19:19','2019-11-18 11:05:42'),('1195270442602782721','1195268788138598401','删除',2,'role.remove','','',NULL,NULL,0,'2019-11-15 17:20:55','2019-11-15 17:20:55'),('1195270621548568578','1195268788138598401','角色权限',2,'role.acl','role/distribution/:id','/acl/role/roleForm',NULL,NULL,0,'2019-11-15 17:21:38','2019-11-15 17:21:38'),('1195270744097742849','1195268893830864898','查看',2,'permission.list','','',NULL,NULL,0,'2019-11-15 17:22:07','2019-11-15 17:22:07'),('1195270810560684034','1195268893830864898','添加',2,'permission.add','','',NULL,NULL,0,'2019-11-15 17:22:23','2019-11-15 17:22:23'),('1195270862100291586','1195268893830864898','修改',2,'permission.update','','',NULL,NULL,0,'2019-11-15 17:22:35','2019-11-15 17:22:35'),('1195270887933009922','1195268893830864898','删除',2,'permission.remove','','',NULL,NULL,0,'2019-11-15 17:22:41','2019-11-15 17:22:41'),('1195349439240048642','1','讲师管理',1,NULL,'/edu/teacher','Layout',NULL,NULL,0,'2019-11-15 22:34:49','2019-11-15 22:34:49'),('1195349699995734017','1195349439240048642','讲师列表',1,NULL,'list','/edu/teacher/list',NULL,NULL,0,'2019-11-15 22:35:52','2019-11-15 22:35:52'),('1195349810561781761','1195349439240048642','添加讲师',1,NULL,'create','/edu/teacher/form',NULL,NULL,0,'2019-11-15 22:36:18','2019-11-15 22:36:18'),('1195349876252971010','1195349810561781761','添加',2,'teacher.add','','',NULL,NULL,0,'2019-11-15 22:36:34','2019-11-15 22:36:34'),('1195349979797753857','1195349699995734017','查看',2,'teacher.list','','',NULL,NULL,0,'2019-11-15 22:36:58','2019-11-15 22:36:58'),('1195350117270261762','1195349699995734017','修改',2,'teacher.update','edit/:id','/edu/teacher/form',NULL,NULL,0,'2019-11-15 22:37:31','2019-11-15 22:37:31'),('1195350188359520258','1195349699995734017','删除',2,'teacher.remove','','',NULL,NULL,0,'2019-11-15 22:37:48','2019-11-15 22:37:48'),('1195350299365969922','1','课程分类',1,NULL,'/edu/subject','Layout',NULL,NULL,0,'2019-11-15 22:38:15','2019-11-15 22:38:15'),('1195350397751758850','1195350299365969922','课程分类列表',1,NULL,'list','/edu/subject/list',NULL,NULL,0,'2019-11-15 22:38:38','2019-11-15 22:38:38'),('1195350500512206850','1195350299365969922','导入课程分类',1,NULL,'import','/edu/subject/import',NULL,NULL,0,'2019-11-15 22:39:03','2019-11-15 22:39:03'),('1195350612172967938','1195350397751758850','查看',2,'subject.list','','',NULL,NULL,0,'2019-11-15 22:39:29','2019-11-15 22:39:29'),('1195350687590748161','1195350500512206850','导入',2,'subject.import','','',NULL,NULL,0,'2019-11-15 22:39:47','2019-11-15 22:39:47'),('1195350831744782337','1','课程管理',1,NULL,'/edu/course','Layout',NULL,NULL,0,'2019-11-15 22:40:21','2019-11-15 22:40:21'),('1195350919074385921','1195350831744782337','课程列表',1,NULL,'list','/edu/course/list',NULL,NULL,0,'2019-11-15 22:40:42','2019-11-15 22:40:42'),('1195351020463296513','1195350831744782337','发布课程',1,NULL,'info','/edu/course/info',NULL,NULL,0,'2019-11-15 22:41:06','2019-11-15 22:41:06'),('1195351159672246274','1195350919074385921','完成发布',2,'course.publish','publish/:id','/edu/course/publish',NULL,NULL,0,'2019-11-15 22:41:40','2019-11-15 22:44:01'),('1195351326706208770','1195350919074385921','编辑课程',2,'course.update','info/:id','/edu/course/info',NULL,NULL,0,'2019-11-15 22:42:19','2019-11-15 22:42:19'),('1195351566221938690','1195350919074385921','编辑课程大纲',2,'chapter.update','chapter/:id','/edu/course/chapter',NULL,NULL,0,'2019-11-15 22:43:17','2019-11-15 22:43:17'),('1195351862889254913','1','统计分析',1,NULL,'/statistics/daily','Layout',NULL,NULL,0,'2019-11-15 22:44:27','2019-11-15 22:44:27'),('1195351968841568257','1195351862889254913','生成统计',1,NULL,'create','/statistics/daily/create',NULL,NULL,0,'2019-11-15 22:44:53','2019-11-15 22:44:53'),('1195352054917074946','1195351862889254913','统计图表',1,NULL,'chart','/statistics/daily/chart',NULL,NULL,0,'2019-11-15 22:45:13','2019-11-15 22:45:13'),('1195352127734386690','1195352054917074946','查看',2,'daily.list','','',NULL,NULL,0,'2019-11-15 22:45:30','2019-11-15 22:45:30'),('1195352215768633346','1195351968841568257','生成',2,'daily.add','','',NULL,NULL,0,'2019-11-15 22:45:51','2019-11-15 22:45:51'),('1195352547621965825','1','CMS管理',1,NULL,'/cms','Layout',NULL,NULL,0,'2019-11-15 22:47:11','2019-11-18 10:51:46'),('1195352856645701633','1195353513549205505','查看',2,'banner.list','',NULL,NULL,NULL,0,'2019-11-15 22:48:24','2019-11-15 22:48:24'),('1195352909401657346','1195353513549205505','添加',2,'banner.add','banner/add','/cms/banner/form',NULL,NULL,0,'2019-11-15 22:48:37','2019-11-18 10:52:10'),('1195353051395624961','1195353513549205505','修改',2,'banner.update','banner/update/:id','/cms/banner/form',NULL,NULL,0,'2019-11-15 22:49:11','2019-11-18 10:52:05'),('1195353513549205505','1195352547621965825','Bander列表',1,NULL,'banner/list','/cms/banner/list',NULL,NULL,0,'2019-11-15 22:51:01','2019-11-18 10:51:29'),('1195353672110673921','1195353513549205505','删除',2,'banner.remove','','',NULL,NULL,0,'2019-11-15 22:51:39','2019-11-15 22:51:39'),('1195354076890370050','1','订单管理',1,NULL,'/order','Layout',NULL,NULL,0,'2019-11-15 22:53:15','2019-11-15 22:53:15'),('1195354153482555393','1195354076890370050','订单列表',1,NULL,'list','/order/list',NULL,NULL,0,'2019-11-15 22:53:33','2019-11-15 22:53:58'),('1195354315093282817','1195354153482555393','查看',2,'order.list','','',NULL,NULL,0,'2019-11-15 22:54:12','2019-11-15 22:54:12'),('1196301740985311234','1195268616021139457','分配角色',2,'user.assgin','user/role/:id','/acl/user/roleForm',NULL,NULL,0,'2019-11-18 13:38:56','2019-11-18 13:38:56');

#
# Structure for table "acl_role"
#

CREATE TABLE `acl_role` (
  `id` char(19) NOT NULL DEFAULT '' COMMENT '角色id',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) DEFAULT NULL COMMENT '角色编码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "acl_role"
#

INSERT INTO `acl_role` VALUES ('1','普通管理员',NULL,NULL,0,'2019-11-11 13:09:32','2019-11-18 10:27:18'),('1193757683205607426','课程管理员',NULL,NULL,0,'2019-11-11 13:09:45','2019-11-18 10:25:44'),('1196300996034977794','test',NULL,NULL,0,'2019-11-18 13:35:58','2019-11-18 13:35:58');

#
# Structure for table "acl_role_permission"
#

CREATE TABLE `acl_role_permission` (
  `id` char(19) NOT NULL DEFAULT '',
  `role_id` char(19) NOT NULL DEFAULT '',
  `permission_id` char(19) NOT NULL DEFAULT '',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限';

#
# Data for table "acl_role_permission"
#

INSERT INTO `acl_role_permission` VALUES ('1196301979754455041','1','1',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301979792203778','1','1195268474480156673',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301979821563906','1','1195268616021139457',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301979842535426','1','1195269143060602882',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301979855118338','1','1195269295926206466',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301979880284161','1','1195269473479483394',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301979913838593','1','1195269547269873666',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301979926421506','1','1196301740985311234',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301979951587330','1','1195268788138598401',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980014501889','1','1195269821262782465',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980035473410','1','1195269903542444034',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980052250626','1','1195270037005197313',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980077416450','1','1195270442602782721',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980094193665','1','1195270621548568578',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980119359489','1','1195268893830864898',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980136136706','1','1195270744097742849',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980249382913','1','1195270810560684034',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980270354434','1','1195270862100291586',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980287131649','1','1195270887933009922',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980303908866','1','1195349439240048642',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980320686082','1','1195349699995734017',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980345851905','1','1195349979797753857',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980362629121','1','1195350117270261762',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980383600641','1','1195350188359520258',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980408766465','1','1195349810561781761',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980421349378','1','1195349876252971010',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980438126593','1','1195350299365969922',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980450709506','1','1195350397751758850',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980501041153','1','1195350612172967938',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980517818370','1','1195350500512206850',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980538789889','1','1195350687590748161',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980622675970','1','1195350831744782337',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980639453186','1','1195350919074385921',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980660424705','1','1195351159672246274',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980677201922','1','1195351326706208770',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980698173441','1','1195351566221938690',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980714950658','1','1195351020463296513',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980723339266','1','1195351862889254913',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980744310786','1','1195351968841568257',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980761088001','1','1195352215768633346',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980777865217','1','1195352054917074946',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980794642434','1','1195352127734386690',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980811419650','1','1195352547621965825',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980828196865','1','1195353513549205505',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980844974082','1','1195352856645701633',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980861751298','1','1195352909401657346',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980886917122','1','1195353051395624961',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980928860162','1','1195353672110673921',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980954025986','1','1195354076890370050',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980970803201','1','1195354153482555393',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196301980987580418','1','1195354315093282817',1,'2019-11-18 13:39:53','2019-11-18 13:39:53'),('1196305293070077953','1','1',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293099438081','1','1195268474480156673',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293120409602','1','1195268616021139457',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293153964034','1','1195269143060602882',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293183324162','1','1195269295926206466',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293212684290','1','1195269473479483394',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293237850114','1','1195269547269873666',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293271404545','1','1196301740985311234',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293485314049','1','1195268788138598401',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293506285569','1','1195269821262782465',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293527257089','1','1195269903542444034',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293552422914','1','1195270037005197313',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293565005825','1','1195270442602782721',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293594365954','1','1195270621548568578',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293611143169','1','1195268893830864898',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293627920385','1','1195270744097742849',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293657280513','1','1195349439240048642',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293674057729','1','1195349699995734017',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293690834946','1','1195349979797753857',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293716000770','1','1195350117270261762',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293736972290','1','1195350188359520258',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293749555202','1','1195349810561781761',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293766332417','1','1195349876252971010',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293795692546','1','1195350299365969922',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293812469762','1','1195350397751758850',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293837635586','1','1195350612172967938',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293858607106','1','1195350500512206850',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293875384322','1','1195350687590748161',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293892161538','1','1195350831744782337',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293950881794','1','1195350919074385921',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305293976047617','1','1195351159672246274',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305294127042561','1','1195351326706208770',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305294156402690','1','1195351566221938690',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305294177374209','1','1195351862889254913',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305294194151425','1','1195351968841568257',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305294223511554','1','1195352215768633346',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305294240288770','1','1195352054917074946',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305294248677377','1','1195352127734386690',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305294248677378','1','1195352547621965825',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305294319980546','1','1195353513549205505',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305294319980547','1','1195352856645701633',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305294319980548','1','1195352909401657346',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305294378700802','1','1195353051395624961',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305294378700803','1','1195353672110673921',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305294458392577','1','1195354076890370050',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305294483558402','1','1195354153482555393',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305294500335618','1','1195354315093282817',1,'2019-11-18 13:53:03','2019-11-18 13:53:03'),('1196305566656139266','1','1',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305566689693698','1','1195268474480156673',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305566706470913','1','1195268616021139457',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305566740025346','1','1195269143060602882',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305566756802561','1','1195269295926206466',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305566781968385','1','1195269473479483394',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305566811328514','1','1195269547269873666',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305566828105730','1','1196301740985311234',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305566853271554','1','1195268788138598401',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305566878437378','1','1195269821262782465',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305566895214593','1','1195269903542444034',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305566916186113','1','1195270037005197313',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305566949740546','1','1195270442602782721',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305566966517761','1','1195270621548568578',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305566991683585','1','1195268893830864898',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567012655106','1','1195270744097742849',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567029432322','1','1195270810560684034',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567042015233','1','1195270862100291586',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567100735490','1','1195270887933009922',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567117512705','1','1195349439240048642',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567142678530','1','1195349699995734017',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567155261442','1','1195349979797753857',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567172038658','1','1195350117270261762',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567188815873','1','1195350188359520258',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567218176001','1','1195349810561781761',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567234953217','1','1195349876252971010',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567251730434','1','1195350299365969922',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567272701954','1','1195350397751758850',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567289479170','1','1195350612172967938',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567310450690','1','1195350500512206850',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567327227905','1','1195350687590748161',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567448862722','1','1195350831744782337',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567478222850','1','1195350919074385921',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567495000065','1','1195351159672246274',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567520165889','1','1195351326706208770',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567541137409','1','1195351566221938690',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567570497538','1','1195351862889254913',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567587274754','1','1195351968841568257',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567604051970','1','1195352215768633346',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567633412098','1','1195352054917074946',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567683743745','1','1195352127734386690',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567721492481','1','1195352547621965825',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567742464002','1','1195353513549205505',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567771824129','1','1195352856645701633',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567792795650','1','1195352909401657346',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567809572866','1','1195353051395624961',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567843127298','1','1195353672110673921',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567868293122','1','1195354076890370050',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567885070338','1','1195354153482555393',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196305567910236162','1','1195354315093282817',1,'2019-11-18 13:54:08','2019-11-18 13:54:08'),('1196312702601695234','1','1',0,'2019-11-18 14:22:29','2019-11-18 14:22:29'),('1196312702652026881','1','1195268474480156673',0,'2019-11-18 14:22:29','2019-11-18 14:22:29'),('1196312702668804098','1','1195268616021139457',0,'2019-11-18 14:22:29','2019-11-18 14:22:29'),('1196312702698164226','1','1195269143060602882',0,'2019-11-18 14:22:29','2019-11-18 14:22:29'),('1196312702723330049','1','1195269295926206466',0,'2019-11-18 14:22:29','2019-11-18 14:22:29'),('1196312702744301569','1','1195269473479483394',0,'2019-11-18 14:22:29','2019-11-18 14:22:29'),('1196312702765273089','1','1195269547269873666',0,'2019-11-18 14:22:29','2019-11-18 14:22:29'),('1196312702790438913','1','1196301740985311234',0,'2019-11-18 14:22:29','2019-11-18 14:22:29'),('1196312702945628161','1','1195268788138598401',0,'2019-11-18 14:22:29','2019-11-18 14:22:29'),('1196312702970793985','1','1195269821262782465',0,'2019-11-18 14:22:29','2019-11-18 14:22:29'),('1196312703000154114','1','1195269903542444034',0,'2019-11-18 14:22:29','2019-11-18 14:22:29'),('1196312703025319938','1','1195270037005197313',0,'2019-11-18 14:22:29','2019-11-18 14:22:29'),('1196312703046291458','1','1195270442602782721',0,'2019-11-18 14:22:29','2019-11-18 14:22:29'),('1196312703063068673','1','1195270621548568578',0,'2019-11-18 14:22:29','2019-11-18 14:22:29'),('1196312703084040193','1','1195268893830864898',0,'2019-11-18 14:22:29','2019-11-18 14:22:29'),('1196312703113400321','1','1195270744097742849',0,'2019-11-18 14:22:29','2019-11-18 14:22:29'),('1196312703134371842','1','1195270810560684034',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703159537665','1','1195270862100291586',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703184703490','1','1195270887933009922',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703209869313','1','1195349439240048642',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703230840834','1','1195349699995734017',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703251812354','1','1195349979797753857',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703272783873','1','1195350117270261762',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703293755394','1','1195350188359520258',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703327309826','1','1195349810561781761',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703348281345','1','1195349876252971010',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703365058561','1','1195350299365969922',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703386030082','1','1195350397751758850',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703440556034','1','1195350612172967938',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703486693378','1','1195350500512206850',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703511859202','1','1195350687590748161',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703654465537','1','1195350831744782337',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703683825665','1','1195350919074385921',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703700602882','1','1195351159672246274',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703717380098','1','1195351326706208770',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703738351618','1','1195351566221938690',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703759323137','1','1195351020463296513',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703776100353','1','1195351862889254913',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703792877570','1','1195351968841568257',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703830626305','1','1195352215768633346',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703843209217','1','1195352054917074946',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703868375041','1','1195352127734386690',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703889346561','1','1195352547621965825',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703901929473','1','1195353513549205505',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703918706689','1','1195352856645701633',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703952261121','1','1195352909401657346',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703973232642','1','1195353051395624961',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312703990009857','1','1195353672110673921',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312704048730114','1','1195354076890370050',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312704069701633','1','1195354153482555393',0,'2019-11-18 14:22:30','2019-11-18 14:22:30'),('1196312704094867457','1','1195354315093282817',0,'2019-11-18 14:22:30','2019-11-18 14:22:30');

#
# Structure for table "acl_user"
#

CREATE TABLE `acl_user` (
  `id` char(19) NOT NULL COMMENT '会员id',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '微信openid',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `salt` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `token` varchar(100) DEFAULT NULL COMMENT '用户签名',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

#
# Data for table "acl_user"
#

INSERT INTO `acl_user` VALUES ('1','admin','96e79218965eb72c92a549dd5a330112','admin','',NULL,0,'2019-11-01 10:39:47','2019-11-01 10:39:47'),('2','test','96e79218965eb72c92a549dd5a330112','test',NULL,NULL,0,'2019-11-01 16:36:07','2019-11-01 16:40:08');

#
# Structure for table "acl_user_role"
#

CREATE TABLE `acl_user_role` (
  `id` char(19) NOT NULL DEFAULT '' COMMENT '主键id',
  `role_id` char(19) NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` char(19) NOT NULL DEFAULT '0' COMMENT '用户id',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "acl_user_role"
#

INSERT INTO `acl_user_role` VALUES ('1','1','2',0,'2019-11-11 13:09:53','2019-11-11 13:09:53');

show tables;





select ec.id, ec.title, ec.price, ec.lesson_num,
		ecd.description, et.name,
        es1.title as onesubject,
        es2.title as twosubject
from edu_course ec left outer join edu_course_description ecd on ec.id = ecd.id
							left outer join edu_teacher et on ec.teacher_id = et.id
                            left outer join edu_subject es1 on ec.subject_parent_id = es1.id
                            left outer join edu_subject es2 on ec.subject_id = es2.id
                            where ec.id = 1312424788722016257;



select ec.id, ec.title, ec.price, ec.lesson_num as lessonNum, et.name as teacherName, ec.cover,
                ec.buy_count as buyCount, ec.view_count as viewCount,
                ecd.description,
                et.id as teacherId, et.name as teacherName, et.intro, et.avatar,
                es1.id as subjectLevelOneId, es1.title as subjectLevelOne,
                es2.id as subjectLevelTwoId, es2.title as subjectLevelTwo
        from edu_course ec left outer join edu_course_description ecd on ec.id = ecd.id
                                    left outer join edu_teacher et on ec.teacher_id = et.id
                                    left outer join edu_subject es1 on ec.subject_parent_id = es1.id
                                    left outer join edu_subject es2 on ec.subject_id = es2.id
                                    where ec.id = 1312418439938289665;