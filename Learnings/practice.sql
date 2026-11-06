---creation
CREATE TABLE cities (
  name varchar(50),
  country varchar(50),
  population INTEGER,
  area INTEGER
  )
  
 --Insertion 
 INSERT INTO cities (name,country,population,area)
VALUES ('Tokyo','japan',3850500,8223);

create table comments(
id serial primary key,
contents varchar(240),
user_id integer references users(id) on delete cascade,
photo_id integer references photos(id) on delete cascade
);