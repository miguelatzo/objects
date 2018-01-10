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

router.route('/put/:nombre')
  .put(cusuario.putUsuario);

router.route('/delete/:nombre')
  .delete(cusuario.deleteUsuario);

module.exports = router;