var cusuario = require('../queries/cusuarios');

var router = require('./route-object');

router.route('/:nombre')
  .post(cusuario.getUsuarioPorNombre);

module.exports = router;