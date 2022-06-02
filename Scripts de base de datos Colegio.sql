-- -----------------------------------------------------
-- Schema colegio
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS colegio ;

-- -----------------------------------------------------
-- Schema colegio
-- -----------------------------------------------------
USE colegio ;

-- -----------------------------------------------------
-- Table alumno
-- -----------------------------------------------------
DROP TABLE IF EXISTS alumno ;

CREATE TABLE IF NOT EXISTS alumno (
  id INT NOT NULL,
  alumno_nombre VARCHAR(50) NOT NULL,
  alumno_apellido1 VARCHAR(50) NOT NULL,
  alumno_apellido2 VARCHAR(50) NOT NULL,
  alumno_fechaNacimiento DATE NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table curso
-- -----------------------------------------------------
DROP TABLE IF EXISTS curso ;

CREATE TABLE IF NOT EXISTS curso (
  id INT NOT NULL,
  nivel VARCHAR(50) NOT NULL,
  paralelo VARCHAR(50) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table materia
-- -----------------------------------------------------
DROP TABLE IF EXISTS materia ;

CREATE TABLE IF NOT EXISTS materia (
  id INT NOT NULL,
  nombre_materia VARCHAR(50) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table motivo
-- -----------------------------------------------------
DROP TABLE IF EXISTS motivo ;

CREATE TABLE IF NOT EXISTS motivo (
  id INT NOT NULL,
  descripcion VARCHAR(50) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table periodo
-- -----------------------------------------------------
DROP TABLE IF EXISTS periodo ;

CREATE TABLE IF NOT EXISTS periodo (
  id INT NOT NULL,
  nombre_periodo VARCHAR(50) NOT NULL,
  fechaInicio DATE NOT NULL,
  fechaFin DATE NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table profesor
-- -----------------------------------------------------
DROP TABLE IF EXISTS profesor ;

CREATE TABLE IF NOT EXISTS profesor (
  id INT NOT NULL,
  profesor_nombre VARCHAR(50) NOT NULL,
  profesor_apellido1 VARCHAR(50) NOT NULL,
  profesor_apellido2 VARCHAR(50) NOT NULL,
  profesor_fechaNacimiento DATE NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table alumno_materia
-- -----------------------------------------------------
DROP TABLE IF EXISTS alumno_materia ;

CREATE TABLE IF NOT EXISTS alumno_materia (
  id INT NOT NULL,
  id_alumno INT NOT NULL,
  id_materia INT NOT NULL,
  id_periodo INT NOT NULL,
  id_curso INT NOT NULL,
  id_motivo INT NOT NULL,
  id_profesor INT NOT NULL,
  calificacion VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  INDEX id_alumno (id_alumno ASC) VISIBLE,
  INDEX id_materia (id_materia ASC) VISIBLE,
  INDEX id_periodo (id_periodo ASC) VISIBLE,
  INDEX id_curso_idx (id_curso ASC) VISIBLE,
  INDEX id_motivo_idx (id_motivo ASC) VISIBLE,
  INDEX id_profesor_idx (id_profesor ASC) VISIBLE,
  CONSTRAINT id_alumno
    FOREIGN KEY (id_alumno)
    REFERENCES alumno (id),
  CONSTRAINT id_curso
    FOREIGN KEY (id_curso)
    REFERENCES curso (id),
  CONSTRAINT id_materia
    FOREIGN KEY (id_materia)
    REFERENCES materia (id),
  CONSTRAINT id_motivo
    FOREIGN KEY (id_motivo)
    REFERENCES motivo (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT id_periodo
    FOREIGN KEY (id_periodo)
    REFERENCES periodo (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT id_profesor
    FOREIGN KEY (id_profesor)
    REFERENCES profesor (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table aula
-- -----------------------------------------------------
DROP TABLE IF EXISTS aula ;

CREATE TABLE IF NOT EXISTS aula (
  id INT NOT NULL,
  id_materia INT NOT NULL,
  id_profesor INT NOT NULL,
  id_periodo INT NOT NULL,
  nombre_aula VARCHAR(50) NOT NULL,
  capacidad VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  INDEX id_materia_idx (id_materia ASC) VISIBLE,
  INDEX id_profesor_idx (id_profesor ASC) VISIBLE,
  INDEX id_periodo_idx (id_periodo ASC) VISIBLE,
  CONSTRAINT id_materia_idx
    FOREIGN KEY (id_materia)
    REFERENCES materia (id),
  CONSTRAINT id_periodo_idx
    FOREIGN KEY (id_periodo)
    REFERENCES periodo (id),
  CONSTRAINT id_profesor_idx
    FOREIGN KEY (id_profesor)
    REFERENCES profesor (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table dia_semana
-- -----------------------------------------------------
DROP TABLE IF EXISTS dia_semana ;

CREATE TABLE IF NOT EXISTS dia_semana (
  id INT NOT NULL,
  nombre_diaSemana VARCHAR(50) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table horario
-- -----------------------------------------------------
DROP TABLE IF EXISTS horario ;

CREATE TABLE IF NOT EXISTS horario (
  id INT NOT NULL,
  id_dia INT NOT NULL,
  id_clase INT NOT NULL,
  horaInicio TIME NOT NULL,
  horaFin TIME NOT NULL,
  PRIMARY KEY (id),
  INDEX id_dia_idx (id_dia ASC) VISIBLE,
  INDEX id_clase_idx (id_clase ASC) VISIBLE,
  CONSTRAINT id_clase_idx
    FOREIGN KEY (id_clase)
    REFERENCES aula (id),
  CONSTRAINT id_dia_idx
    FOREIGN KEY (id_dia)
    REFERENCES dia_semana (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
