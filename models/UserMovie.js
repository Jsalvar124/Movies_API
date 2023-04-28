const db = require('../models');
const User = db.users;
const Movie = db.movies;

module.exports = function(sequelize, DataTypes) {
    
    let alias="UserMovie"  // apodo con el que se usará la tabla en el código

	let cols={
		id:{
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},
		rating:{
			type: DataTypes.INTEGER,
            allowNull: false,
            validate: {
              min: 1,
              max: 5,
            },
		},
		watched:{
			type: DataTypes.BOOLEAN,
            allowNull: false,
            defaultValue: false,
		}
	};

	let config={
		timestamps: false,
		tableName: "user_movie" //nombre de la tabla en la base de datos
	}

	let UserMovie = sequelize.define(alias,cols,config);

    return UserMovie;
}