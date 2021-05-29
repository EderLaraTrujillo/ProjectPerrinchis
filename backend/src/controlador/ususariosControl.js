/**
 * Controlador de usuario. MySQL Power
 */

 'use strict';
 
 // Importamos las librerias de control de archivos y rutas:
 // Cargamos el framework para trabajar con fechas:
 let momento = require('moment');

 // Funciones de controlador:
 /* -----------------------------      Pruebas         ------------------------------ */
 function userTest(req, res){
     // Hora Actual:
     let ahora = momento().format('LTS')
     // Response desde el servidor:
     res.status(200).send({
             userCTRL: 'Accediendo a la ruta de prueba de Usuarios',
             HoraActual : ahora
     });
 }



// 3. Exportar el modulo del controlador:
module.exports = {
    userTest
}