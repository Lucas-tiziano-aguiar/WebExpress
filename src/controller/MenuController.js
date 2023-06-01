const { Model } = require("sequelize");
const Alumno = require("../models/Menu");
const AlumnosAula = require("../models/Menu");

const ListarAlumnos = (curso, res) => {
  console.log(curso);
  const resultado = AlumnosAula.findAll({
    where: {
      id_aula: curso,
    },
  })
    .then((alumnos) => {
      console.log(alumnos);
      res.json(alumnos);
    })
    .catch((error) => {
      console.log(error);
      res.status(500).json({ error: 'Error al obtener los alumnos' });
    });
    console.log(resultado);
};

module.exports = ListarAlumnos;
