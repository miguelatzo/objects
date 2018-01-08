let db = require('./query-object');


function postContenedorEx(req, res, next){

 
  console.log(req.body);

  db.none('INSERT INTO contenedores_externos (fid_inventario, nombre_ct_externo, dimensiones_ct_externo, props_ct_externo)'+
    ' VALUES (${fid_inventario}, ${nombre_ct_externo}, ${dimensiones_ct_externo}, ${props_ct_externo})', req.body)
    .then(function(){
      
      res.status(200)
        .json({
          status: true
        });
    
    })
    .catch(function(err){
      
      res.status(200)
      .json({
        status: false
      });

    });
};



module.exports = {
  postContenedorEx: postContenedorEx
}