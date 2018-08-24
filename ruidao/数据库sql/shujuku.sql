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

insert into shop values(shop_id.nextval,'ruidao','123456','���Ӫ',0,'123456789','123@qq.com');

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
insert into category values(category_id.nextval,'Ůװ');
insert into category values(category_id.nextval,'Ьѥ');
insert into category values(category_id.nextval,'�ֻ�����');
insert into category values(category_id.nextval,'��װ');
insert into category values(category_id.nextval,'ʳƷ');
insert into category values(category_id.nextval,'�ٻ�');
insert into category values(category_id.nextval,'�ҵ�');
insert into category values(category_id.nextval,'���');
insert into category values(category_id.nextval,'��ױϴ��');
insert into category values(category_id.nextval,'�˶�����');
insert into category values(category_id.nextval,'��װ');
insert into category values(category_id.nextval,'������Ʒ');
insert into category values(category_id.nextval,'�鱦����');
insert into category values(category_id.nextval,'ͼ������');
insert into category values(category_id.nextval,'�ʻ�����');
insert into category values(category_id.nextval,'��Ϸ����');
select * from category;


create table product(
pid int primary key,
pname varchar2(150) not null,--������Ҫ�Ķ೤��--
pprice number(16,2) not null,
pdiscount number(16,2) not null,--Ĭ��1.00--
pimage varchar2(100) not null,--images/products/.....--
pcategory int references category(cid)  on delete CASCADE,--����--
pis_hot int ,--1 or 0 , Ĭ��0--
pshop int references shop(sid) on delete CASCADE,--Ĭ��0,���Ӫ--
pnumber int,--Ĭ��1��--
pdesc varchar(100)--Ĭ��null--
);
drop sequence product_id;
create sequence product_id minvalue 0
nomaxvalue
start with 0
increment  by 1   
nocycle  ; 
select * from product;

--��Ӱٻ�������Ϊ6--
insert into product values(product_id.nextval,
'����Ҿ���������ƷС�ٻ���������Ʒ�þ���������ܶ���ͬ������',
19.00,1.00,
'images/products/baihuo/baihuo_1.jpg',
6,
0,
1,1,null);

insert into product values(product_id.nextval,
'����Ҿ�������Ʒ�ٻ�Ů�����Ὺѧ�ر���סУ������������С����',
49.00,1.00,
'images/products/baihuo/baihuo_2.jpg',
6,
0,
1,1,null);

insert into product values(product_id.nextval,
'����Ҿӳ�����Ʒ�þ�С�ٻ�������������Ʒ����Ӽ����ճ�С����',
19.80,1.00,
'images/products/baihuo/baihuo_3.jpg',
6,
0,
1,1,null);

insert into product values(product_id.nextval,
'deHub����������ʽ����ͼӺ���©���ðٻ������� 150ֻ6��װ',
33.00,1.00,
'images/products/baihuo/baihuo_4.jpg',
6,
0,
1,1,null);

insert into product values(product_id.nextval,
'����ҾӼ�ͥ�ճ���������ƷС��Ʒ�ٻ��������˳�����������',
11.80,1.00,
'images/products/baihuo/baihuo_5.jpg',
6,
0,
1,1,null);

insert into product values(product_id.nextval,
'��ECHO �칫����С���� ����ʮ�������ͷV�β���ּ� ����ٻ�',
9.90,1.00,
'images/products/baihuo/baihuo_6.jpg',
6,
0,
1,1,null);

insert into product values(product_id.nextval,
'ɳ�����ļ�ͨ������ɳ������԰������������ɳ������ɳ���׷���',
22.00,1.00,
'images/products/baihuo/baihuo_7.jpg',
6,
0,
1,1,null);

--�ҵ磬����7--
insert into product values(product_id.nextval,
'Fitcooker/���󲻿ɵ緹��˫������6Lȫ�Զ�����3-4��Ʒ5-6��ԤԼ',
1298.00,1.00,
'images/products/jiadian/jiadain_1.jpg',
7,
0,
1,1,null);

insert into product values(product_id.nextval,
'Haier����HRO5013-5SQ��ˮ������ʽ����ֱ����ˮ������͸��ˮ��о',
299.00,1.00,
'images/products/jiadian/jiadain_2.jpg',
7,
0,
1,1,null);

