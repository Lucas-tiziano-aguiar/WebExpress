const User = require('../models/User');

const loginController = (req, res) => {
  const { id, password } = req.body;

  User.User(id, password, (error, usuario) => {
    if (error) {
      res.status(500).json({ error: 'Error en el servidor' });
      return;
    }

    if (!usuario) {
      res.status(401).json({ error: 'Credenciales inválidas' });
      return;
    }

    req.session.user = usuario;
    req.session.isLoggedIn = true;

    // Obtener las clases del usuario
    User.listarClases(usuario.id, (error, clases) => {
      if (error) {
        res.status(500).json({ error: 'Error al obtener las clases del usuario' });
        return;
      }

      req.session.clase = clases;
      console.log(req.session);
      res.redirect('/menu');
    });
  });
};


module.exports = loginController;
