const { DataTypes, Sequelize } = require("sequelize");

const sequelize = new Sequelize('registrostec11', 'newuser', 'password', {
    host: 'localhost',
    dialect: 'mysql',
  });

  // Definición del modelo Alumno
  const Alumno = sequelize.define('Alumno', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    dni: DataTypes.STRING,
    nombre: DataTypes.STRING,
    apellido: DataTypes.STRING,
    fechaNac: DataTypes.DATE,
    libro: DataTypes.INTEGER,
    folio: DataTypes.INTEGER,
    direccion: DataTypes.STRING,
    telefono: DataTypes.STRING,
    email: DataTypes.STRING,
  });
  
  // Definición del modelo AlumnosMateriasAula
  const AlumnosMateriasAula = sequelize.define('Alumno_Aula', {
    dni: DataTypes.STRING,
    id_materia: DataTypes.INTEGER,
  });
  
  // Definición del modelo AlumnosMateriasTaller
  const AlumnosMateriasTaller = sequelize.define('Alumnos_Taller', {
    dni: DataTypes.STRING,
    id_materia: DataTypes.INTEGER,
  });
  
  // Definición del modelo Nota
  const Nota = sequelize.define('Nota', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    id_curso: DataTypes.INTEGER,
    nota_trimestre1_1: DataTypes.INTEGER,
    nota_trimestre1_2: DataTypes.INTEGER,
    nota_trimestre1_3: DataTypes.INTEGER,
    trimestre1: DataTypes.STRING,
    nota_trimestre2_1: DataTypes.INTEGER,
    nota_trimestre2_2: DataTypes.INTEGER,
    nota_trimestre2_3: DataTypes.INTEGER,
    trimestre2: DataTypes.STRING,
    nota_trimestre3_1: DataTypes.INTEGER,
    nota_trimestre3_2: DataTypes.INTEGER,
    nota_trimestre3_3: DataTypes.INTEGER,
    trimestre3: DataTypes.STRING,
    aprobado: DataTypes.STRING,
  });
  
  // Definición del modelo NotaTaller
  const NotaTaller = sequelize.define('NotaTaller', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    id_taller: DataTypes.INTEGER,
    nota_trimestre1_1: DataTypes.INTEGER,
    nota_trimestre1_2: DataTypes.INTEGER,
    nota_trimestre1_3: DataTypes.INTEGER,
    trimestre1: DataTypes.STRING,
    nota_trimestre2_1: DataTypes.INTEGER,
    nota_trimestre2_2: DataTypes.INTEGER,
    nota_trimestre2_3: DataTypes.INTEGER,
    trimestre2: DataTypes.STRING,
    nota_trimestre3_1: DataTypes.INTEGER,
    nota_trimestre3_2: DataTypes.INTEGER,
    nota_trimestre3_3: DataTypes.INTEGER,
    trimestre3: DataTypes.STRING,
    aprobado: DataTypes.STRING,
  });
  
  // Relaciones entre modelos
  Alumno.hasMany(AlumnosMateriasAula, { foreignKey: 'dni' });
  AlumnosMateriasAula.belongsTo(Alumno, { foreignKey: 'dni' });
  
  Alumno.hasMany(AlumnosMateriasTaller, { foreignKey: 'dni' });
  AlumnosMateriasTaller.belongsTo(Alumno, { foreignKey: 'dni' });
  
  // Sincronización de modelos con la base de datos
  sequelize.sync()
    .then(() => {
      console.log('Tablas sincronizadas correctamente');
    })
    .catch((error) => {
      console.error('Error al sincronizar las tablas:', error);
    });
  