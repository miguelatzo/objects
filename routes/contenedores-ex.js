let cContenedoresEx = require('../queries/ccontenedores-ex');
let router = require('./route-object');

router.route('/createctx')
  .post(cContenedoresEx.postContenedorEx);

module.exports = router;