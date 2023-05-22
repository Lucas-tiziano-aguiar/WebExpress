const express = require('express');
const LogginControll = require('../controller/LoginController');
const CheckLogin = require('../middleware/LoginMiddleware');
const loginrouter = express.Router();

loginrouter.post('/login', LogginControll);

loginrouter.get('/menu', CheckLogin, (req, res) => {
    const { user,clase } = req.session;
    res.render('menu', {user: user,clase:clase});
});

loginrouter.get ('*', (req ,res) => {
  res.send('error page not found')
});

module.exports = loginrouter;