insert into product values(product_id.nextval,
'Joyoung/���� DJ13B-C660SG������ȫ�Զ�����������Ʊ�������Ʒ',
349.00,1.00,
'images/products/jiadian/jiadain_3.jpg',
7,
0,
1,1,null);
insert into product values(product_id.nextval,
'�¶���CM1000�����Ǽ������������̳���ȥ�����ֳ�ʽ������ɱ����',
369.00,1.00,
'images/products/jiadian/jiadain_4.jpg',
7,
0,
1,1,null);
insert into product values(product_id.nextval,
'����������������������ͷ���Ƽ�רҵ��������08148-016',
966.00,1.00,
'images/products/jiadian/jiadain_5.jpg',
7,
0,
1,1,null);
insert into product values(product_id.nextval,
'���� Czech&Speake - Zebrano Wood Shave Set ������ľ�ʹκ������',
4200.00,1.00,
'images/products/jiadian/jiadain_6.jpg',
7,
0,
1,1,null);
insert into product values(product_id.nextval,
'С���׼�ɨ�ػ�����2����ȫ�Զ�ɨ��ʽ���ܾ���·���滮������',
1415.00,1.00,
'images/products/jiadian/jiadain_7.jpg',
7,
0,
1,1,null);
insert into product values(product_id.nextval,
'���߼���������С���ֳ�ʽǿ��С�������������Ƹ˳�����T10 Pro',
2229.00,1.00,
'images/products/jiadian/jiadain_8.jpg',
7,
0,
1,1,null);
insert into product values(product_id.nextval,
'С�� �׼ҿ���������pro���ڰ칫���������������ɳ���ȩ�����۳�',
999.00,1.00,
'images/products/jiadian/jiadain_9.jpg',
7,
0,
1,1,null);
--��װ������11--
insert into product values(product_id.nextval,
'������ɫˮ�����Ʋ��������ҵƶ�ͯ����ʽŮ��������װ�ƾߵ���',
488.00,1.00,
'images/products/jiazhuang/jiazhuang1.jpg',
11,
0,
1,1,null);
insert into product values(product_id.nextval,
'Բ��LEDˮ�������ƾ߿����ƴ��� �ִ���Լ��ܰ���ҵƲ������μ�װ',
500.00,1.00,
'images/products/jiazhuang/jiazhuang2.jpg',
11,
0,
1,1,null);
insert into product values(product_id.nextval,
'��ʽ���� �������� ������յ��Ƽ�װ���Ʊ�ŷ�������εƾ߲�����',
665.00,1.00,
'images/products/jiazhuang/jiazhuang3.jpg',
11,
0,
1,1,null);
insert into product values(product_id.nextval,
'����������ʽ������ƴ�����ʽʵľ�������й�����ü�װ���εƾ�',
438.00,1.00,
'images/products/jiazhuang/jiazhuang4.jpg',
11,
0,
1,1,null);
insert into product values(product_id.nextval,
'���� �ִ���Լ��װԲ��ˮ������RH��ʽ����������԰��������Ƶ�����',
850.00,1.00,
'images/products/jiazhuang/jiazhuang5.jpg',
11,
0,
1,1,null);
insert into product values(product_id.nextval,
'�������ײͺ��ִ�ȫ�ݵƾ��ײ��������������Լ�ִ���װ�����ײ�',
1208.00,1.00,
'images/products/jiazhuang/jiazhuang6.jpg',
11,
0,
1,1,null);

