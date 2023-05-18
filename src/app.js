console.clear();
const express = require('express');
const router = require('./router/LoginRouter');
const bodyParser = require('body-parser');
const app = express();
// Configuraciones adicionales de la aplicación
// Middleware para procesar los datos del formulario
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(express.static('public'));

app.get ('/', (req,res) => {
  res.send('html');
});

app.use(router);

// Iniciar el servidor
app.listen(5555, () => {
  console.log('Servidor iniciado en el puerto 5555');
});
