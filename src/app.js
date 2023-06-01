console.clear();
const express = require('express');
const loginRouter = require('./router/LoginRouter');
const bodyParser = require('body-parser');
const app = express();
const session = require('express-session');
const path = require('path');
// Configuraciones adicionales de la aplicación
app.use(
  session({
    secret: 'mi_secreto',
    resave: false,
    saveUninitialized: false
  })
);
// Middleware para procesar los datos del formulario
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
//motor de plantillas
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'view'));

app.use(express.static('public'));

app.get ('/', (req,res) => {
  res.sendFile('index.html');
});

app.use('/',loginRouter);
const PORT = 555;
// Iniciar el servidor

app.listen(PORT, () => {
  console.log('Servidor iniciado en el puerto '+PORT);
});
