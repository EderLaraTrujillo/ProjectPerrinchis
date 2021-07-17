/**
 * Archivo de rutas del usuario
 */
 'use strict';

 /* Traermos las librerias necesarias: */
 const express = require('express');
 const multiparty = require('connect-multiparty');
 const ProdCtrl = require('../controlador/productoControl');
 
 // Cargamos los middleware:
 const mdAuth = require('../middleware/auth');
 const mdUpload = multiparty({ uploadDir: './src/statics/images/productos'});
 // Cargamos el metodo de express, llamado Router, para los metodos get y post:
 const api = express.Router();

 
// Rutas, desde donde vamos a acceder al control:
api.get('/productos/test', ProdCtrl.producTest);
api.post('/productos/crud', [mdUpload, mdAuth.loginSecure], ProdCtrl.crudProducto);
api.get('/productos/catalogo', ProdCtrl.getCatalogo);
api.get('/productos/:imagenFile', ProdCtrl.getImagen);

/*        Exportamos la ruta:       */
module.exports = api;