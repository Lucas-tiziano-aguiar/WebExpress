const express = require('express');
const CheckLogin = require('../middleware/LoginMiddleware');
const mysql = require('mysql');
const MenuRouter = express.Router();
MenuRouter.use(express.json()); // Middleware para analizar el cuerpo de la solicitud como JSON


const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'Admin',
  password: 'password',
  port: 3306,
  database: 'registrostec11'
});

MenuRouter.get('/alumnos/:id_curso', (req, res) => {
  const { id_curso } = req.params;
  const { user } = req.session;

  const query = `
    SELECT ac.*, a.*
    FROM alumnos_clases ac
    JOIN alumno a ON ac.dni = a.dni
    WHERE ac.id_clase = ?
  `;

  connection.query(query, [id_curso], (err, rows) => {
    if (err) {
      console.error('Error al obtener los alumnos:', err);
      res.sendStatus(500);
      return;
    }

    res.render('alumnos', { user: user, alumnos: rows });
  });
});


// Enviar notas de un alumno
MenuRouter.post('/Notas/:id_curso/:dni/', (req, res) => {
  console.log(req.params);
  const { id_curso,dni } = req.params;
  const nota_uno = req.body.notaDos;
  const nota_dos =req.body.notaUno;
  const nota_tres = req.body.notaTres;
  console.log(nota_uno,nota_dos,nota_tres);

  const query = 'INSERT INTO notas (id_curso,dni, nota_uno, nota_dos, nota_tres) VALUES (? ,?, ?, ?, ?)';
  connection.query(query, [id_curso,dni, nota_uno, nota_dos, nota_tres], (err, result) => {
    if (err) {
      console.error('Error al guardar las notas del alumno:', err);
      res.sendStatus(500);
      return;
    }
    res.sendStatus(200);
  });
});

MenuRouter.post('/Notas/:id_curso',(req,res)=> {
  const {id_curso} = req.params;
  const query
});

MenuRouter.get('/notas/')

module.exports = MenuRouter;