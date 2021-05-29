/**
 * Aplicativo de BackEnd de una tienda.
 * Autor: @Eder Lara Trujillo
 * Año: 2021
 */
// Código Javascript:
'use stric';
// cargar librerias necesarias, primero dotenv para capturar las variables de entorno:
require('dotenv').config();

//Constante de Servidor:
const app = require('./app');

// Otras Constantes
const puerto = process.env.PUERTO;              // Puerto por donde se despliega el servidor
const url = process.env.URL                     // Url por donde podemos usar el puerto

// Funcion de encendido del servidor:
app.listen(puerto, ()=>{
    console.log('Servidor Encendido');
    console.log('Url: '+url+':'+puerto);
});
