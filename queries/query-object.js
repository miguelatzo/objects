//dicen que es mejor que las premisas que ofrece el nodo pg, so
let promise = require('bluebird');

//declaramos el objecto par personalizar nuestra 'instsancia' de pg-promise

var options = {
  //le pasamos la libreria de bluebird
  promiseLib: promise
};

//pg_promise quita todo el estres del client y el client pool
//alv me vv, prro.
var pg_promise = require('pg-promise')(options);

//kinde obvious what this is
var string_conex = 'postgres://postgres:postgres@localhost:5432/objects';

//inicializamos niestro objeto de premisas para hacer ocnsultas
var db = pg_promise(string_conex);
//y lo exportamos
module.exports = db;
