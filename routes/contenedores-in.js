let cContenedoresIn = require('../queries/ccontenedores-in');
let router = require('./route-object');

router.route('/createctn')
  .post(cContenedoresIn.postContenedorIn);

module.exports = router;