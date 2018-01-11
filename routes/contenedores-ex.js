let cContenedoresEx = require('../queries/ccontenedores-ex');
let router = require('./route-object');

router.route('/createcontenedorex')
  .post(cContenedoresEx.postContenedorEx);

module.exports = router;