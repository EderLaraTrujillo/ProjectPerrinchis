/**
 * Archivo de servidor express
 * Autor @Eder Lara Trujillo
 * Año 2021
 */
'use script';

// 1. Variables y constantes del servicio:
const express = require('express');
const morgan = require('morgan');

const app = express();

// 2. Rutas de servicio
const rutausuario = require('./rutas/usuariosRuta');
const rutaproducto = require('./rutas/productos.ruta');

// 3. Middleware o puente entre componentes
app.use(express.urlencoded({extended : false}));
app.use(express.json());
app.use(morgan('dev'));

// 4. Cabeceras de Peticion.
app.use((req, res, next)=>{
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    res.header('Access-Control-Allow-Headers', "Origin, X-Requested-With, Content-Type, Accept, Authorization")
    next();
});

// 5. Exportamos rutas de servicio
app.use('/api', rutausuario);
app.use('/api', rutaproducto);

// 6. Exportamos el módulo servidor:
module.exports = app;