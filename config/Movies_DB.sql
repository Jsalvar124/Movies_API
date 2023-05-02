INSERT INTO movies (name, genre, type, views, rating, image) VALUES
	('Batman begins', 'action', 'movie', '50', '3.8', 'https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'),
	('The amazing spiderman', 'action', 'movie', '100', '4.1', 'https://m.media-amazon.com/images/M/MV5BYzYzZDViNWYtNWViMS00NDMxLThlN2YtZjFkOWMwODkzNzhiXkEyXkFqcGdeQXVyMTUwMzM4NzU0._V1_SX300.jpg'),
	('Avengers', 'action', 'movie', '40', '4.2', 'https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg'),
	('Her', 'drama', 'movie', '25', '4.3', 'https://m.media-amazon.com/images/M/MV5BMjA1Nzk0OTM2OF5BMl5BanBnXkFtZTgwNjU2NjEwMDE@._V1_SX300.jpg'),
	('Breaking Bad', 'action', 'series', '200', '4.8', 'https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5._V1_SX300.jpg'),
	('Better Call Saul', 'drama', 'series', '75', '4.6', 'https://m.media-amazon.com/images/M/MV5BZDA4YmE0OTYtMmRmNS00Mzk2LTlhM2MtNjk4NzBjZGE1MmIyXkEyXkFqcGdeQXVyMTMzNDExODE5._V1_SX300.jpg'),
	('Avatar', 'drama', 'movie', '54', '3.2', 'https://m.media-amazon.com/images/M/MV5BZDA0OGQxNTItMDZkMC00N2UyLTg3MzMtYTJmNjg3Nzk5MzRiXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_SX300.jpg'),
	('Friends', 'comedy', 'series', '320', '4.1', 'https://m.media-amazon.com/images/M/MV5BNDVkYjU0MzctMWRmZi00NTkxLTgwZWEtOWVhYjZlYjllYmU4XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg'),
	('How I met your mother', 'comedy', 'series', '250', '4.3', 'https://m.media-amazon.com/images/M/MV5BNjg1MDQ5MjQ2N15BMl5BanBnXkFtZTYwNjI5NjA3._V1_SX300.jpg'),
	('Foundation', 'fiction', 'series', '70', NULL, 'https://m.media-amazon.com/images/M/MV5BMTE5MDY1MGUtMmMxNi00YjA3LWIyZTYtN2FhOWJmNTY2NmM4XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg');
	('Westworld', 'fiction', 'series', '150', NULL, 'https://m.media-amazon.com/images/M/MV5BZDg1OWRiMTktZDdiNy00NTZlLTg2Y2EtNWRiMTcxMGE5YTUxXkEyXkFqcGdeQXVyMTM2MDY0OTYx._V1_SX300.jpg');


INSERT INTO users (username, email, password) VALUES
	('chacho', 'chacho@gmail.com', '1234'),
	('pepe', 'pepe@gmail.com', '4321'),
	('toto', 'toto@gmail.com', '5643'),
	('tito', 'tito@gmail.com', '1235'),
	('tato', 'tato@gmail.com', '1245'),
	('memo', 'memo@gmail.com', '1234'),
	('puchu', 'puchu@gmail.com', '1236');

INSERT INTO user_movie (rating, watched, movieId, userId) VALUES
	('4', '1', '2', '1'),
	('3', '1', '2', '2'),
	('1', '4', '2', '4'),
	('3', '1', '3', '1'),
	('2', '1', '3', '2'),
	('5', '1', '5', '2'),
	('5', '1', '5', '3'),
	('4', '1', '5', '4'),
	('4', '1', '6', '2'),
	('3', '1', '6', '3'),
	('2', '1', '7', '4'),
	('1', '0', '8', '4');

select * from users u 

select * from movies m 

select * from user_movie um 

SELECT movieId, AVG(user_movie.rating) AS average_rating, movies.rating as old_rating
FROM user_movie
inner join movies on MovieId = movies.id
WHERE watched = 1
GROUP BY movieId

SELECT movieId, SUM(user_movie.watched) AS sum_views, movies.views  as old_views
FROM user_movie
inner join movies on MovieId = movies.id
GROUP BY movieId

describe user_movie 

UPDATE movies
SET rating = (
  SELECT AVG(user_movie.rating) AS average_rating
  FROM user_movie
  WHERE user_movie.movieId = movies.id AND user_movie.watched = 1
)

UPDATE movies
SET views = (
  SELECT SUM(user_movie.watched) AS views
  FROM user_movie
  WHERE user_movie.movieId = movies.id AND user_movie.watched = 1
)
