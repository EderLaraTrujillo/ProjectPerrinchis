/**
 * Controlador de usuario. MySQL Power
 */

'use strict';
// Cargamos el framework para trabajar con fechas:
let momento = require('moment');                    // Trabajamos con Fechas
let { msj } = require('./serverstatus');            // Mensajes de Error
let fs = require('fs');                             // Middleware para manejo de rutas de archivos src\statics\images\productos

// Importamos las librerias de control de archivos y rutas:
const conn = require('../config/conex');            // Connection a la base de datos
const { param } = require('../rutas/usuariosRuta');

/* ------------------------------------ Test ------------------------------------ */
function producTest(req, res){
    // Hora Actual:
    let ahora = momento().format('LTS');
    // Response desde el servidor:
    res.status(200).send({
            Mensaje: 'Accediendo a la ruta de prueba de Usuarios',
            HoraActual : ahora,
            feedback : msj,
            Estado : msj.m200
    });
}
/* ------------------------------------ CRUD ------------------------------------ */
function crudProducto(req, res){
    const parametros = req.body;            // Traer los parametros del body, keys y values;
    let idprod = parametros.idprod;
    let opcion = parametros.opcion;                     // VAriables para validar
    let categoria = parametros.categoria;
    let nombre = parametros.nombre;
    let precio = parametros.precio;
    let marca = parametros.marca 
    let referencia= parametros.referencia;
    let descripcion= parametros.descripcion;
    let cantidad = parametros.cantidad;

    // Con el manejador de archivos vamos a cargar una imagen:
    let filename = req.files.imagen.path;                           // Con esto tenemos la imagen que adjuntamos al body
    let fileSplit = filename.split('src/statics/images/productos'); // Cortamos la ruta del archivo y le dejamos solo el nombre
    let imagen = fileSplit[1];                                      // Nombre de la imagen
    // let fileExt = imagen.split('.');                                // Corto por el . para traer la ext del archivo
    // fileExt = fileExt[1];
    console.log(imagen, filename, fileSplit);
    // Control de manejo de imagen:
    // if (fileExt != 'jpg' || fileExt != 'jpeg' || fileExt != 'gif' || fileExt != 'bmp') {
    //     return res.status(403).send({ mensaje: 'Formato de imagen incompatible '});
    // }
    // validacion de CRUD:
    
    // Construimos la consulta sql:
    let sql = "call CrudProducto("+idprod+","+categoria+",'"+nombre+"',"+precio+",'"+marca+"', '"+referencia+"', '"+descripcion+"',"+cantidad+", '"+imagen+"', '"+opcion+"')";
    console.log(sql);
    // Ejecutamos la consulta SQL:
    conn.query(sql, (err, resultado)=>{
        if (err) throw err;             // Si tenemos error, lo mostramos
        if (resultado.length > 0){
            let mensajesql = resultado[0];
            return res.status(200).send({
                mensaje: mensajesql[0].resultado,
                estado : msj.m200
            });
        }else{
            return res.status(404).send({ mensaje: msj.m404 });
        }
    })
    
}

/* ------------------------------------ Fin de Funciones ------------------------------------ */

module.exports = {
    producTest,
    crudProducto
}