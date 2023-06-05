const mysql = require('mysql');

// Configuración de la conexión a la base de datos
const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: '',
  port: 3306,
  database: 'registrostec11'
});

const listarAlumnosModel = (curso) => {
  return new Promise((resolve, reject) => {
    const query = `
      SELECT alumnos.dni, alumnos.nombre, alumnos.apellido, alumnos.telefono
      FROM alumnos
      INNER JOIN alumno_aula ON alumnos.dni = alumno_aula.dni
      WHERE alumno_aula.id_aula = ?;`;
    connection.query(query, [curso], (error, results) => {
      if (error) {
        console.error('Error executing the query:', error);
        return reject(error);
      }
      resolve(results);
    });
  });
};

const db = require('../database'); // Importar la conexión a la base de datos

// Modelo para almacenar las notas
const guardarNotasModel = (id_alumno, id_aula, nota1, nota2, nota3) => {
  return new Promise((resolve, reject) => {
    const query = `
      INSERT INTO notas (id_alumno, id_aula, nota1, nota2, nota3)
      VALUES (?, ?, ?, ?, ?);
    `;

    const values = [id_alumno, id_aula, nota1, nota2, nota3];

    db.query(query, values, (error, result) => {
      if (error) {
        console.error('Error al guardar las notas:', error);
        return reject(error);
      }
      resolve(result);
    });
  });
};



module.exports = {
  listarAlumnosModel,
  guardarNotasModel
};
