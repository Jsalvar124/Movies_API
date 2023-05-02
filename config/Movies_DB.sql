CREATE TABLE movies 
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(512),
    genre VARCHAR(512),
    type VARCHAR(512),
    views INT,
    rating DECIMAL(3,1),
    image VARCHAR(512)
);

CREATE TABLE users 
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(512),
    email VARCHAR(512),
    password INT
);

CREATE TABLE user_movie 
(
    rating INT,
    watched VARCHAR(512),
    movieId INT,
    userId INT,
    FOREIGN KEY (movieId) REFERENCES movies(id),
    FOREIGN KEY (userId) REFERENCES users(id),
    CONSTRAINT FK_movie FOREIGN KEY (movieId) REFERENCES movies(id),
    CONSTRAINT FK_user FOREIGN KEY (userId) REFERENCES users(id)
);

INSERT INTO users (username, email, password) VALUES
	('chacho', 'chacho@gmail.com', '1234'),
	('pepe', 'pepe@gmail.com', '4321'),
	('toto', 'toto@gmail.com', '5643'),
	('tito', 'tito@gmail.com', '1235'),
	('tato', 'tato@gmail.com', '1245'),
	('memo', 'memo@gmail.com', '1234'),
	('puchu', 'puchu@gmail.com', '1236');

INSERT INTO movies (name, genre, type, views, rating, image) VALUES
	('Batman begins', 'action', 'movie', '5', '3.2', 'https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'),
	('The amazing spiderman', 'action', 'movie', '4', '2.8', 'https://m.media-amazon.com/images/M/MV5BYzYzZDViNWYtNWViMS00NDMxLThlN2YtZjFkOWMwODkzNzhiXkEyXkFqcGdeQXVyMTUwMzM4NzU0._V1_SX300.jpg'),
	('Avengers', 'action', 'movie', '4', '3.5', 'https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg'),
	('Her', 'drama', 'movie', '6', '4', 'https://m.media-amazon.com/images/M/MV5BMjA1Nzk0OTM2OF5BMl5BanBnXkFtZTgwNjU2NjEwMDE@._V1_SX300.jpg'),
	('Breaking Bad', 'action', 'series', '4', '4.8', 'https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5._V1_SX300.jpg'),
	('Better Call Saul', 'drama', 'series', '6', '4.5', 'https://m.media-amazon.com/images/M/MV5BZDA4YmE0OTYtMmRmNS00Mzk2LTlhM2MtNjk4NzBjZGE1MmIyXkEyXkFqcGdeQXVyMTMzNDExODE5._V1_SX300.jpg'),
	('Avatar', 'drama', 'movie', '4', '2.5', 'https://m.media-amazon.com/images/M/MV5BZDA0OGQxNTItMDZkMC00N2UyLTg3MzMtYTJmNjg3Nzk5MzRiXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_SX300.jpg'),
	('Friends', 'comedy', 'series', '5', '4', 'https://m.media-amazon.com/images/M/MV5BNDVkYjU0MzctMWRmZi00NTkxLTgwZWEtOWVhYjZlYjllYmU4XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg'),
	('How I met your mother', 'comedy', 'series', '4', '4', 'https://m.media-amazon.com/images/M/MV5BNjg1MDQ5MjQ2N15BMl5BanBnXkFtZTYwNjI5NjA3._V1_SX300.jpg'),
	('Foundation', 'fiction', 'series', '5', '4.8', 'https://m.media-amazon.com/images/M/MV5BMTE5MDY1MGUtMmMxNi00YjA3LWIyZTYtN2FhOWJmNTY2NmM4XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg'),
	('Westworld', 'fiction', 'series', '4', '4.8', 'https://m.media-amazon.com/images/M/MV5BZDg1OWRiMTktZDdiNy00NTZlLTg2Y2EtNWRiMTcxMGE5YTUxXkEyXkFqcGdeQXVyMTM2MDY0OTYx._V1_SX300.jpg'),
	('Amelie', 'comedy', 'movie', '3', '3.7', 'https://m.media-amazon.com/images/M/MV5BNDg4NjM1YjMtYmNhZC00MjM0LWFiZmYtNGY1YjA3MzZmODc5XkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_SX300.jpg'),
	('Last of us', 'action', 'series', '4', '4.3', 'https://m.media-amazon.com/images/M/MV5BZGUzYTI3M2EtZmM0Yy00NGUyLWI4ODEtN2Q3ZGJlYzhhZjU3XkEyXkFqcGdeQXVyNTM0OTY1OQ@@._V1_SX300.jpg'),
	('Argentina, 1985', 'drama', 'movie', '3', '4.7', 'https://m.media-amazon.com/images/M/MV5BZTY4ZDJkNTUtMjEwNy00YzFiLWE1NWYtNzAxNDYxNDJkYTlkXkEyXkFqcGdeQXVyMTA0MjU0Ng@@._V1_SX300.jpg');

INSERT INTO user_movie (rating, watched, movieId, userId) VALUES
	('5', '1', '4', '7'),
	('5', '1', '1', '1'),
	('1', '1', '4', '1'),
	('5', '1', '6', '1'),
	('2', '1', '7', '1'),
	('5', '1', '11', '1'),
	('4', '1', '2', '1'),
	('2', '1', '2', '2'),
	('2', '1', '2', '4'),
	('3', '1', '3', '1'),
	('3', '1', '3', '2'),
	('4', '1', '5', '2'),
	('5', '1', '5', '3'),
	('5', '1', '5', '4'),
	('5', '1', '6', '2'),
	('3', '1', '6', '3'),
	('2', '1', '7', '4'),
	('1', '0', '8', '4'),
	('3', '1', '1', '7'),
	('2', '1', '9', '7'),
	('4', '1', '10', '7'),
	('5', '1', '11', '7'),
	('5', '1', '6', '7'),
	('5', '1', '1', '5'),
	('3', '0', '1', '6'),
	('5', '1', '4', '6'),
	('5', '0', '12', '1'),
	('5', '1', '14', '1'),
	('5', '1', '13', '1'),
	('5', '1', '8', '6'),
	('1', '1', '8', '1'),
	('5', '1', '9', '1'),
	('5', '1', '10', '1'),
	('4', '1', '4', '5'),
	('4', '1', '12', '5'),
	('3', '1', '12', '7'),
	('4', '1', '14', '7'),
	('3', '1', '13', '7'),
	('4', '1', '8', '7'),
	('3', '1', '2', '5'),
	('5', '1', '3', '5'),
	('5', '1', '5', '5'),
	('4', '1', '6', '5'),
	('3', '1', '7', '5'),
	('5', '1', '8', '5'),
	('4', '1', '9', '5'),
	('5', '1', '10', '5'),
	('4', '1', '11', '5'),
	('5', '1', '13', '5'),
	('5', '1', '14', '4'),
	('4', '1', '13', '4'),
	('5', '1', '11', '4'),
	('5', '1', '10', '4'),
	('1', '1', '1', '4'),
	('3', '1', '3', '4'),
	('4', '1', '4', '4'),
	('5', '1', '6', '4'),
	('2', '1', '1', '2'),
	('5', '1', '4', '2'),
	('3', '1', '7', '2'),
	('5', '1', '8', '2'),
	('5', '1', '9', '2'),
	('5', '1', '10', '2'),
	('4', '1', '12', '2');

