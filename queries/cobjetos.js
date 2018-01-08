let db = require('./query-object');


function createObjeto(req, res, next){

  console.log(req.body);

  db.none('INSERT INTO objetos (fid_contenedor_interno, nombre_objeto, props_objeto)'+
    ' VALUES (${fid_contenedor_interno, ${nombre_objeto}, ${props_objeto})', req.body)
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
  createObjeto: createObjeto
}