--��ױϴ��������9--
insert into product values(product_id.nextval,
'ˮ֮���ﾻ��ˮ��ϴ����װ600ml*2 ������ ����ʪ������ϴ��ˮ',
99.00,1.00,
'images/products/meizhuangxihu/meizhuang1.jpg',
9,
0,
1,1,null);
insert into product values(product_id.nextval,
'������ױ������ƷLG������ϴ��ˮϴ������һ�־�������Ů�޹���',
49.00,1.00,
'images/products/meizhuangxihu/meizhuang2.jpg',
9,
0,
1,1,null);
insert into product values(product_id.nextval,
'ϰΰ��ױ����������ϴ����һ����ϴͷ��ϴ��ˮ��˳��Ч����',
49.00,1.00,
'images/products/meizhuangxihu/meizhuang3.jpg',
9,
0,
1,1,null);
insert into product values(product_id.nextval,
'AK��ױ RYOE�� �߶˺���Ө����������ϴ��ˮ490ml�ڲα�3��ϴ��',
68.00,1.00,
'images/products/meizhuangxihu/meizhuang4.jpg',
9,
0,
1,1,null);
insert into product values(product_id.nextval,
'������ױ O London ŷ�׶�ϴ������4����װ ��ʪ�����滺�����ֻ�',
70.00,1.00,
'images/products/meizhuangxihu/meizhuang5.jpg',
9,
0,
1,1,null);
insert into product values(product_id.nextval,
'LIN ��ױ ɳĮõ�徫�����ϴ��������װ �޹���ȥмϴ��ˮŮ',
79.00,1.00,
'images/products/meizhuangxihu/meizhaung6.jpg',
9,
0,
1,1,null);
insert into product values(product_id.nextval,
'���ں��� FISH��ױ LG������ϴ��ˮϴ������һcoco��ˮ�־�����',
89.00,1.00,
'images/products/meizhuangxihu/meizhaung7.jpg',
9,
0,
1,1,null);
--��װnanzhuang��4--
insert into product values(product_id.nextval,
'�̾� �ļ����п��ɼӴ���ĸӡ������ҡ������T������ins��������',
55.00,1.00,
'images/products/nanzhuang/nanzhuang_1.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'MPstudios 5/14 ����Ӣ����ĸӡ�� ins����Բ���ж���t��',
95.00,1.00,
'images/products/nanzhuang/nanzhuang_2.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'С��~��ӡ���Ŷ������������T��oversize�н�ͷT�� �������ƶ�',
55.00,1.00,
'images/products/nanzhuang/nanzhuang_hanban.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'�̾����� �ļ��յ��� chic���糤�����͸�������ɹ�����Ƴ�����',
62.00,1.00,
'images/products/nanzhuang/nanzhuang_chenshan1.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'ԭ����������ʿ���ɳ������������������ӳ���ѧ��������������',
98.00 ,1.00,
'images/products/nanzhuang/nanzhuang_chenshan2.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'��ϵ���ۺͷ���ԭ�޷�ins���� ���ڻ�����������翪����ɹ�³���',
60.00 ,1.00,
'images/products/nanzhuang/nanzhuang_chenshan3.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'���� YOJI OOAK18AW�޶�Ů����˿��ʳ֢����ȸ��ʳ���۷���',
1889.00 ,1.00,
'images/products/nanzhuang/nanzhuang_waitao1.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'GAOSTUDIOS������ɴ����������¿���Ů���θ������д�����Ů����',
1390.00 ,1.00,
'images/products/nanzhuang/nanzhuang_waitao2.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'�����¿����ϼӺ�п˺�������Ʒ��װʱ��˧���̿��ڴ����׳�',
198.00  ,1.00,
'images/products/nanzhuang/nanzhuang_waitao3.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'�й������������߷ֿ���ɴ����Ჴ������ɶ̿�ŷ����ȿ������',
68.00 ,1.00,
'images/products/nanzhuang/nanzhuang_ku1.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'С��bene ���ƿ� �������ȳ�ֱͲ���ɴ�ɫ���õ������п㳤����',
108.00  ,1.00,
'images/products/nanzhuang/nanzhuang_ku2.jpg',
4,
0,
1,1,null);
insert into product values(product_id.nextval,
'��STS��DLONGER BELT�ۿ�ſɲ�жƮ������6�ֿ��п��˶�����ET��',
169.00  ,1.00,
'images/products/nanzhuang/nanzhuang_duanku.jpg',
4,
0,
1,1,null);

