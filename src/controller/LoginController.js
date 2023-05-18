// controllers/LoginController.js
const User = require('../models/User');

const LoginController = (req, res) => {
    const { id, password } = req.body;
    User(id, password, (error, usuario) => {
      if (error) {
        res.status(500).json({ error: 'Error en el servidor' });
        return;
      }
      if (usuario === false) {
        res.status(401).json({ error: 'Credenciales inválidas' });
        return;
      }
      res.status(200).json({ message: 'Login exitoso', usuario });
    });
};

module.exports = LoginController;