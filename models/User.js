const db = require('../models');

module.exports = function(sequelize, DataTypes) {
    
    let alias="User"  // apodo con el que se usará la tabla en el código

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
		username:{
			type: DataTypes.STRING
		},
		email:{
			type: DataTypes.STRING
		},
		password:{
			type: DataTypes.STRING
		}
	};

	let config={
		timestamps: false,
		tableName: "users" //nombre de la tabla en la base de datos
	}

	let User = sequelize.define(alias,cols,config);

    return User;
}