const db = require('../models');
const Movie = db.movies;
const User = db.users;
const Op = db.Sequelize.Op; //sequalize con mayuscula

const moviesController = {

    getRandomMovie: async (req, res) => {

        const total = await Movie.count();

        const randomId = Math.floor(Math.random() * total) + 1;

        const randomMovie = await Movie.findByPk(randomId)

        res.status(200).json(randomMovie)
    },

    getOrderedMovies: async (req, res) => {

        let { orderBy } = req.query
        let possibleOrders = ["views", "type", "rating", "name", "genre", "id"]


        if (!orderBy) {
            let movies = await Movie.findAll()
            return res.status(200).json(movies) // check status
        }
        if (!possibleOrders.includes(orderBy)) {
            return res.send([]) // avoids making a wrong db search, crashing the server.
        }
        const orderedMovies = await Movie.findAll({
            order: [[orderBy, 'DESC']]
        })
        res.status(200).json(orderedMovies)
    },

    getFilteredMovies: async (req, res) => {

        let { name, type, genre } = req.query

        if (!name && !type && !genre) {
            let movies = await Movie.findAll()
            return res.status(200).json(movies) // check status
        }

        let where = {};
        name ? where.name = { [Op.like]: `%${name}%` } : "";
        type ? where.type = { [Op.like]: `%${type}%` } : "";
        genre ? where.genre = { [Op.like]: `%${genre}%` } : "";

        const filteredMovies = await Movie.findAll({
            where
        })
        res.status(200).json(filteredMovies)
    },

    getMovieDetail: async (req, res) => {
        const { id } = req.params

        const movie = await Movie.findByPk(id)

        res.status(200).json(movie)
    },

    userWatchRate: async (req, res) => {
        const { rating, watched, userId, movieId } = req.body;
        console.log("el id de la pelicula es", movieId)

        try {

            const user = await User.findByPk(userId);
            if (!user) {
                return res.status(200).json({ error: 'User not found' });
            }

            const movie = await Movie.findByPk(movieId);
            if (!movie) {
                return res.status(200).json({ error: 'Movie not found' });
            }

            const user_movie_rating = await user.addMovie(movie, {
                through: { rating: rating, watched: watched }
            });

            console.log(user_movie_rating)
            res.status(200).json({ message: 'Movie rating added successfully' });

        } catch (error) {
            console.log(error)
            res.status(500).json({ error: 'Internal server error' });
        }

    }
}

module.exports = moviesController;