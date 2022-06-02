-- -----------------------------------------------------
-- Base de datos datamar1
-- -----------------------------------------------------
CREATE DATABASE datamart1;
USE datamart1 ;

-- -----------------------------------------------------
-- Table dim_curso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dim_curso (
  id INT NOT NULL,
  nivel VARCHAR(50) NOT NULL,
  paralelo VARCHAR(50) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table dim_periodo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dim_periodo (
  id INT NOT NULL,
  nombre_periodo VARCHAR(50) NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table dim_motivo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dim_motivo (
  id INT NOT NULL,
  descripcion VARCHAR(50) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table dim_profesor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS dim_profesor (
  id INT NOT NULL,
  nombre_profesor VARCHAR(50) NOT NULL,
  apellido1_profesor VARCHAR(50) NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table hec_desercioncurso
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS hec_desercioncurso (
  id_curso INT NOT NULL,
  id_motivo INT NOT NULL,
  id_profesor INT NOT NULL,
  suma_desercion INT NOT NULL,
  id_periodo INT NOT NULL,
  INDEX id_curso_idx (id_curso ASC) VISIBLE,
  INDEX id_motivo_idx (id_motivo ASC) VISIBLE,
  INDEX id_profesor_idx (id_profesor ASC) VISIBLE,
  INDEX id_periodo_idx (id_periodo ASC) VISIBLE,
  CONSTRAINT id_curso_idx
    FOREIGN KEY (id_curso)
    REFERENCES dim_curso (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT id_motivo_idx
    FOREIGN KEY (id_motivo)
    REFERENCES dim_motivo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT id_profesor_idx
    FOREIGN KEY (id_profesor)
    REFERENCES dim_profesor (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT id_periodo_idx
    FOREIGN KEY (id_periodo)
    REFERENCES dim_periodo (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;