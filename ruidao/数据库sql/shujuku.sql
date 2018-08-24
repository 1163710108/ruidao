drop table  product;
drop table shop;
create table shop(
sid int primary key,
susername varchar(20) unique not null,
spassword varchar(20) not null,
sname varchar(20) unique not null,
sern NUMBER(16,2)  ,
stelephone varchar(20) not null unique,
semail varchar(20) not null unique);

drop sequence shop_id;
create sequence shop_id minvalue 0
nomaxvalue
start with 0
increment  by 1   
nocycle  ;     

insert into shop values(shop_id.nextval,'ruidao','123456','睿道自营',0,'123456789','123@qq.com');

select * from shop;


drop table users;

CREATE TABLE users(
    u_id number(10) PRIMARY KEY,
    uusername VARCHAR2(20) NOT NULL unique,
    upassword VARCHAR2(20) NOT NULL,
    uname VARCHAR2(20) NOT NULL,
    uemail VARCHAR2(20) NOT NULL,
    utelephone VARCHAR2(20) NOT NULL,
    ubirthday VARCHAR2(20) NOT NULL,
    usex VARCHAR2(5) NOT NULL,
    umark VARCHAR2(200), 
    ucost number NOT NULL,
    udate varchar2(15) not null
);

drop sequence users_id;
create sequence users_id minvalue 0
nomaxvalue
start with 0
increment  by 1   
nocycle  ; 

select * from users;


drop table category;
create table category(
cid int primary key,
cname varchar(20) not null
);

drop sequence category_id;
create sequence category_id minvalue 0
nomaxvalue
start with 0
increment  by 1   
nocycle  ; 
insert into category values(category_id.nextval,'女装');
insert into category values(category_id.nextval,'鞋靴');
insert into category values(category_id.nextval,'手机数码');
insert into category values(category_id.nextval,'男装');
insert into category values(category_id.nextval,'食品');
insert into category values(category_id.nextval,'百货');
insert into category values(category_id.nextval,'家电');
insert into category values(category_id.nextval,'箱包');
insert into category values(category_id.nextval,'美妆洗护');
insert into category values(category_id.nextval,'运动户外');
insert into category values(category_id.nextval,'家装');
insert into category values(category_id.nextval,'整车车品');
insert into category values(category_id.nextval,'珠宝配饰');
insert into category values(category_id.nextval,'图书乐器');
insert into category values(category_id.nextval,'鲜花宠物');
insert into category values(category_id.nextval,'游戏动漫');
select * from category;


create table product(
pid int primary key,
pname varchar2(150) not null,--这玩意要改多长？--
pprice number(16,2) not null,
pdiscount number(16,2) not null,--默认1.00--
pimage varchar2(100) not null,--images/products/.....--
pcategory int references category(cid)  on delete CASCADE,--类型--
pis_hot int ,--1 or 0 , 默认0--
pshop int references shop(sid) on delete CASCADE,--默认0,睿道自营--
pnumber int,--默认1个--
pdesc varchar(100)--默认null--
);
drop sequence product_id;
create sequence product_id minvalue 0
nomaxvalue
start with 0
increment  by 1   
nocycle  ; 
select * from product;

--添加百货，代号为6--
insert into product values(product_id.nextval,
'创意家居生活日用品小百货卫生间用品用具收纳置物架抖音同款神器',
19.00,1.00,
'images/products/baihuo/baihuo_1.jpg',
6,
0,
1,1,null);

insert into product values(product_id.nextval,
'创意家居生活用品百货女生宿舍开学必备的住校抖音神器家用小东西',
49.00,1.00,
'images/products/baihuo/baihuo_2.jpg',
6,
0,
1,1,null);

insert into product values(product_id.nextval,
'创意家居厨房用品用具小百货店卫生间日用品生活居家用日常小东西',
19.80,1.00,
'images/products/baihuo/baihuo_3.jpg',
6,
0,
1,1,null);

insert into product values(product_id.nextval,
'deHub垃圾袋背心式点断型加厚不易漏家用百货垃圾袋 150只6卷装',
33.00,1.00,
'images/products/baihuo/baihuo_4.jpg',
6,
0,
1,1,null);

insert into product values(product_id.nextval,
'创意家居家庭日常生活日用品小商品百货韩国懒人厨房收纳神器',
11.80,1.00,
'images/products/baihuo/baihuo_5.jpg',
6,
0,
1,1,null);

insert into product values(product_id.nextval,
'日ECHO 办公家用小剪刀 缝纫十字绣剪线头V形不锈钢剪 生活百货',
9.90,1.00,
'images/products/baihuo/baihuo_6.jpg',
6,
0,
1,1,null);

