/**
 * Controlador de usuario. MySQL Power
 */

'use strict';
// Cargamos el framework para trabajar con fechas:
let momento = require('moment');
let { msj } = require('./serverstatus');

// Cargamos el servicio de jwt:
let jwt = require('../service/jwt');

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

function login(req, res){
    const parametros = req.body;
    // Variables de usuario y contraseña del formulario:
    let usuario = parametros.usuario;
    let passuser = parametros.passuser;

    // Consulta SQL:
    const sql = "CALL login('"+usuario+"','"+passuser+"')";
    // Ejecutamos la consulta:
    conn.query(sql, (err, usuario)=>{
        // Validamos los errores:
        if (err) throw err;     // Muestra el error obtenido
        // Validamos el resultado de la consulta:
        if (usuario.length > 0 ) {
            // Cargamos el resultado en una variable:
            const resultado = usuario[0];
            console.log(resultado); // Imprimimos el resultado;
            if (resultado.mensaje === 'Usuario y/o contraseña incorrectos!' ) {
                return res.status(200).send({
                    mensaje: resultado.mensaje
                });
            } else {
                // Capturamos el token en una variable:
                if(parametros.gettoken){
                    return res.status(200).send({
                        token: jwt.createToken(resultado[0])
                    });
                }else{
                    return res.status(200).send({ resultado });
                }
            }
        }
    })
}

/* -----------------------------      GETUSERS         ------------------------------ */
function getPersonas(req, res){
    // Consulta SQL:
    const sql = "SELECT * FROM personas";
    // Ejecutamos la consulta:
    conn.query(sql, (err, listado)=>{
        if (err) throw err;                 // En caso de tener error lo imprime
        if (listado.length > 0){
            let Personas = listado;         // Mostrar las personas que trae la consulta
            let Total = Personas.length;    // Cuantos elementos trae el arreglo
            return res.status(200).send({
                Total : Total,
                Gente : Personas
            });
        }else {
            return res.status(404).send({ mensaje: msj.m404 });
        }
    })
}
/* -----------------------------      GETUSER         ------------------------------ */
// La información de una persona sirve para poder cruzar para hacer la edición
function getPersona(req, res){
    let correo = req.params.correo;
    // Consulta SQL buscando por correo:
    const sql = "SELECT * FROM personas where CorreElect like '%"+correo+"%'";
    console.log(sql);
    // Ejecutamos la consulta:
    conn.query(sql, (err, usuario)=>{
        if (err) throw err;                     // En caso de tener error lo imprime
        if (usuario.length > 0){
            let Persona = usuario[0];           // Mostrar las personas que trae la consulta
            return res.status(200).send({
                Usuario : Persona
            });
        }else {
            return res.status(404).send({ mensaje: msj.m404 });
        }
    })
}

// 3. Exportar el modulo del controlador:
module.exports = {
    userTest,
    crudUser,
    login,
    getPersonas,
    getPersona
}