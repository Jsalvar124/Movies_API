const express = require('express');
const router = express.Router();

const usersController = require('../controllers/usersController');

//Post login authentication
router.post('/login', usersController.authenticate)

//Get movies rated by userid
router.get('/:userId/rating/:movieId', usersController. getUserRating)

module.exports = router;