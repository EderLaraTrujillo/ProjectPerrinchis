/**
 * JSON WEB TOKEN para el uso de login.
 * Autor: @EderLaraT
 * Year: 2021
 */
 'use strict';
 // constantes, variables y librerias:
 const jwt = require('jwt-simple');
 const momento = require('moment');
 require('dotenv').config();

 // Objeto de Mensajes:
 const { msj } = require('../controlador/serverstatus');
 
// Traemos la clave secreta para el webtoken:
let secret = process.env.SECRET;

// Funcion para validación de token:
exports.loginSecure = function(req, res, next){
    // Validar si la cabecera tiene el token válido:
    if (!req.headers.authorization) {
        return res.status(403).send({
            mensaje : msj.m403
        });
    }
    // Crear la variable token que es la que le vamos a pasar a header.authorization.
    let token = req.headers.authorization.replace(/['"]+/g, '');    // Remplazo caracteres especiales (['"]+/g) por nada. 
    
    // Manejamos el error para el token: try, catch, evita el desbordamiento de memoria en un proceso:
    try {
        // validar pyload y decodificarlo:
        let payload = jwt.decode(token, secret);
        // validar la fecha de caducidad del payload:
        if (payload.fexp <= momento().unix()) {
            return res.status(401).send({
                mensaje: msj.m401
            });
        }
    } catch (error) {
        return res.status(404).send({
            mensaje: 'El token no es Válido!!'
        });
    }
    req.user = payload; // Entregando la autorización de ese usuario
    next();             // Continuar
}