insert into product values(product_id.nextval,
'沙发垫四季通用亚麻沙发巾田园布艺生活棉麻沙发坐垫沙发套防滑',
22.00,1.00,
'images/products/baihuo/baihuo_7.jpg',
6,
0,
1,1,null);

--家电，代号7--
insert into product values(product_id.nextval,
'Fitcooker/非煮不可电饭煲双胆智能6L全自动家用3-4正品5-6人预约',
1298.00,1.00,
'images/products/jiadian/jiadain_1.jpg',
7,
0,
1,1,null);

insert into product values(product_id.nextval,
'Haier海尔HRO5013-5SQ净水器自吸式厨房直饮净水机反渗透纯水滤芯',
299.00,1.00,
'images/products/jiadian/jiadain_2.jpg',
7,
0,
1,1,null);

insert into product values(product_id.nextval,
'Joyoung/九阳 DJ13B-C660SG豆浆机全自动家用免过滤破壁免煮正品',
349.00,1.00,
'images/products/jiadian/jiadain_3.jpg',
7,
0,
1,1,null);
insert into product values(product_id.nextval,
'德尔玛CM1000除螨仪家用吸尘器床铺除尘去螨虫手持式紫外线杀菌机',
369.00,1.00,
'images/products/jiadian/jiadain_4.jpg',
7,
0,
1,1,null);
insert into product values(product_id.nextval,
'华尔理发器进口美国复古油头电推剪专业充电电推子08148-016',
966.00,1.00,
'images/products/jiadian/jiadain_5.jpg',
7,
0,
1,1,null);
insert into product values(product_id.nextval,
'代购 Czech&Speake - Zebrano Wood Shave Set 斑马纹木质刮胡刀礼盒',
4200.00,1.00,
'images/products/jiadian/jiadain_6.jpg',
7,
0,
1,1,null);
insert into product values(product_id.nextval,
'小米米家扫地机器人2家用全自动扫吸式智能静音路径规划吸尘器',
1415.00,1.00,
'images/products/jiadian/jiadain_7.jpg',
7,
0,
1,1,null);
insert into product values(product_id.nextval,
'无线家用吸尘器小型手持式强力小狗静音大吸力推杆除螨机T10 Pro',
2229.00,1.00,
'images/products/jiadian/jiadain_8.jpg',
7,
0,
1,1,null);
insert into product values(product_id.nextval,
'小米 米家空气净化器pro室内办公家用卧室智能氧吧除甲醛雾霾粉尘',
999.00,1.00,
'images/products/jiadian/jiadain_9.jpg',
7,
0,
1,1,null);
--家装，代号11--
insert into product values(product_id.nextval,
'马卡龙配色水晶吊灯餐厅灯卧室灯儿童房美式女孩公主家装灯具灯饰',
488.00,1.00,
'images/products/jiazhuang/jiazhuang1.jpg',
11,
0,
1,1,null);
insert into product values(product_id.nextval,
'圆形LED水晶吸顶灯具客厅灯大气 现代简约温馨卧室灯餐厅灯饰家装',
500.00,1.00,
'images/products/jiazhuang/jiazhuang2.jpg',
11,
0,
1,1,null);
insert into product values(product_id.nextval,
'美式吊灯 客厅吊灯 乡村铁艺吊灯家装吊灯北欧大气灯饰灯具餐厅灯',
665.00,1.00,
'images/products/jiazhuang/jiazhuang3.jpg',
11,
0,
1,1,null);
insert into product values(product_id.nextval,
'东南亚新中式客厅大灯大厅中式实木吸顶灯中国风家用家装灯饰灯具',
438.00,1.00,
'images/products/jiazhuang/jiazhuang4.jpg',
11,
0,
1,1,null);
insert into product values(product_id.nextval,
'定制 现代简约家装圆形水晶吊灯RH美式客厅餐厅田园创意别墅酒店大吊灯',
850.00,1.00,
'images/products/jiazhuang/jiazhuang5.jpg',
11,
0,
1,1,null);
insert into product values(product_id.nextval,
'客厅灯套餐后现代全屋灯具套餐组合三室两厅简约现代家装灯饰套餐',
1208.00,1.00,
'images/products/jiazhuang/jiazhuang6.jpg',
11,
0,
1,1,null);

