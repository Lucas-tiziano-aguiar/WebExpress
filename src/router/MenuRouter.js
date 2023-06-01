const express = require('express');
const CheckLogin = require('../middleware/LoginMiddleware');
const MenuRouter = express.Router();

MenuRouter.get('/Menulist/:id', (req, res) => {
    const id = req.params.id;
    
});