let db = require('./query-object');

function postContenedorIn(req, res, next){
  console.log(req.body);
  req.body.props_ct_interno = JSON.stringify(req.body.props_ct_interno);
  db.none('INSERT INTO contenedores_internos (fid_ct_externo, nombre_ct_interno, dimensiones_ct_interno, props_ct_interno)'+
    ' VALUES (${fid_ct_externo}, ${nombre_ct_interno}, ${dimensiones_ct_interno}, ${props_ct_interno})', req.body)
    .then(function(){

      
      
      res.status(200)
        .json({
          status: true
        });
    
    })
    .catch(function(err){
      
      res.status(200)
      .json({
        status: false,
        error: err
      });

    });
};



module.exports = {
  postContenedorIn: postContenedorIn
}