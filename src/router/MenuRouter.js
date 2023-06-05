const express = require('express');
const CheckLogin = require('../middleware/LoginMiddleware');
const { listarClases } = require('../models/User');
const ListarAlumnos = require('../controller/MenuController');
const MenuRouter = express.Router();

MenuRouter.get('/list/:clase',ListarAlumnos.ListarAlumnos);
MenuRouter.post('/guardarNotas',ListarAlumnos.guardarNotas)

module.exports = MenuRouter;