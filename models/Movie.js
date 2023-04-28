const db = require('../models');

module.exports = function(sequelize, DataTypes) {
    
    let alias="Movie"  // apodo con el que se usará la tabla en el código

// Una película o seria tendrá los siguientes atributos:
// Id
// Nombre
// Genero
// Tipo (serie o película)
// No de visualizaciones
// Puntaje (promedio de todas las puntuaciones (1 - 5)

	let cols={
		id:{
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},
		name:{
			type: DataTypes.STRING
		},
		genre:{
			type: DataTypes.STRING
		},
		type:{
			type: DataTypes.STRING
		},
        views:{
			type: DataTypes.INTEGER
		},
		rating:{
			type: DataTypes.DECIMAL(3,1)
		},
        image:{
			type: DataTypes.STRING
		}
	};

	let config={
		timestamps: false,
		tableName: "movies" //nombre de la tabla en la base de datos
	}

	let Movie = sequelize.define(alias,cols,config);


    return Movie;
}