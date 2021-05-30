/**
 * Archivo de ejecutar consultas sql.
 */
'use strict';

// Cargar Libreria de base de datos MYSQL:
const mysql = require('mysql');
// Método Promesas NodeJS:
const { promisify } = require('util');
// Traemos los parametros de conexión:
const { basededatos } = require('./dbparams');

// Metodo de ejecución pool
const pool = mysql.createPool(basededatos);

// Crear la conexión a la base de datos:
pool.getConnection((err, connection)=>{
    if (err){
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.log('Se ha perdido la conexión a la base de datos');
        }
        if (err.code === 'ER_CON_COUNT_ERROR') {
            console.log('La base de datos tiene muchas peticiones o conexiones persistentes');
        }
        if (err.code === 'ECONNREFUSED') {
            console.log('La base de datos no ha sido conectada');
        }
    }
    if (connection){
        console.log('Conexión a base de datos establecida');
    }
});

// Usamos promesas de bases de datos para las peticiones:
pool.query = promisify(pool.query);

// Exportar la configuración de conexión a la base de datos:
module.exports = pool;
