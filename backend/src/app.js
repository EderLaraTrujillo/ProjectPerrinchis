/**
 * Archivo de servidor express
 * Autor @Eder Lara Trujillo}
 * Año 2021
 */
'use script';

// 1. Variables y constantes del servicio:
const express = require('express');
const bodyparser = require('body-parser');
const morgan = require('morgan');

const app = express();

// 2. Rutas de servicio

// 3. Middleware o puente entre componentes
app.use(bodyparser.urlencoded({extended : false}));
app.use(bodyparser.json());
app.use(morgan('dev'));

// 4. Cabeceras de Peticion.
app.use(function(req, res, next){
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    res.header('Access-Control-Allow-Headers', "Origin, X-Requested-With, Content-Type, Accept, Authorization")
})
// 5. Exportamos rutas de servicio

// 6. Exportamos el módulo servidor:
module.exports = app;