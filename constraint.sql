#PostgreSQL
create table persons (
  name varchar(40),
  age int check (age >= 0 and age <= 150),
  sex boolean
 );
 
 #为约束添加一个独立名字，这样发生约束错误时就会吧约束名字打印出来，让错误更佳清晰
 #另外修改约束时可以引用这个名字的约束
 create table persons2 (
  name varchar(40),
  age int constraint check_age check (age >= 0 and age <= 150),
  sex boolean
 );
 
 #一个检查约束可以引用多个字段：
 create table books (
   book_no  integer,
   name     text,
   price    numeric check (price > 0),#字段约束
   discount_price numeric check (discount_price > 0); #字段约束
   check    (price > discount_price)    #表约束
  );
  
  #前面多个约束也可以改写为一下两种方式：
  create table books (
    book_no integer,
    name    text,
    price   numeric,
    discount_price   numeric,
    check (price > 0)
    check (discount_price > 0),
    check (price > discount_price)
   );
   
   create table books (
     book_no integer,
     name     text,
     price    numeric,
     discount_price nueric,
     check    (price > 0 and discount_price >0 and discount_price < price)
    );
    
    #和字段约束一样，也可以给表约束赋予名称：
    create table books (
      book_no   integer,
      name      text,
      price     numeric,
      discount_price  numeric,
      check     (price > 0)
      check     (discount_price > 0)
      constraint  valid_discount  check (price > discount_price)
     );
     
     以上为检查约束
     ################################################################################################
     #非空约束只是简单声明一个字段必须不能为null
     create table books (
       book_no  integer not null,
       name     text,
       price    numeric
      );
      
      #如果出现多个约束，逐个声明即可
      create table books (
        book_no   integer not null,
        name      text,
        price     numeric not null check (price > 0)
      );
      
      #以上是 非空约束
      ##############################################################################################
     
     #唯一约束就是在一个字段或一组j字段里数据较其他行数据是唯一的
     create table books (
       book_no  integer unique,
       name     text,
       price    numeric
      );
    #也可以如以下方式
    create table books (
      book_no integer,
      name    text,
      price   numeric,
      unique(book_no)
     );
     
     以上为唯一约束
     ##############################################################################################
     
     #外键约束 表间约束 用于约束本表某一或某多个字段必须出现在另外表的某一或某多个字段中
     create table class (
       class_no int primary key,
       class_name varchar(40)
      );
      
      create table student (
        student_no int primary key,
        student_name varchar(40),
        age int,
        class_no int reference class(class_no)
       );
