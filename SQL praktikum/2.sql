
Drop table products
 create table Products(
id integer Primary key auto_increment,
title varchar(64) unique,
amount  integer not null ,
price decimal(8,2) check (price between 0 and 10000)
);

insert into products ( title, amount ,price)
values (  'ролики', 10, 3500);

select * from products;

Drop table students
create table students(
id integer Primary key auto_increment,
first_name varchar(100) not null ,
age integer check(age >=0 and age <=140),
curse_num integer check(curse_num  >=0 and curse_num  <=6),
gender char(1) check (gender in ('m','f'))
);

iNSERT INTO students (first_name, age, curse_num, gender)
 VALUES ('Иван', 29, 3, 'm');
INSERT INTO students (first_name, age, curse_num, gender)
 VALUES ('Ирина', 25, 1, 'f');
INSERT INTO students (first_name, age, curse_num, gender)
 VALUES ('Олег', 27, 2, 'm');
INSERT INTO students (first_name, age, curse_num, gender)
 VALUES ('Ольга', 24, 2, 'f');
INSERT INTO students (first_name, age, curse_num, gender)
 VALUES ('Антон', 32, 6, 'm');


delete from students
where id =5;

select * from students

SET SQL_SAFE_UPDATES = 0;

delete from students
where curse_num = 1;