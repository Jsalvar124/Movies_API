const express = require('express');
const router = express.Router();

const moviesController = require('../controllers/moviesController');

//Get Random movie
router.get('/random', moviesController.getRandomMovie)

//Get Sorted movies by query parameter
router.get('/', moviesController.getOrderedMovies)

//Get Filtered movies by query parameter
router.get('/filter', moviesController.getFilteredMovies)

//Get Movie detail
router.get('/:id', moviesController. getMovieDetail)

//Post movie rating and watched status
router.post('/:id/watch-rate', moviesController.userWatchRate)




module.exports = router;