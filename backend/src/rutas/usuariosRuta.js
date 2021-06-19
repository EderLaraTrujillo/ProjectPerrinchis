/**
 * Archivo de rutas del usuario
 */
'use strict';

/* Traermos las librerias necesarias: */
const express = require('express');
const UserCtrl = require('../controlador/ususariosControl');
// Cargamos los middleware de autenticación:
const mdAuth = require('../middleware/auth');
// Cargamos el metodo de express, llamado Router, para los metodos get y post:
const api = express.Router();

// Rutas, desde donde vamos a acceder al control:

api.get('/rutatest', UserCtrl.userTest);                                // Ruta para probar el control de usuarios
api.post('/registro', UserCtrl.crudUser);                               // Ruta para el registro de usuarios
api.post('/ingreso', UserCtrl.login);                                   // Ruta para el inicio de sesión
api.get('/personas', mdAuth.loginSecure, UserCtrl.getPersonas);         // Ruta para listar todos los usuarios
api.get('/usuario/:correo',mdAuth.loginSecure, UserCtrl.getPersona);    // Traigo los datos de 1 persona


/*        Exportamos la ruta:       */
module.exports = api;