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
var string_conex = 'postgres://postgres:postgres@localhost:5432/objects';
//HEROKU STRING CONEX
//var string_conex = 'postgres://sqsbwbjqakwbst:bcf5ca1378fd787c12629e23d83292a281a2f972d372c3798ed9593824b06d71@ec2-54-235-153-124.compute-1.amazonaws.com:5432/d201ok55vkrtoc';
//inicializamos niestro objeto de premisas para hacer ocnsultas
var db = pg_promise(string_conex);
//y lo exportamos
module.exports = db;
