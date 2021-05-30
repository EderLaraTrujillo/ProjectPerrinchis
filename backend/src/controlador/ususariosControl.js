/**
 * Controlador de usuario. MySQL Power
 */

'use strict';
// Cargamos el framework para trabajar con fechas:
let momento = require('moment');
let { msj } = require('./serverstatus');
// Importamos las librerias de control de archivos y rutas:
const conn = require('../config/conex');

// Funciones de controlador:
/* -----------------------------      Pruebas         ------------------------------ */
function userTest(req, res){
    // Hora Actual:
    let ahora = momento().format('LTS');
    // Response desde el servidor:
    res.status(200).send({
            userCTRL: 'Accediendo a la ruta de prueba de Usuarios',
            HoraActual : ahora,
            feedback : msj,
            Estado : msj.m200
    });
}

 /* -----------------------------      CRUD         ------------------------------ */
 function crudUser(req, res){
     // Capturar los datos del formulario:
     const parametros = req.body;
     let iduser = parametros.iduser;
     let correo = parametros.correo;
     let clave = parametros.clave;
     let iddatopersonal = parametros.iddatopersonal;
     let tipodocumento = parametros.tipodocumento;
     let genero = parametros.genero;
     let nombre = parametros.nombre;
     let apellido = parametros.apellido;
     let cedula = parametros.cedula;
     let direccion = parametros.direccion;
     let telefono = parametros.telefono;
     let fechanace = parametros.fechanace;
     let perfil = parametros.perfil;
     let tipousuario = parametros.tipousuario;
     let idcliente = parametros.idcliente;
     let idempleado = parametros.idempleado;
     let opcion = parametros.opcion;
     // Agregamos datos por opcion sin necesidad de ponerlos en un formulario:
     if (opcion === 'guardar') {
        iduser = 0;
        iddatopersonal = 0;
        perfil = 0;
        idcliente = 0;
        idempleado = 0;
     }

     // Fabricamos la consulta SQL:
     let sql = "CALL CrudUsuario("+iduser+", '"+correo+"', '"+clave+"', "+iddatopersonal+", "+tipodocumento+", "+genero+", '"+nombre+"', '"+apellido+"', '"+cedula+"', '"+direccion+"', '"+telefono+"', '"+fechanace+"', "+perfil+", "+tipousuario+", "+idcliente+", "+idempleado+", '"+opcion+"')";
     console.log(sql);
     // Ejecutamos la consutal SQL:
     conn.query(sql, (err, resultado)=>{ 
        if (err) throw err;                 // Si hay un error me lo muestra.

        if(resultado.length > 0){
            let operacion = resultado[0];
            return res.status(200).send({
                resultado : operacion,
                mensaje : msj.m200
            });
        }else {
            return res.status(404).send({ mensaje : msj.m404 });
        }
     });
 }

  /* -----------------------------      LOGIN         ------------------------------ */

// 3. Exportar el modulo del controlador:
module.exports = {
    userTest,
    crudUser
}