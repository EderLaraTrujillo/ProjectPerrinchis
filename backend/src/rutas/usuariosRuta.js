/**
 * Archivo de rutas del usuario
 */
'use strict';

/* Traermos las librerias necesarias: */
const express = require('express');
const UserCtrl = require('../controlador/ususariosControl');
// Cargamos el metodo de express, llamado Router, para los metodos get y post:
const api = express.Router();

// Rutas, desde donde vamos a acceder al control:

api.get('/rutatest', UserCtrl.userTest);
api.post('/registro', UserCtrl.crudUser);
api.post('/ingreso', UserCtrl.login);


/*        Exportamos la ruta:       */
module.exports = api;