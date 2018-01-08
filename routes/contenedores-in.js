let cContenedoresIn = require('../queries/ccontenedores-in');
let router = require('./route-object');

router.route('/createcontenedorin')
  .post(cContenedoresIn.postContenedorIn);

module.exports = router;