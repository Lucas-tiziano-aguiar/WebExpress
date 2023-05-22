const mysql = require('mysql');

// Configuración de la conexión a la base de datos
const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'newuser',
  password: 'password',
  port: 3306,
  database: 'registrostec11'
});

const User = (id, password, callback) => {
  const query = `
    SELECT usuarios.*, passwords.password
    FROM usuarios
    INNER JOIN passwords ON usuarios.id = passwords.idUsuario
    WHERE usuarios.id = ?;
  `;
  connection.query(query, [id], (error, results) => {
    if (error) {
      console.error('Error executing the query:', error);
      callback(error, null);
      return;
    }

    if (results.length === 0) {
      callback(null, false); // Login error
    } else {
      const usuario = results[0];
      if (usuario.password !== password) {
        callback(null, false); // Password incorrecta
      } else {
        delete usuario.password;
        callback(null, usuario);
      }
    }
  });
};

const listarClases = (userId, callback) => {
  const query = `
    SELECT *
    FROM espacios
    WHERE profesor_id = ?
  `;
  connection.query(query, userId, (error, results) => {
    if (error) {
      console.error('Error al obtener las clases del usuario:', error);
      callback(error, null);
      return;
    }

    callback(null, results);
  });
};

module.exports = {
  User,
  listarClases
};
