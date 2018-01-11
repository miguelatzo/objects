let db = require('./query-object');


function postInventario(req, res, next){

  console.log(req.body.props_inventario); 
  //req.body.props_inventario = JSON.stringify(req.body.props_inventario);
  console.log(req.body.props_inventario); 

  db.none('INSERT INTO inventarios (nombre_inventario, props_inventario, fid_usuario)'+
    ' VALUES ( ${nombre_inventario}, ${props_inventario}, ${fid_usuario})', req.body)
    .then(function(){

      res.status(200)
        .json({
          status: true
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


function getInventariosCompartidos(req, res, next){

  console.log(req.body);

  db.any('SELECT * FROM inventarios as i JOIN'+
    ' contenedores_externos as cx ON i.id_inventario = cx.fid_inventario JOIN'+
    ' contenedores_internos as ci ON cx.id_ct_externo = ci.fid_ct_externo JOIN'+
    ' objetos as o ON ci.id_ct_interno = o.fid_ct_interno '+
    ' WHERE i.compartido = true')
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
  postInventario: postInventario,
  getInventariosCompartidos: getInventariosCompartidos
}