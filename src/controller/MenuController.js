const Alumno = require("../models/Menu");

const ListarAlumnos = (req, res) => {
    const curso = req.params.clase;
    console.log(curso);
    Alumno.listarAlumnosModel(curso)
      .then(resultado => {
        console.log(resultado);
        const { user, clase } = req.session;
        res.render('listarNotas', { user: user, clase: clase, curso: resultado });
      })
      .catch(error => {
        console.error(error);
      });
};

const guardarNotas = async (req, res) => {
  try {
    const { id_alumno, id_aula, nota1, nota2, nota3 } = req.body;

    const query = `
      INSERT INTO notas (id_alumno, id_aula, nota1, nota2, nota3)
      VALUES (?, ?, ?, ?, ?);
    `;

    const values = [id_alumno, id_aula, nota1, nota2, nota3];

    await db.query(query, values);

    res.status(200).json({ message: 'Notas guardadas correctamente' });
  } catch (error) {
    console.error('Error al guardar las notas:', error);
    res.status(500).json({ error: 'Error al guardar las notas' });
  }
};

module.exports = {ListarAlumnos,gua
};
