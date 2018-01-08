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
//var string_conex = 'postgres://postgres:postgres@localhost:5432/objects';
//var string_conex = 'postgres://postgres:postgres@localhost:5432/objects&ssl';
var string_conex = 'postgres://rgnrmlnkmylfnt:f5a6286dbcb6969792639a1723e6678bc50e705df85e4496a2813b6d4b9e3316@ec2-50-19-126-219.compute-1.amazonaws.com:5432/d2lfc9lok5phgj&ssl=required';

//inicializamos niestro objeto de premisas para hacer ocnsultas
var db = pg_promise(string_conex);
//y lo exportamos
module.exports = db;
