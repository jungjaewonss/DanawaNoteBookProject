create table  NoteBookInfo(
subject varchar2(400) ,
screeninch number(5,3),
weight number(5,3),
company varchar2(300),
price varchar2(50),
img varchar2(500),
memory varchar2(20),
usb varchar2(500) ,
purpose varchar2(300),
thickness varchar2(300),
allinfo varchar2(3000)
);


create table  mallinfo(
num number ,
mallname varchar2(100),
modelnum varchar2(400) ,
price varchar2(500),
link varchar2(3000),
logo varchar2(3000),
shipping varchar2(100)

);




create table board (
num number ,
writer varchar2(30),
email varchar2(50),
subject varchar2(50),
password varchar2(30),
reg_date date,
ref number,
readcount number,
commentcount number,
content varchar2(1500),
likes number,
dislike  number


);

create table rewrite (
num number ,
writer varchar2(30),
reg_date date,
content varchar2(300),
ref number

);


create table  myitem(
email varchar2(50) ,
subject varchar2(200),
price varchar2(500),
img varchar2(3000),
link varchar2(3000)


);