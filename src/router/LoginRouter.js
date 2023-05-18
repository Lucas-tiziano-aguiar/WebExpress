const express = require('express');
const LogginControll = require('../controller/LoginController');
const router = express.Router();

router.get('/login', (req, res) => {
  res.send('¡Hola desde la página de inicio!');
});

router.post('/login', LogginControll);

module.exports = router;
