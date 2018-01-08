let cinventarios = require('../queries/cinventarios');
let router = require('./route-object');

//router.route('/getAll/:nombre')
  //.get(cinventarios.getAllByName);

router.route('/createinventario')
  .post(cinventarios.postInventario);

module.exports = router;