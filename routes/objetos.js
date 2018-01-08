let objetos = require('../queries/cobjetos');
let router = require('./route-object');

router.route('/createobjeto')
  .post(objetos.createObjeto);

module.exports = router;