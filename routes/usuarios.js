var cusuario = require('../queries/cusuarios');

var router = require('./route-object');
/*
router.route('/getusuario/:id')
  .get(cusuario.getUsuario);
*/
router.route('/getusuarios')
  .get(cusuario.getUsuarios);

router.route('/createusuario')
  .post(cusuario.postUsuario);

router.route('/put/:id')
  .put(cusuario.putUsuario);

router.route('/delete/:id')
  .all(cusuario.deleteUsuario);

module.exports = router;