--美妆洗护，代号9--
insert into product values(product_id.nextval,
'水之密语净澄水活洗护套装600ml*2 控油型 滋润保湿资生堂洗发水',
99.00,1.00,
'images/products/meizhuangxihu/meizhuang1.jpg',
9,
0,
1,1,null);
insert into product values(product_id.nextval,
'西西美妆韩国正品LG睿嫣润膏洗发水洗护二合一持久留香男女无硅油',
49.00,1.00,
'images/products/meizhuangxihu/meizhuang2.jpg',
9,
0,
1,1,null);
insert into product values(product_id.nextval,
'习伟美妆韩国睿嫣润膏洗护合一护发洗头膏洗发水柔顺多效护理',
49.00,1.00,
'images/products/meizhuangxihu/meizhuang3.jpg',
9,
0,
1,1,null);
insert into product values(product_id.nextval,
'AK美妆 RYOE吕 高端黑吕莹韧养发防脱洗发水490ml黑参宝3件洗护',
68.00,1.00,
'images/products/meizhuangxihu/meizhuang4.jpg',
9,
0,
1,1,null);
insert into product values(product_id.nextval,
'蓝家美妆 O London 欧伦敦洗护旅行4件套装 保湿滋润舒缓肌肤现货',
70.00,1.00,
'images/products/meizhuangxihu/meizhuang5.jpg',
9,
0,
1,1,null);
insert into product values(product_id.nextval,
'LIN 美妆 沙漠玫瑰精油香氛洗护旅行套装 无硅油去屑洗发水女',
79.00,1.00,
'images/products/meizhuangxihu/meizhaung6.jpg',
9,
0,
1,1,null);
insert into product values(product_id.nextval,
'美在韩国 FISH美妆 LG睿嫣润膏洗发水洗护二合一coco香水持久留香',
89.00,1.00,
'images/products/meizhuangxihu/meizhaung7.jpg',
9,
0,
1,1,null);
--男装nanzhuang，4--
insert into product values(product_id.nextval,
'短句 夏季潮男宽松加大字母印花复古摇滚短袖T恤半袖ins超火体恤',
55.00,1.00,
'images/products/nanzhuang/nanzhuang_1.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'MPstudios 5/14 立体英文字母印花 ins超火圆领男短袖t恤',
95.00,1.00,
'images/products/nanzhuang/nanzhuang_2.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'小呆~满印复古短袖衫韩版宽松T恤oversize男街头T恤 短袖男破洞',
55.00,1.00,
'images/products/nanzhuang/nanzhuang_hanban.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'短句先生 夏季空调衫 chic韩风长袖宽松透气薄款防晒衣条纹衬衫男',
62.00,1.00,
'images/products/nanzhuang/nanzhuang_chenshan1.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'原创韩国潮男士宽松长袖衬衫春夏青少年格子衬衣学生翻领上衣外套',
98.00 ,1.00,
'images/products/nanzhuang/nanzhuang_chenshan2.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'日系道袍和服男原宿风ins外套 暗黑花卉廓形慵懒风开衫防晒衣衬衫',
60.00 ,1.00,
'images/products/nanzhuang/nanzhuang_chenshan3.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'定制 YOJI OOAK18AW限定女鬼真丝厌食症内田雀拒食长袍风衣',
1889.00 ,1.00,
'images/products/nanzhuang/nanzhuang_waitao1.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'GAOSTUDIOS绑带宽松大衣男外套新款男女廓形复古休闲大码男女风衣',
1390.00 ,1.00,
'images/products/nanzhuang/nanzhuang_waitao2.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'冬季新款绒料加厚夹克韩版修身精品男装时尚帅气短款大口袋外套潮',
198.00  ,1.00,
'images/products/nanzhuang/nanzhuang_waitao3.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'中国风男夏亚麻七分裤宽松大码尼泊尔裤大裆短裤九分阔腿裤灯笼裤',
68.00 ,1.00,
'images/products/nanzhuang/nanzhuang_ku1.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'小明bene 主推款 高腰显腿长直筒宽松纯色开衩弹力休闲裤长裤男',
108.00  ,1.00,
'images/products/nanzhuang/nanzhuang_ku2.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'【STS】DLONGER BELT折裤脚可拆卸飘带宽松6分裤中裤运动西裤ET风',
169.00  ,1.00,
'images/products/nanzhuang/nanzhuang_duanku.jpg',
4,
0,
1,1,null);

