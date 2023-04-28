const db = require('../models');
const User = db.users;
const UserMovie = db.user_movie;
const Op = db.Sequelize.Op; //sequalize con mayuscula

const usersController = {
    
    authenticate: async (req, res) => {
        const { username, password } = req.body;
        try {
            const user = await User.findOne({
                where: { username : username } 
            });
            if (!user || user.password !== password) {
                return res.status(200).json({ message: 'Invalid username or password' });
            }
            return res.status(200).json({ 
                message: 'Authenticated successfully',
                userId: user.id,
                username: user.username
            });
        } catch (error) {
            console.log(error);
            return res.status(500).json({ message: 'An error occurred while authenticating the user' });
        }
    },

    getUserRating: async (req, res) => {
        const { userId, movieId } = req.params;
        try {
            const movieRating = await UserMovie.findOne({
                where: { 
                    userId: userId, 
                    movieId: movieId 
                },
                attributes: ['rating', 'watched', 'movieId'],
              });
              res.status(200).json({ movieRating });
            if (!movieRating) {
                return res.status(200).json({ error: 'User not found' });
            }
        } catch (error) {
            console.log(error)
        }
    },
}

module.exports = usersController;