--Ůװ��nvzhuang��1��Ϊʲô����Ҫ��Ůװ���ڵ�һ�����²���emmm--
insert into product values(product_id.nextval,
'�¿�Ůװ',
159.00  ,1.00,
'images/products/nvzhuang/nvzhaung_1.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'�¿�����ȹ',
299.00  ,1.00,
'images/products/nvzhuang/nvzhaung_lianyiqun.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'ë������',
599.00  ,1.00,
'images/products/nvzhuang/nvzhuang_maorongwaitao.jpg ',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'�Ըк�ɫ����ȹ',
999.00  ,1.00,
'images/products/nvzhuang/nvzhuang_shenVloutui.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'ѩ������',
99.00 ,1.00,
'images/products/nvzhuang/nvzhuang_xueshanduanxiu.jpg ',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'�������',
199.00  ,1.00,
'images/products/nvzhuang/nvzhuang_shenhongwaiyi.jpg ',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'ѩ��ɴȹ',
499.00  ,1.00,
'images/products/nvzhuang/nvzhuang_baiqun.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'�黨ȹ',
279.00  ,1.00,
'images/products/nvzhuang/nvzhaung_huaqun.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'����ɫ���̿�',
45.00 ,1.00,
'images/products/nvzhuang/nvzhuang_duanku.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'ţ�г��̿�',
99.00 ,1.00,
'images/products/nvzhuang/nvzhaung_niuzaichaoduanku.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'����������ȹ',
99.00 ,1.00,
'images/products/nvzhuang/nvzhaung_banma.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'��ɫ����',
179.00  ,1.00,
'images/products/nvzhuang/nvzhaung_lanwai.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'��ɫ��ë��',
157.00  ,1.00,
'images/products/nvzhuang/nvzhaung_zongshan.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'��ɫ����ë����',
599.00  ,1.00,
'images/products/nvzhuang/nvzhaung_heiwai.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'��ڽ�������',
1799.00 ,1.00,
'images/products/nvzhuang/nvzhaung_kuhei.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'���ɺ�T��',
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
'2018 �����¿� ���ʦ Ѱ�㶨�� ˫����ë����XY332',
4999.00 ,1.00,
'images/products/nvzhuang/2.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'��ADOL���ơ�LZW-7628 2018�¿�ײɫƴ����ư�ëŮ�������6.26 ',
1299.00 ,1.00,
'images/products/nvzhuang/3.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'��Լƴ�����Ӵ����г���ˮ����ë������PY-YM8803 ',
9699.00 ,1.00,
'images/products/nvzhuang/4.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'Ʒ�Ʒ���ֱ�� ��ڴ������г����ë�����޷�YLYR069 ',
2099.00 ,1.00,
'images/products/nvzhuang/5.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'����ʱ�к���ë�����г������޷�����ŮPY-YR1802 ',
10850.00  ,1.00,
'images/products/nvzhuang/6.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'2018�¿����޷� N661 ',
1789.00 ,1.00,
'images/products/nvzhuang/7.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'��С褡�����ji��Ʒ ������ҪͶ��һ��Ƥ�� ��ë�����ë��������',
3880.00,1.00,
'images/products/nvzhuang/8.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'GM000010��Ʒ���쾪���ݻ�������˿�������Ŷ�ɫ����˫����Ů�� ',
2880.00,1.00,
'images/products/nvzhuang/9.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'Moss�� �߶�ϵ�� ���ɫ¶���������ë��Ů2018�ﶬ',
1687.00,1.00,
'images/products/nvzhuang/10.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'2018������Ʒ��ɫ����������ë�ڴ��Ů',
999.00,1.00,
'images/products/nvzhuang/11.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'ŷ��վ2018�ļ��¿���ɴƴ�Ӷ̿����ʳ������๫����ɴţ������ ',
1390.00,1.00,
'images/products/nvzhuang/12.jpg',
1,
0,
1,1,null);
insert into product values(product_id.nextval,
'Vero Modaŷ��������ϵ���̿������|317378514',
199.00,1.00,
'images/products/nvzhuang/13.jpg',
1,
0,
1,1,null);

insert into product values(product_id.nextval,
'�����г������ʺ�ɫӡ���黨����ȹŮװ�ļ�2018�¿�ɵ��ڵ���ȹ ',
47.00    ,1.00,
'images/products/nvzhuang/14.jpg',
1,
0,
1,1,null);

insert into product values(product_id.nextval,
'�ܴ����ƽ��ָ ��Ʒ999����¿����¶Խ�ָ������������ָ',
1399.00,1.00,
'images/products/zhubaopeishi/1.jpg',
13,
0,
1,1,null);
insert into product values(product_id.nextval,
'�ܴ���ĸת����ƽ��׹�Ƽ۹���48ԪF��� ',
427.50,1.00,
'images/products/zhubaopeishi/2.jpg',
13,
0,
1,1,null);

insert into product values(product_id.nextval,
'��Ϧ�����������ƽ�����Ů�������ˮ���ƻƽ�����Ʒ09240B�Ƽ�',
1244.0,1.00,
'images/products/zhubaopeishi/3.jpg',
13,
0,
1,1,null);
insert into product values(product_id.nextval,
'DR Darry Ring ѩ������Ʒ1������ʯ��ָŮʽ��18K��������',
5789.00,1.00,
'images/products/zhubaopeishi/4.jpg',
13,
0,
1,1,null);

