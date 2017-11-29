let db = require('./query-object'); 


function getUsuarioPorNombre(req, res, next) {
  
  res.json({
    body: req.body,
    params: req.params
  });
  

};


module.exports = {
  getUsuarioPorNombre: getUsuarioPorNombre,
};