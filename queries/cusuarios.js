let db = require('./query-object'); 


function postUsuario(req, res, next) {
  console.log('postusuario');
  console.log(req.body);
  req.body.id_usuario = parseInt(req.body.id_usuario);

  db.none('INSERT INTO usuarios (id_usuario, nombre_usuario, contrasena_usuario)'+
    ' VALUES (${id_usuario}, ${nombre_usuario}, ${contrasena_usuario})', req.body)
    .then(function(data){
      res.status(200)
        .json({
          status: true,
          mensaje: 'Usuario creado'
        });
    })
    .catch(function(err){
      console.log(err);
      res.json({
        status: 'Error',
        error: err
      });
    });

};

function putUsuario(req, res, next){
  
  console.log(req.body);
  req.body.id_usuario = req.params.id;

  db.none('UPDATE usuarios SET nombre_usuario = ${nombre},'+
    'contrasena_usuario = ${contrasena_usuario} '+
    'WHERE id_usuario = ${id_usuario}', req.body)
    .then(function(){
      res.status(200)
        .json({
          status: true,
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

  db.result('DELETE FROM usuarios WHERE id_usuario = $1', req.params.id)
    .then(function(result){
      res.status(200)
        .json({
          status: true,
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