insert into product values(product_id.nextval,
'��������18k�������ʯ������ָŮ��Ʒ���1�������궨�ƴ��� ',
1999.00,1.00,
'images/products/zhubaopeishi/5.jpg',
13,
0,
1,1,null);
insert into product values(product_id.nextval,
'enzo�鱦 �ʺ�18K�ƽ���Ȼ�ʱ�͸��ʯ�Ͼ�����ʯ�ƾ�������������',
1843.00,1.00,
'images/products/zhubaopeishi/6.jpg',
13,
0,
1,1,null);
insert into product values(product_id.nextval,
'�����鱦 ���������Ů�� 18kõ�����Ƕ��Ȼ��Ѫ������ʱ����� ',
9900.00,1.00,
'images/products/zhubaopeishi/7.jpg',
13,
0,
1,1,null);
insert into product values(product_id.nextval,
'���鼪�ļ��¿���Ƥ�������� �������޿���ţƤ�ļ�ͨ�õ�Ƭ����',
180.00,1.00,
'images/products/zhengchechepin/1.jpg',
12,
0,
1,1,null);
insert into product values(product_id.nextval,
' ��Դ��2018�¿�������Ƥ���汦��X1X3�µ�Q5A4L����;��L�ļ�����',
998.00,1.00,
'images/products/zhengchechepin/2.jpg',
12,
0,
1,1,null);
insert into product values(product_id.nextval,
'����c200l����gla200 glc260 e300L e200l��Ƥȫ��ר����������',
508.00,1.00,
'images/products/zhengchechepin/3.jpg',
12,
0,
1,1,null);
insert into product values(product_id.nextval,
'�ļ��������汦��5ϵX1�µ�q3q5a4la6����;��L�߶���7��Ƥ������',
798.00,1.00,
'images/products/zhengchechepin/4.jpg',
12,
0,
1,1,null);
insert into product values(product_id.nextval,
'����3��1��������������̥����SUV 225/65R17����RAV4����H6 ',
432.00,1.00,
'images/products/zhengchechepin/5.jpg',
12,
0,
1,1,null);
insert into product values(product_id.nextval,
'�ع�����ǰ����������23.5-25������̥50װ�ػ���̥���������ù� ',
2380.00,1.00,
'images/products/zhengchechepin/6.jpg',
12,
0,
1,1,null);
insert into product values(product_id.nextval,
'��������led���12V24V��Ƴ���ǿ�⹤�̳������泵�ھ������',
18.00,1.00,
'images/products/zhengchechepin/7.jpg',
12,
0,
1,1,null);
insert into product values(product_id.nextval,
'����jeep�����ٸ�t���л�������ź��˶�Բ�����͸���ļ�����t��',
139.00,1.00,
'images/products/yundonghuwai/yundong1.jpg',
10,
0,
1,1,null);
insert into product values(product_id.nextval,
'2018�¿��＾��ЬС��Ь͸�������˶�Ь�е�ɽ�����ļ���������Ь',
98.00,1.00,
'images/products/yundonghuwai/yundong2.jpg',
10,
0,
1,1,null);
insert into product values(product_id.nextval,
'Flipbelt�ܲ������๦�ܻ����˶�������Ůʿ������װ�������ֻ���',
199.00,1.00,
'images/products/yundonghuwai/yundong3.jpg',
10,
0,
1,1,null);
insert into product values(product_id.nextval,
'18��ƷArcteryxʼ�����ٸ����л����˶�������ʿT��Ether Crew SS',
798.00,1.00,
'images/products/yundonghuwai/yundong4.jpg',
10,
0,
1,1,null);
insert into product values(product_id.nextval,
'�ļ���ɹ����͸���ᱡ���ɴ���Ƥ���»����˶��Բʷ������׷�ɹ��',
128.00,1.00,
'images/products/yundonghuwai/yundong5.jpg',
10,
0,
1,1,null);
insert into product values(product_id.nextval,
'����ʯ T����2018�����¿���˶���������͸������������',
99.00,1.00,
'images/products/yundonghuwai/yundong6.jpg',
10,
0,
1,1,null);
insert into product values(product_id.nextval,
'����ʯ T����2018�����¿���˶���������͸������������',
99.00,1.00,
'images/products/yundonghuwai/yundong6.jpg',
10,
0,
1,1,null);
insert into product values(product_id.nextval,
'no game no life zero��Ϸ��������ݱȶ��������ܱ�925����׹ ',
99.00,1.00,
'images/products/youxidongman/1.jpg',
16,
0,
1,1,null);
insert into product values(product_id.nextval,
'�������������˰���ͬ�����������Ϸ�����ܱ߻�ԭ����Ԫ�����·�',
149.00,1.00,
'images/products/youxidongman/2.jpg',
16,
0,
1,1,null);
insert into product values(product_id.nextval,
'��ͷ�綯������Ԫ��Ϸ�ܱ�FateGOĪ���׵���֯ԡ����ʽ�ͷ�����',
99.00,1.00,
'images/products/youxidongman/3.jpg',
16,
0,
1,1,null);
insert into product values(product_id.nextval,
'���سԼ���������Ϸ�ܱ���� �Լ���Ͷ�伱�Ȱ�ƽ�׹�����ë��',
65.00,1.00,
'images/products/youxidongman/4.jpg',
16,
0,
1,1,null);
insert into product values(product_id.nextval,
'��ҫ֮�� S925��ӡ���ָָ�� ����ũҩ��Ϸ �����ܱ� ',
135.00,1.00,
'images/products/youxidongman/5.jpg',
16,
0,
1,1,null);
insert into product values(product_id.nextval,
'��Ϸ�����е��Ԫ�ܱ߱���2BС��㶯��ͬ���ȶ�����լ���������� ',
39.00,1.00,
'images/products/youxidongman/6.jpg',
16,
0,
1,1,null);
insert into product values(product_id.nextval,
'MK��ĸ��Ϸ���ʱ���װ ��ǩ�ʼǱ���֪�����Ͷ����ܱ߿�ѧ����  ',
15.00,1.00,
'images/products/youxidongman/7.jpg',
16,
0,
1,1,null);
insert into product values(product_id.nextval,
'ī��ɫ�Ը�˿��Ů��Ь',
269.00,1.00,
'images/products/xiexue/xiexue_1.jpg',
2,
0,
1,1,null);
insert into product values(product_id.nextval,
'һ�ִ���ЬŮ��ͷ�пո߸�Ь',
238.00,1.00,
'images/products/xiexue/xiexue_jiantou.jpg',
2,
0,
1,1,null);
insert into product values(product_id.nextval,
'һ����˿��Ьˮ��������Ь',
276.00,1.00,
'images/products/xiexue/xiexue_jinhua.jpg',
2,
0,
1,1,null);
insert into product values(product_id.nextval,
'��˿��ͷ�͸�ƽ���Ըе�Ь',
237.00,1.00,
'images/products/xiexue/xiexue_leisi.jpg',
2,
0,
1,1,null);
insert into product values(product_id.nextval,
'ϸ�����߸����ǳ�ڼ�ͷЬ',
537.00,1.00,
'images/products/xiexue/xiexue_hongjian.jpg',
2,
0,
1,1,null);
insert into product values(product_id.nextval,
'������������˿�ο�ƽ��Ь',
567.00,1.00,
'images/products/xiexue/xiexue_neizenggao.jpg',
2,
0,
1,1,null);
insert into product values(product_id.nextval,
'��ͷ�߸�Ь����ŮЬ',
999.00,1.00,
'images/products/xiexue/xiexue_baowen.jpg',
2,
0,
1,1,null);
insert into product values(product_id.nextval,
'��Ƥ�����˶��ٴ�С��ЬŮ',
993.00,1.00,
'images/products/xiexue/xiexue_hanbai.jpg',
2,
0,
1,1,null);
insert into product values(product_id.nextval,
'�����������ƿ԰�ռ�����ˮ����ѹʽ������ѹ����ˮ��С����ˮ�� ',
23.80,1.00,
'images/products/xianhuachongwu/1.jpg',
15,
0,
1,1,null);
insert into product values(product_id.nextval,
'�Ӻ��ֻ����߼���С�����ֲ��������߶�ͯ��Ұ�˸Ϻ�����԰�չ��� ',
10.00,1.00,
'images/products/xianhuachongwu/2.jpg',
15,
0,
1,1,null);
insert into product values(product_id.nextval,
'����ͨ����30��װ����Ӫ����������������ֲ���ֲ��������������',
5.58,1.00,
'images/products/xianhuachongwu/3.jpg',
15,
0,
1,1,null);
insert into product values(product_id.nextval,
'̩������è��ͷ�󸻵�è����170g*12�޳�è��èʪ����ʳ2�׷�����',
40.00,1.00,
'images/products/xianhuachongwu/4.jpg',
15,
0,
1,1,null);
insert into product values(product_id.nextval,
' ����С������ ̩�ϱ��ܹ������ѩ����С����Ȯ��Ȯ��ͨ����3�� ',
22.17,1.00,
'images/products/xianhuachongwu/5.jpg',
15,
0,
1,1,null);
insert into product values(product_id.nextval,
'ɭɭˮ����������˱ó��˱ó�����С�������ó�വ�˱� ',
19.00,1.00,
'images/products/xianhuachongwu/6.jpg',
15,
0,
1,1,null);
insert into product values(product_id.nextval,
' ɭɭ���ˢ����ˢ��ǿ��ײ�����������ϴ������๤��˫���ˢ��  ',
69.00,1.00,
'images/products/xianhuachongwu/7.jpg',
15,
0,
1,1,null);
insert into product values(product_id.nextval,
'�˼������������������24����������28��ѧ��������������ŮƤ��',
328.00,1.00,
'images/products/xiangbao/box1.jpg',
8,
0,
1,1,null);
insert into product values(product_id.nextval,
'���ز�����������������Ů�������20�ǻ�����Ƥ����������24��',
268.00,1.00,
'images/products/xiangbao/box2.jpg',
8,
0,
1,1,null);
insert into product values(product_id.nextval,
'�������������������������������Ů��������pc������20��',
498.00,1.00,
'images/products/xiangbao/box3.jpg',
8,
0,
1,1,null);
insert into product values(product_id.nextval,
'ȫ��þ�Ͻ�������Ů���������������������ӽ���ѧ������ǻ����',
485.00,1.00,
'images/products/xiangbao/box4.jpg',
8,
0,
1,1,null);
insert into product values(product_id.nextval,
'������Ů������������������������26ѧ���������20��Ƥ����',
268.00,1.00,
'images/products/xiangbao/box5.jpg',
8,
0,
1,1,null);
insert into product values(product_id.nextval,
'������������������20��Ů �����������24�� ѧ������������Ӳ��',
259.00,1.00,
'images/products/xiangbao/box6.jpg',
8,
0,
1,1,null);
insert into product values(product_id.nextval,
'��˹�Ǳ��������������������������ǻ�����������20��24����Ů',
159.00,1.00,
'images/products/xiangbao/box7.jpg',
8,
0,
1,1,null);
insert into product values(product_id.nextval,
' �л�������´�ȫСѧ����ע�������ͯ������3-6-7-8-10-12����Сѧ�������Ķ��鼮���������꼶������ض�һ�꼶��������ʦ�Ƽ� ',
19.90,1.00,
'images/products/tushuyueqi/1.jpg',
14,
0,
1,1,null);
insert into product values(product_id.nextval,
'ȫ��8��ɳ����������꼶�����꼶���꼶�������Ƽ�����ض����鼮Сѧ�������Ķ�3-4-5-6�꼶��ͯ���������8-9-10-11-12-15�� ',
39.80,1.00,
'images/products/tushuyueqi/2.jpg',
14,
0,
1,1,null);
insert into product values(product_id.nextval,
'����ʫѡ�������(�������������) 9�꼶�ϲ�/�������Ƽ���Ŀ/�����±�ͳ�����Ľ̲������Ķ�/ʫ��������/ѧУָ���˽̰�',
27.04,1.00,
'images/products/tushuyueqi/3.jpg',
14,
0,
1,1,null);
insert into product values(product_id.nextval,
'����Ħ˹̽��ȫ������10�� �ʺ�9-12-15-18���Ķ����������꼶���⳩���� �ٶ���̽��������С˵ ����Ħ˹̽����Сѧ����ԭ��ԭ�� ',
26.80,1.00,
'images/products/tushuyueqi/4.jpg',
14,
0,
1,1,null);
insert into product values(product_id.nextval,
'���»�������ʡ�����ȫ��123 �� ȫ�׹�3�� ������ �������Ʒ����2�ڰ�ɭ����������ʱ���ʷ����ƪ�ƻ�С˵ �����鼮���а�',
55.80,1.00,
'images/products/tushuyueqi/5.jpg',
14,
0,
1,1,null);
insert into product values(product_id.nextval,
'��˳����ʡ���Ĺ�ʼ�ȫ�׹�1-9�� ��װ ����������� ���ɾ�㤿ֲ���ѧС˵�鼮 ��Ĺ�ʼ� �Ͼ��ź� ��Ӱԭ�� �޶���1-',
135.00,1.00,
'images/products/tushuyueqi/6.jpg',
14,
0,
1,1,null);
insert into product values(product_id.nextval,
'������ԭ�桿��������ȫ��Ӣ�İ��鼮1-8harry potterӢ��ȫ�� Ӣ��С˵����jk���չ���������ħ��ʯ�뱻����ĺ��Ӽ����ԭ������',
328.00,1.00,
'images/products/tushuyueqi/7.jpg',
14,
0,
1,1,null);
insert into product values(product_id.nextval,
'���з�B6000���������ֻ�������Ʒ�Խ�ȫ��ͨ4G���Ż��ⳬ������',
3999.00,1.00,
'images/products/shoujishuma/shouji_1.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'PROTRULY/��ǧ�� V10S ��ǧ������ֻ�VR�ֻ��ٷ���Ʒָ�Ƶ���',
3799.00,1.00,
'images/products/shoujishuma/shouji_hei.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'��Ϊhonor/��ҫ V9ȫ��ͨ�����ֻ� �ƶ���ͨ����˫��˫��2K������',
2599.00,1.00,
'images/products/shoujishuma/shouji_huawei.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'GEMRY/ղķʿ R19 plusȫ��ͨ4G˫�����������ֻ���ȫ�ѽ���ͼ',
11999.00,1.00,
'images/products/shoujishuma/shouji_zhenpi.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'С��6���ֻ��ͺ���Xiaomi/С�� С���ֻ�6����835�����ֻ���Ʒ',
1999.00,1.00,
'images/products/shoujishuma/shouji_xiaomi.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'honor/��ҫ ��ҫV10ȫ��ͨAI�����ֻ�ȫ����˫��˫�����������ֻ�',
1599.00,1.00,
'images/products/shoujishuma/shouji_honor.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'����ѯ��ϲ��Meizu/���� ���� M15ȫ��ͨ4G�ֻ�����M15����15plus',
1699.00,1.00,
'images/products/shoujishuma/shouji_meizu.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'����������keyboard ��������������˸߶˴�����������',
11999.00,1.00,
'images/products/shoujishuma/shuma_1.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'PS4 20��������޶��� PlayStation 20�����޶�PS4����',
15888.00,1.00,
'images/products/shoujishuma/shuma_zhuji.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'Microsoft/΢�� IO1.1 X06 ŷ�к�װ',
4999.00,1.00,
'images/products/shoujishuma/shuma_shubiao.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'��֮�������������ս�ֻ�������׿ƻ����Ϸ�ֱ� ����С��ģ����',
2758.00,1.00,
'images/products/shoujishuma/shuma_youxiji.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'Mad Catz ����ʨ PROX3��Ϸ��� RGB12000 DPIԭ����Ϸ������ѿ�',
2199.00,1.00,
'images/products/shoujishuma/shuma_mouse.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'Hasselblad/���� H6D-50C �л���������� h6d50c',
113668.00,1.00,
'images/products/shoujishuma/shuma_danfan.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'2015ȫ�¿�Nikon/�῵ AF-S NIKKOR 500mm f/4E FL ED VR������ͷ',
62000.00,1.00,
'images/products/shoujishuma/shuma_jingtou.jpg',
3,
0,
1,1,null);
insert into product values(product_id.nextval,
'����Ʒ�������ɱ�380gx1������͸����ʳ��ʳС������ʳƷɢװ',
22.90,1.00,
'images/products/shipin/shipin_1.jpg',
5,
0,
1,1,null);
insert into product values(product_id.nextval,
'����Ʒ����ţ����ܽ120gx2��ѩ����������ʳС����ʳţ����ɳ����',
17.90,1.00,
'images/products/shipin/shipin_2.jpg',
5,
0,
1,1,null);
insert into product values(product_id.nextval,
'����5��װ��������ţ������հ�װ����ţ����ţ���ţ��ũ�ҽ���1',
134.00,1.00,
'images/products/shipin/shipin_3.jpg',
5,
0,
1,1,null);
insert into product values(product_id.nextval,
'����������2�� �ʻ�����ˮ�� ��ֻ������ɱ ����ʳ�ô�Ƥ����ʳ��',
278.00,1.00,
'images/products/shipin/shipin_4.jpg',
5,
0,
1,1,null);
insert into product values(product_id.nextval,
'Ұ����ɽ����з�ʻ��з�ش�������ʺ���ˮ��������з����з���',
55.00,1.00,
'images/products/shipin/shipin_5.jpg',
5,
0,
1,1,null);
insert into product values(product_id.nextval,
'�����������ɹŷ����˺ţ���1��װ����ζ500gɢװ��ʳС����ʳ',
68.00,1.00,
'images/products/shipin/shipin_6.jpg',
5,
0,
1,1,null);


select * from product;


