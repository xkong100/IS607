drop table if exists movie; 
drop table if exists viewers;
drop table if exists scales;
drop table if exists movie_scales;
Create table movie(
	movie_id  int primary key, 
    movie varchar(300) Null
    );

Insert into movie(movie_id, movie) values (1, 'Now You See Me 2');
Insert into movie(movie_id, movie) values (2, 'Star Trek');
Insert into movie(movie_id, movie) values (3, 'The Jungle Book');
Insert into movie(movie_id, movie) values (4, 'Zootopia');
Insert into movie(movie_id, movie) values (5, 'Sully');
Insert into movie(movie_id, movie) values (6, 'suicide Squad');

Select* From movie;

Create table viewers(
	viewer_id int primary key,
    viewer_name varchar(300) NULL,
    relationship varchar(300) NULL
	);
Insert into viewers (viewer_id, viewer_name, relationship) values (1, 'Edison', 'Friend');
Insert into viewers (viewer_id, viewer_name, relationship) values (2, 'Lisa', 'Friend');
Insert into viewers (viewer_id, viewer_name, relationship) values (3, 'Lily', 'Mother');
Insert into viewers (viewer_id, viewer_name, relationship) values (4, 'Bill', 'Friend');
Insert into viewers (viewer_id, viewer_name, relationship) values (5, 'Heerna', 'Friend');

select * from viewers;

create table scales(
	scales_id int primary key,
	scale varchar(300) NULL
    );

Insert into scales (scales_id, scale) values (1, '1 is poor');
Insert into scales (scales_id, scale) values (2, '2 is fair');
Insert into scales (scales_id, scale) values (3, '3 is good');
Insert into scales (scales_id, scale) values (4, '4 is very good');
Insert into scales (scales_id, scale) values (5, '5 is excellent');

select*from scales;

create table movie_scales(
	movie_id int references movie(movie_id),
    viewer_id int references viewers(viewer_id),
    scales_id int references scales(scales_id),
    Unique key (movie_id, viewer_id, scales_id)
    );
Insert into movie_scales(movie_id, viewer_id, scales_id) values (1, 1, 3); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (1, 2, 3);
Insert into movie_scales(movie_id, viewer_id, scales_id) values (1, 3, 2); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (1, 4, 3); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (1, 5, 2); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (2, 1, 4); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (2, 2, 4); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (2, 3, 3); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (2, 4, 5); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (2, 5, 5); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (3, 1, 3); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (3, 2, 4); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (3, 3, 4); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (3, 4, 5); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (3, 5, 3);
Insert into movie_scales(movie_id, viewer_id, scales_id) values (4, 1, 5); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (4, 2, 2); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (4, 3, 4); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (4, 4, 3); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (4, 5, 4);  
Insert into movie_scales(movie_id, viewer_id, scales_id) values (5, 1, 3); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (5, 2, 3); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (5, 3, 4); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (5, 4, 4); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (5, 5, 5); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (6, 1, 3); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (6, 2, 2); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (6, 3, 1); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (6, 4, 5); 
Insert into movie_scales(movie_id, viewer_id, scales_id) values (6, 5, 4); 

select * from movie_scales;

select  m.movie, v.viewer_name, s.scale 
From movie m left join movie_scales ms ON m.movie_id = ms.movie_id
			 left join viewers v on ms.viewer_id = v.viewer_id
             left join scales s on ms.scales_id=s.scales_id
		order by m.movie, v.viewer_name, s.scale;