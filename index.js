
let express = require('express'); //declara la 'instancia' de express

let bodyParser = require('body-parser'); //body parser ayuda a manejar el body de los post requests

let cors = require('cors'); //ya que almacenaremos ligas externas a imagenes
//headers the cross domain tipo XHTMLRequest son necesarios
//lo hace mas facilito ;3
/*/**************************************
//lista de recursos disponibles a traves de sus rutas
//****************************************
*/
let usuarios = require('./routes/usuarios');


//**********************************************************
//agarro el puerto 3000 como express acostumbra uwu
//********************************************************

port = process.env.PORT || 3000;

//inicializo express
var app = express();

//express toma estas 'instancias' para el parseo del body
//en caso de recibirlo en formato json o urlencoded 
app.use(bodyParser.json());
app.use(bodyParser.urlencoded(  { extended: true }  ));
//express usa cors asi de facil :)))
app.use(cors());
//utilizo el script de rutas en routes/usuarios para la ruta
//    /api/usuarios/????? checa ususarios.js
app.use('/api/usuarios', usuarios);
//IMPORTANTE PONER ESTA LINEA 33 DESPUES  DE LA 27 Y 28
//it's kinda obvious why so google it.

//pongo en escucha a mi servidor express

app.listen(port);
//esta linea solo aparece si no hay errores graves,
//errores logicos pueden ser cometidos y el servidor puede
//arrancar de todos modos
console.log('Server running on http://localhost:/'=port); 