--女装，nvzhuang，1，为什么加兴要把女装放在第一个，怕不是emmm--
insert into product values(product_id.nextval,
'新款女装',
159.00  ,1.00,
'images/products/nvzhuang/nvzhaung_1.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'新款连衣裙',
299.00  ,1.00,
'images/products/nvzhuang/nvzhaung_lianyiqun.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'毛绒外套',
599.00  ,1.00,
'images/products/nvzhuang/nvzhuang_maorongwaitao.jpg ',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'性感黑色连衣裙',
999.00  ,1.00,
'images/products/nvzhuang/nvzhuang_shenVloutui.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'雪衫短袖',
99.00 ,1.00,
'images/products/nvzhuang/nvzhuang_xueshanduanxiu.jpg ',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'深红外衣',
199.00  ,1.00,
'images/products/nvzhuang/nvzhuang_shenhongwaiyi.jpg ',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'雪白纱裙',
499.00  ,1.00,
'images/products/nvzhuang/nvzhuang_baiqun.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'碎花裙',
279.00  ,1.00,
'images/products/nvzhuang/nvzhaung_huaqun.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'亚麻色超短裤',
45.00 ,1.00,
'images/products/nvzhuang/nvzhuang_duanku.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'牛仔超短裤',
99.00 ,1.00,
'images/products/nvzhuang/nvzhaung_niuzaichaoduanku.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'斑马纹连衣裙',
99.00 ,1.00,
'images/products/nvzhuang/nvzhaung_banma.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'蓝色外衣',
179.00  ,1.00,
'images/products/nvzhuang/nvzhaung_lanwai.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'棕色羊毛衫',
157.00  ,1.00,
'images/products/nvzhuang/nvzhaung_zongshan.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'黑色外套毛绒领',
599.00  ,1.00,
'images/products/nvzhuang/nvzhaung_heiwai.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'酷黑紧身外衣',
1799.00 ,1.00,
'images/products/nvzhuang/nvzhaung_kuhei.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'宽松黑T恤',
156.00  ,1.00,
'images/products/nvzhuang/nvzhaung_kuant.jpg',
1,
0,
1,1,null);

insert into product values(product_id.nextval,
'98105-A-1',
12999.00  ,1.00,
'images/products/nvzhuang/1.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'2018 冬季新款 设计师 寻雁定制 双面羊毛大衣XY332',
4999.00 ,1.00,
'images/products/nvzhuang/2.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'【ADOL定制】LZW-7628 2018新款撞色拼接设计澳毛女长款大衣6.26 ',
1299.00 ,1.00,
'images/products/nvzhuang/3.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'简约拼接呢子大衣中长款水貂领毛呢外套PY-YM8803 ',
9699.00 ,1.00,
'images/products/nvzhuang/4.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'品牌反季直供 大口袋宽松中长款大毛领羽绒服YLYR069 ',
2099.00 ,1.00,
'images/products/nvzhuang/5.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'修身时尚狐狸毛翻领中长款羽绒服外套女PY-YR1802 ',
10850.00  ,1.00,
'images/products/nvzhuang/6.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'2018新款羽绒服 N661 ',
1789.00 ,1.00,
'images/products/nvzhuang/7.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'鱼小瑜～重量ji作品 今年你要投资一件皮草 大毛领狐狸毛棉衣外套',
3880.00,1.00,
'images/products/nvzhuang/8.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'GM000010新品逆天惊艳奢华刺绣真丝加棉优雅二色上衣双件套女冬 ',
2880.00,1.00,
'images/products/nvzhuang/9.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'Moss烨 高端系列 乳白色露肩高领羊绒毛衣女2018秋冬',
1687.00,1.00,
'images/products/nvzhuang/10.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'2018冬季新品纯色翻领羊绒羊毛内搭长袖女',
999.00,1.00,
'images/products/nvzhuang/11.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'欧洲站2018夏季新款网纱拼接短款气质潮人另类公主网纱牛仔外套 ',
1390.00,1.00,
'images/products/nvzhuang/12.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'Vero Moda欧美灯笼袖系带短款连体裤|317378514',
199.00,1.00,
'images/products/nvzhuang/13.jpg',
1,
0,
1,1,null);

insert into product values(product_id.nextval,
'韩版中长款气质红色印花碎花连衣裙女装夏季2018新款可调节吊带裙 ',
47.00    ,1.00,
'images/products/nvzhuang/14.jpg',
1,
0,
1,1,null);

insert into product values(product_id.nextval,
'周大生黄金戒指 正品999足金新款情侣对戒指环紧箍咒足金戒指',
1399.00,1.00,
'images/products/zhubaopeishi/1.jpg',
13,
0,
1,1,null);
insert into product values(product_id.nextval,
'周大福字母转运珠黄金吊坠计价工费48元F多款 ',
427.50,1.00,
'images/products/zhubaopeishi/2.jpg',
13,
0,
1,1,null);

