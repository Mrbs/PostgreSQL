# PostgreSQL
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
