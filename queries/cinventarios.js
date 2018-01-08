let db = require('./query-object');


function postInventario(req, res, next){

  console.log(req.body);

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



module.exports = {
  postInventario: postInventario
}