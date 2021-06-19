/**
 * JSON WEB TOKEN para el servicio de login.
 * Autor: @EderLaraT
 * Year: 2021
 */
'use strict';
// constantes, variables y librerias:
const jwt = require('jwt-simple');
const momento = require('moment');
require('dotenv').config();

// Creamos una contraseña para el webtoken:
let secret = process.env.SECRET;

// Usamos createtoken para establecer el Json a validar:
exports.createToken = function(user){
    // Objeto payload con los datos del usuario:
    let payload = {
        sub : user.idUsuarios,
        name: user.NombreCompleto,
        idus: user.Identificacion,
        mail: user.NickName,
        telp: user.Telefono,
        stat: user.EstaUser,
        // Fechas de control de creación y expiración:
        fiat: momento().unix(),
        fexp: momento().add(2, 'days').unix()
    }
    // Encriptas el payload con la contraseña secreta:
    return jwt.encode(payload, secret);
}
