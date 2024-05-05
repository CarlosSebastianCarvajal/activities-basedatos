
CREATE TABLE persona (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    fecha_nacimiento DATE,
    telefono VARCHAR(20),
    correo VARCHAR(255),
    direccion VARCHAR(255),
    ciudad VARCHAR(100),
    pais VARCHAR(100)
);

CREATE TABLE tipousuario (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE
);


CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    idpersona INTEGER REFERENCES persona(id),
	idtipousuario INTEGER REFERENCES tipousuario(id),
	nombre_usuario VARCHAR(100) UNIQUE,
    contrasena VARCHAR(255),
	codigorec  VARCHAR(100),
	codigoinicio VARCHAR(20),
	tienebloqueo BIT
);

CREATE TABLE registro_sesion (
    id SERIAL PRIMARY KEY,
    idusuario INTEGER REFERENCES usuario(id),
    fecha_inicio TIMESTAMP,
    fecha_fin TIMESTAMP,
	disposiivo VARCHAR(255)
);

CREATE TABLE actividad (
    id SERIAL PRIMARY KEY,
    nombre_corto VARCHAR(100),
    descripcion TEXT
	fechacreacion DATE,
    fechalimite DATE,
    
);

CREATE TABLE actividadpersonal (
    id SERIAL PRIMARY KEY,
    idactividad INTEGER REFERENCES actividad(id),
    idusuario INTEGER REFERENCES usuario(id),
    
	fechacumplida DATE,
	observacion TEXT,
    pathdocumento VARCHAR(255)
);

CREATE TABLE equipo (
    id SERIAL PRIMARY KEY,
    idusuario INTEGER REFERENCES usuario(id),
    denominacion VARCHAR(32),
    colorequipo VARCHAR(20)    --debo guardar un rgb
);

CREATE TABLE integranteequipo (
    id SERIAL PRIMARY KEY,
    idusuario INTEGER REFERENCES usuario(id),
    idequipo INTEGER REFERENCES equipo(id),
    correoref VARCHAR(255),
	--avisocorreo TIMESTAMP,
	aceptaciongrupo BIT
);

CREATE TABLE actividadequipo (
    id SERIAL PRIMARY KEY,
    idactividad INTEGER REFERENCES actividad(id),
    idequipo INTEGER REFERENCES equipo(id),
    fechacreacion DATE,
    fechalimite DATE,
	notas TEXT,
    pathdocumento VARCHAR(255)
);

CREATE TABLE cumplimiento (
    id SERIAL PRIMARY KEY,
    idactividad INTEGER REFERENCES actividad(id),
    idintegrante INTEGER REFERENCES integranteequipo(id),
    fechacumplida DATE,
    pathdocumento VARCHAR(255)
); 





