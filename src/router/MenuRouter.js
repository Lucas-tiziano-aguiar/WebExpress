const express = require('express');
const CheckLogin = require('../middleware/LoginMiddleware');
const { listarClases } = require('../models/User');
const ListarAlumnos = require('../controller/MenuController');
const MenuRouter = express.Router();

MenuRouter.get('/menulist/:clase?', (req, res) => {
    const { clase } = req.params;
    ListarAlumnos(clase,res);
});

module.exports = MenuRouter;