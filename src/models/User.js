const mysql = require('mysql');

// Configuración de la conexión a la base de datos
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'sesion',
  password: 'root',
  port:3306,
  database: 'registrostec11'
});

const User = (id, password, callback) => {
  connection.connect((err) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      return;
    }
    console.log('Connected to the database!');
  });
  const query = `SELECT * FROM usuarios WHERE id = ?`;
  connection.query(query, [id], (error, results) => {
    if (error) {
      callback(error, null);
      return;
    }
    if (results.length === 0) {
      callback(null, false); // Login error
    } else {
      const usuario = results[0];
      callback(null, usuario); // Login logrado
    }
  });
};

module.exports = User;
