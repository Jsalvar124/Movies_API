const { Sequelize, DataTypes } = require('sequelize')
const dbConfig = require('../config/dbConfig')

const sequelize = new Sequelize(
    dbConfig.DB_NAME,
    dbConfig.USER,
    dbConfig.PASSWORD,
    {
        host: dbConfig.HOST,
        dialect: dbConfig.DIALECT,
        operatorAliases: false
    }
)
async function authenticate(){
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
      } catch (error) {
        console.error('Unable to connect to the database:', error);
      }
}

authenticate();

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.movies = require('./Movie')(sequelize,DataTypes)
db.users = require('./User')(sequelize,DataTypes)
db.user_movie = require('./UserMovie')(sequelize,DataTypes)

// Define associations
db.movies.belongsToMany(db.users, { through: db.user_movie });
db.users.belongsToMany(db.movies, { through: db.user_movie });

db.sequelize.sync({ force: false }) // False!
.then(()=>{
    console.log("DB Sincronization Updated")
})

module.exports = db;