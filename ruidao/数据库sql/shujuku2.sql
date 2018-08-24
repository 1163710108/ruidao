create table orders(
oderid varchar2(200) primary key,
ordertime varchar2(100) not null,
total number(16,2) not null,
state int not null,
address varchar2(200),
name varchar2(100) not null,
telephone varchar2(100) unique not null,
userid  int);

create table orderitem(
oid  varchar2(200) primary key,
count int not null,
subtotal number(16,2) not null,
productid int references product(pid) on delete cascade,
shop int references shop(sid) on delete cascade,
orders  varchar2(200) references orders(oderid) on delete cascade);

drop table orders

drop table orderitem
select *  from orders
select * from orderitem

