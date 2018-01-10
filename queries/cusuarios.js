let db = require('./query-object'); 


function postUsuario(req, res, next) {
  
  let user = {
    nombre: req.body.nombre,
    contrasena: req.body.contrasena
  };
  
  db.none("INSERT INTO usuarios(nombre_usuario, contrasena_usuario)"+
    "VALUES (${nombre}, ${contrasena})", user)
    .then(function(data){
      res.status(200)
        .json({
          status: 'Éxito',
          mensaje: 'Usuario creado'
        });
    })
    .catch(function(err){
      res.json({
        status: 'Error',
        error: err
      });
    });

};

function putUsuario(req, res, next){
  let user = {
    nombre: req.params.nombre,
    contrasena: req.body.contrasena,
    nuevoNombre: req.body.nnombre,
    nuevaContrasena: req.body.ncontrasena
  };

  db.none('UPDATE usuarios SET nombre_usuario = ${nuevoNombre},'+
    'contrasena_usuario = ${nuevaContrasena} '+
    'WHERE nombre_usuario = ${nombre} AND contrasena_usuario = ${contrasena}', user)
    .then(function(){
      res.status(200)
        .json({
          status: 'Éxito',
          mensaje: 'Usuario modificado'
        });
    })
    .catch(function(err){
      res.json({
        status: 'Error',
        error: err
      });
    });
};

function deleteUsuario(req, res, next){

  var nombre = req.params.nombre;
  db.result('DELETE FROM usuarios WHERE nombre_usuario = $1', nombre)
    .then(function(result){
      res.status(200)
        .json({
          status: 'Éxito',
          mensaje: result
        });
    })
    .catch(function(err){
      res.json({
        status: 'Error',
        error: err
      });
    });
};

function getUsuarios(req, res, next){

  db.any('SELECT * FROM usuarios')
    .then(function(data){
      res.status(200)
        .json({
          status: true,
          data: data
        });

    })
    .catch(function(err){
      console.log(err);
      res.status(200)
        .json({
          status: false,
          error: err
        });
    });
};


module.exports = {
  postUsuario: postUsuario,
  putUsuario: putUsuario,
  deleteUsuario: deleteUsuario,
  getUsuarios: getUsuarios
};