insert into product values(product_id.nextval,
'七夕礼物周生生黄金手链女款侧身波浪水波纹黄金首饰品09240B计价',
1244.0,1.00,
'images/products/zhubaopeishi/3.jpg',
13,
0,
1,1,null);
insert into product values(product_id.nextval,
'DR Darry Ring 雪花款正品1克拉钻石戒指女式白18K求婚结婚钻戒',
5789.00,1.00,
'images/products/zhubaopeishi/4.jpg',
13,
0,
1,1,null);

insert into product values(product_id.nextval,
'佐卡伊白18k金钻戒钻石求婚结婚戒指女正品婚戒1克拉裸钻定制触电 ',
1999.00,1.00,
'images/products/zhubaopeishi/5.jpg',
13,
0,
1,1,null);
insert into product values(product_id.nextval,
'enzo珠宝 彩虹18K黄金天然彩宝透辉石紫晶托帕石黄晶碧玺耳环耳饰',
1843.00,1.00,
'images/products/zhubaopeishi/6.jpg',
13,
0,
1,1,null);
insert into product values(product_id.nextval,
'米莱珠宝 红碧玺手链女款 18k玫瑰金镶嵌天然鸽血红碧玺彩宝手饰 ',
9900.00,1.00,
'images/products/zhubaopeishi/7.jpg',
13,
0,
1,1,null);
insert into product values(product_id.nextval,
'聚灵吉夏季新款真皮汽车坐垫 三件套无靠背牛皮四季通用单片座垫',
180.00,1.00,
'images/products/zhengchechepin/1.jpg',
12,
0,
1,1,null);
insert into product values(product_id.nextval,
' 恒源祥2018新款汽车真皮坐垫宝马X1X3奥迪Q5A4L迈腾途观L四季座垫',
998.00,1.00,
'images/products/zhengchechepin/2.jpg',
12,
0,
1,1,null);
insert into product values(product_id.nextval,
'奔驰c200l坐垫gla200 glc260 e300L e200l真皮全包专用汽车座垫',
508.00,1.00,
'images/products/zhengchechepin/3.jpg',
12,
0,
1,1,null);
insert into product values(product_id.nextval,
'四季汽车坐垫宝马5系X1奥迪q3q5a4la6大众途观L高尔夫7真皮座椅套',
798.00,1.00,
'images/products/zhengchechepin/4.jpg',
12,
0,
1,1,null);
insert into product values(product_id.nextval,
'【买3送1】固特异汽车轮胎御乘SUV 225/65R17适配RAV4哈弗H6 ',
432.00,1.00,
'images/products/zhengchechepin/5.jpg',
12,
0,
1,1,null);
insert into product values(product_id.nextval,
'重工朝阳前进风神三角23.5-25铲车轮胎50装载机轮胎柳龙临徐厦工 ',
2380.00,1.00,
'images/products/zhengchechepin/6.jpg',
12,
0,
1,1,null);
insert into product values(product_id.nextval,
'汽车货车led射灯12V24V大灯超亮强光工程车铲车叉车挖掘机工作',
18.00,1.00,
'images/products/zhengchechepin/7.jpg',
12,
0,
1,1,null);
insert into product values(product_id.nextval,
'吉普jeep短袖速干t恤男户外短袖排汗运动圆领短袖透气夏季休闲t恤',
139.00,1.00,
'images/products/yundonghuwai/yundong1.jpg',
10,
0,
1,1,null);
insert into product values(product_id.nextval,
'2018新款秋季男鞋小白鞋透气网面运动鞋男登山网布夏季户外休闲鞋',
98.00,1.00,
'images/products/yundonghuwai/yundong2.jpg',
10,
0,
1,1,null);
insert into product values(product_id.nextval,
'Flipbelt跑步腰包多功能户外运动腰带男女士马拉松装备隐形手机包',
199.00,1.00,
'images/products/yundonghuwai/yundong3.jpg',
10,
0,
1,1,null);
insert into product values(product_id.nextval,
'18新品Arcteryx始祖鸟速干衣男户外运动短袖男士T恤Ether Crew SS',
798.00,1.00,
'images/products/yundonghuwai/yundong4.jpg',
10,
0,
1,1,null);
insert into product values(product_id.nextval,
'夏季防晒衣男透气轻薄宽松大码皮肤衣户外运动迷彩风衣外套防晒服',
128.00,1.00,
'images/products/yundonghuwai/yundong5.jpg',
10,
0,
1,1,null);
insert into product values(product_id.nextval,
'凯乐石 T恤男2018春夏新款户外运动纯棉休闲透气短袖上衣男',
99.00,1.00,
'images/products/yundonghuwai/yundong6.jpg',
10,
0,
1,1,null);
insert into product values(product_id.nextval,
'凯乐石 T恤男2018春夏新款户外运动纯棉休闲透气短袖上衣男',
99.00,1.00,
'images/products/yundonghuwai/yundong6.jpg',
10,
0,
1,1,null);
insert into product values(product_id.nextval,
'no game no life zero游戏人生朱碧休比多拉动漫周边925银吊坠 ',
99.00,1.00,
'images/products/youxidongman/1.jpg',
16,
0,
1,1,null);
insert into product values(product_id.nextval,
'漫踪恋与制作人白起同款风衣外套游戏动漫周边还原二次元男友衣服',
149.00,1.00,
'images/products/youxidongman/2.jpg',
16,
0,
1,1,null);
insert into product values(product_id.nextval,
'馒头社动漫二次元游戏周边FateGO莫德雷德羽织浴衣日式和服外套',
99.00,1.00,
'images/products/youxidongman/3.jpg',
16,
0,
1,1,null);
insert into product values(product_id.nextval,
'绝地吃鸡抱枕动漫游戏周边玩具 吃鸡空投箱急救包平底锅抱枕毛绒',
65.00,1.00,
'images/products/youxidongman/4.jpg',
16,
0,
1,1,null);
insert into product values(product_id.nextval,
'荣耀之戒 S925银印象戒指指环 王者农药游戏 动漫周边 ',
135.00,1.00,
'images/products/youxidongman/5.jpg',
16,
0,
1,1,null);
insert into product values(product_id.nextval,
'游戏尼尔机械纪元周边抱枕2B小姐姐动漫同款尤尔靠垫宅男生日礼物 ',
39.00,1.00,
'images/products/youxidongman/6.jpg',
16,
0,
1,1,null);
insert into product values(product_id.nextval,
'MK字母游戏单词本套装 便签笔记本子知音漫客动漫周边开学礼物  ',
15.00,1.00,
'images/products/youxidongman/7.jpg',
16,
0,
1,1,null);
insert into product values(product_id.nextval,
'墨绿色性感丝绒女单鞋',
269.00,1.00,
'images/products/xiexue/xiexue_1.jpg',
2,
0,
1,1,null);
insert into product values(product_id.nextval,
'一字带单鞋女尖头中空高跟鞋',
238.00,1.00,
'images/products/xiexue/xiexue_jiantou.jpg',
2,
0,
1,1,null);
insert into product values(product_id.nextval,
'一款蕾丝婚鞋水钻珍珠凉鞋',
276.00,1.00,
'images/products/xiexue/xiexue_jinhua.jpg',
2,
0,
1,1,null);
insert into product values(product_id.nextval,
'蕾丝尖头低跟平底性感单鞋',
237.00,1.00,
'images/products/xiexue/xiexue_leisi.jpg',
2,
0,
1,1,null);
insert into product values(product_id.nextval,
'细跟超高跟绸缎浅口尖头鞋',
537.00,1.00,
'images/products/xiexue/xiexue_hongjian.jpg',
2,
0,
1,1,null);
insert into product values(product_id.nextval,
'内增高休闲蕾丝镂空平底鞋',
567.00,1.00,
'images/products/xiexue/xiexue_neizenggao.jpg',
2,
0,
1,1,null);
insert into product values(product_id.nextval,
'尖头高跟鞋豹纹女鞋',
999.00,1.00,
'images/products/xiexue/xiexue_baowen.jpg',
2,
0,
1,1,null);
insert into product values(product_id.nextval,
'真皮休闲运动百搭小白鞋女',
993.00,1.00,
'images/products/xiexue/xiexue_hanbai.jpg',
2,
0,
1,1,null);
insert into product values(product_id.nextval,
'喷壶浇花喷雾瓶园艺家用洒水壶气压式喷雾器压力浇水壶小型喷水壶 ',
23.80,1.00,
'images/products/xianhuachongwu/1.jpg',
15,
0,
1,1,null);
insert into product values(product_id.nextval,
'加厚种花工具家用小铁铲种菜养花工具儿童挖野菜赶海铲子园艺工具 ',
10.00,1.00,
'images/products/xianhuachongwu/2.jpg',
15,
0,
1,1,null);
insert into product values(product_id.nextval,
'花土通用型30斤装多肉营养土大包包邮养花种菜种植土花卉泥土土壤',
5.58,1.00,
'images/products/xianhuachongwu/3.jpg',
15,
0,
1,1,null);
insert into product values(product_id.nextval,
'泰国进口猫罐头麦富迪猫咪恋170g*12罐成猫幼猫湿粮零食2套发整箱',
40.00,1.00,
'images/products/xianhuachongwu/4.jpg',
15,
0,
1,1,null);
insert into product values(product_id.nextval,
' 疯狂的小狗狗粮 泰迪比熊贵宾博美雪纳瑞小型幼犬成犬粮通用型3斤 ',
22.17,1.00,
'images/products/xianhuachongwu/5.jpg',
15,
0,
1,1,null);
insert into product values(product_id.nextval,
'森森水族箱鱼缸造浪泵冲浪泵超静音小型造流泵抽粪吹浪泵 ',
19.00,1.00,
'images/products/xianhuachongwu/6.jpg',
15,
0,
1,1,null);
insert into product values(product_id.nextval,
' 森森鱼缸刷磁力刷超强鱼缸擦玻璃擦器清洗清理清洁工具双面擦刷子  ',
69.00,1.00,
'images/products/xianhuachongwu/7.jpg',
15,
0,
1,1,null);
insert into product values(product_id.nextval,
'璐思迪铝框拉杆箱万向轮24寸旅行箱男28寸学生密码箱行李箱女皮箱',
328.00,1.00,
'images/products/xiangbao/box1.jpg',
8,
0,
1,1,null);
insert into product values(product_id.nextval,
'蒙特布朗拉杆箱万向轮男女行李箱包20登机旅行皮箱密码箱子24寸',
268.00,1.00,
'images/products/xiangbao/box2.jpg',
8,
0,
1,1,null);
insert into product values(product_id.nextval,
'梦旅者拉杆箱万向轮铝框旅行箱包男女行李箱子pc密码箱20寸',
498.00,1.00,
'images/products/xiangbao/box3.jpg',
8,
0,
1,1,null);
insert into product values(product_id.nextval,
'全铝镁合金拉杆箱女行李箱万向轮男旅行箱子金属学生密码登机箱包',
485.00,1.00,
'images/products/xiangbao/box4.jpg',
8,
0,
1,1,null);
insert into product values(product_id.nextval,
'行李箱女拉杆箱铝框旅行箱万向轮男26学生密码箱包20寸皮箱子',
268.00,1.00,
'images/products/xiangbao/box5.jpg',
8,
0,
1,1,null);
insert into product values(product_id.nextval,
'爱华仕拉杆箱万向轮20寸女 箱包旅行箱男24寸 学生密码行李箱硬箱',
259.00,1.00,
'images/products/xiangbao/box6.jpg',
8,
0,
1,1,null);
insert into product values(product_id.nextval,
'佐斯登杯架拉杆箱旅行箱包密码行李箱登机箱子万向轮20寸24寸男女',
159.00,1.00,
'images/products/xiangbao/box7.jpg',
8,
0,
1,1,null);
insert into product values(product_id.nextval,
' 中华成语故事大全小学生版注音版国儿童故事书3-6-7-8-10-12周岁小学生课外阅读书籍读物三二年级课外书必读一年级班主任老师推荐 ',
19.90,1.00,
'images/products/tushuyueqi/1.jpg',
14,
0,
1,1,null);
insert into product values(product_id.nextval,
'全套8册成长不烦恼四年级五六年级三年级班主任推荐课外必读的书籍小学生课外阅读3-4-5-6年级儿童读物故事书8-9-10-11-12-15岁 ',
39.80,1.00,
'images/products/tushuyueqi/2.jpg',
14,
0,
1,1,null);
insert into product values(product_id.nextval,
'艾青诗选正版包邮(人民教育出版社) 9年级上册/教育部推荐书目/初中新编统编语文教材配套阅读/诗集完整版/学校指定人教版',
27.04,1.00,
'images/products/tushuyueqi/3.jpg',
14,
0,
1,1,null);
insert into product values(product_id.nextval,
'福尔摩斯探案全集正版10册 适合9-12-15-18岁阅读的四五六年级课外畅销书 少儿侦探悬疑推理小说 福尔摩斯探案集小学生版原版原著 ',
26.80,1.00,
'images/products/tushuyueqi/4.jpg',
14,
0,
1,1,null);
insert into product values(product_id.nextval,
'【新华正版包邮】三体全集123 书 全套共3册 刘慈欣 雨果奖作品三体2黑暗森林死神永生时间简史霍金长篇科幻小说 畅销书籍排行榜',
55.80,1.00,
'images/products/tushuyueqi/5.jpg',
14,
0,
1,1,null);
insert into product values(product_id.nextval,
'【顺风包邮】盗墓笔记全套共1-9册 精装 南派三叔大结局 悬疑惊悚恐怖文学小说书籍 盗墓笔记 老九门后传 电影原著 修订版1-',
135.00,1.00,
'images/products/tushuyueqi/6.jpg',
14,
0,
1,1,null);
insert into product values(product_id.nextval,
'【中商原版】哈利波特全集英文版书籍1-8harry potter英语全套 英国小说正版jk罗琳哈利波特与魔法石与被诅咒的孩子纪念版原著名著',
328.00,1.00,
'images/products/tushuyueqi/7.jpg',
14,
0,
1,1,null);
insert into product values(product_id.nextval,
'优尚丰B6000三防智能手机军工正品对讲全网通4G电信户外超长待机',
3999.00,1.00,
'images/products/shoujishuma/shouji_1.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'PROTRULY/保千里 V10S 保千里打令手机VR手机官方正品指纹电信',
3799.00,1.00,
'images/products/shoujishuma/shouji_hei.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'华为honor/荣耀 V9全网通智能手机 移动联通电信双卡双待2K高清屏',
2599.00,1.00,
'images/products/shoujishuma/shouji_huawei.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'GEMRY/詹姆士 R19 plus全网通4G双卡智能商务手机安全钛金威图',
11999.00,1.00,
'images/products/shoujishuma/shouji_zhenpi.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'小米6【现货送豪礼】Xiaomi/小米 小米手机6骁龙835智能手机正品',
1999.00,1.00,
'images/products/shoujishuma/shouji_xiaomi.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'honor/荣耀 荣耀V10全网通AI智能手机全面屏双卡双待超薄大屏手机',
1599.00,1.00,
'images/products/shoujishuma/shouji_honor.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'【咨询惊喜】Meizu/魅族 魅族 M15全网通4G手机魅族M15魅族15plus',
1699.00,1.00,
'images/products/shoujishuma/shouji_meizu.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'美国代购△keyboard 手作精致蒸汽朋克高端大气金属键盘',
11999.00,1.00,
'images/products/shoujishuma/shuma_1.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'PS4 20周年纪念限定版 PlayStation 20周年限定PS4主机',
15888.00,1.00,
'images/products/shoujishuma/shuma_zhuji.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'Microsoft/微软 IO1.1 X06 欧行盒装',
4999.00,1.00,
'images/products/shoujishuma/shuma_shubiao.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'龙之谷手游球球大作战手机蓝牙安卓苹果游戏手柄 盖世小鸡模拟器',
2758.00,1.00,
'images/products/shoujishuma/shuma_youxiji.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'Mad Catz 美加狮 PROX3游戏鼠标 RGB12000 DPI原相游戏鼠标赛钛客',
2199.00,1.00,
'images/products/shoujishuma/shuma_mouse.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'Hasselblad/哈苏 H6D-50C 中画幅单反相机 h6d50c',
113668.00,1.00,
'images/products/shoujishuma/shuma_danfan.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'2015全新款Nikon/尼康 AF-S NIKKOR 500mm f/4E FL ED VR单反镜头',
62000.00,1.00,
'images/products/shoujishuma/shuma_jingtou.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'【良品铺子肉松饼380gx1袋】早餐糕点零食美食小吃休闲食品散装',
22.90,1.00,
'images/products/shipin/shipin_1.jpg',
5,
0,
1,1,null);
insert into product values(product_id.nextval,
'【良品铺子牛扎奶芙120gx2】雪花酥网红零食小吃美食牛轧糖沙琪玛',
17.90,1.00,
'images/products/shipin/shipin_2.jpg',
5,
0,
1,1,null);
insert into product values(product_id.nextval,
'澳洲5斤装进口生鲜牛腱子真空包装新鲜牛肉生牛肉黄牛肉农家健身1',
134.00,1.00,
'images/products/shipin/shipin_3.jpg',
5,
0,
1,1,null);
insert into product values(product_id.nextval,
'鳄鱼掌腿肉2斤 鲜活生鲜水产 整只活体现杀 新鲜食用带皮煲汤食材',
278.00,1.00,
'images/products/shipin/shipin_4.jpg',
5,
0,
1,1,null);
insert into product values(product_id.nextval,
'野生舟山梭子蟹鲜活螃蟹特大活体生鲜海鲜水产东海花蟹梭子蟹礼盒',
55.00,1.00,
'images/products/shipin/shipin_5.jpg',
5,
0,
1,1,null);
insert into product values(product_id.nextval,
'骄子牧场内蒙古风干手撕牛肉干1斤装麻辣味500g散装零食小吃熟食',
68.00,1.00,
'images/products/shipin/shipin_6.jpg',
5,
0,
1,1,null);


select * from product;


