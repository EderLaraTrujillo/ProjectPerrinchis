/**
 * Controlador de usuario. MySQL Power
 */

 'use strict';
 // Cargamos el framework para trabajar con fechas:
 let momento = require('moment');                    // Trabajamos con Fechas
 let { msj } = require('./serverstatus');            // Mensajes de Error
 
 // Importamos las librerias de control de archivos y rutas:
 const conn = require('../config/conex');            // Connection a la base de datos