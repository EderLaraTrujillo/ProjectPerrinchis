/**
 * Archivo de parametrización de conexión a base de datos
 */
'use strict';
require('dotenv').config();
const host = process.env.HOST;
const port = process.env.PORT;
const user = process.env.USER;
const password = process.env.PASSWORD;
const database = process.env.DATABASE;

module.exports = {
    basededatos:{
        host: host,
        port: port,
        user: user,
        password: password,
        database: database 
    }
}