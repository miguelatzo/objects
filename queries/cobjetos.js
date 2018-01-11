let db = require('./query-object');
let path = require('path');

function createObjeto(req, res, next){

  console.log(req.body);

  if(req.files){
    let sampleFile = req.files.file;
    console.log(req.files);
    
    sampleFile.mv( path.join(__dirname, '../img', req.files.file.name), function(err) {
        console.log(err);
        }///if

      );
  }

  req.body.props_objeto = JSON.stringify(req.body.props_objeto);
  console.log(req.body);

  db.none('INSERT INTO objetos (fid_ct_interno, nombre_objeto, props_objeto)'+
    ' VALUES (${fid_ct_interno}, ${nombre_objeto}, ${props_objeto})', req.body)
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
  createObjeto: createObjeto
}
