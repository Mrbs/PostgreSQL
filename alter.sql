create table books (
  book_no   int primary key not null,
  bok_name  text,
  price     numeric not null,
  check     (price > 0)
 );
  
