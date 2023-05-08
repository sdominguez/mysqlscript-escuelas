SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS escuelas ;

CREATE SCHEMA IF NOT EXISTS escuelas 
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;


 USE escuelas ;


 CREATE TABLE IF NOT EXISTS escuelas.Entidades (
  idEntidad INT NOT NULL AUTO_INCREMENT,
  nombreEntidad VARCHAR(45) NOT NULL,
  PRIMARY KEY (idEntidad))
 ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escuelas`.`Localidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS escuelas.Localidades (
  idLocalidad INT NOT NULL AUTO_INCREMENT,
  nombreLocalidad VARCHAR(45) NOT NULL,
  idEntidad INT NOT NULL,
  PRIMARY KEY (idLocalidad),
  INDEX fk_Localidades_Entidades_idx (idEntidad ASC),
  CONSTRAINT fk_Localidades_Entidades
    FOREIGN KEY (idEntidad)
    REFERENCES escuelas.Entidades (idEntidad)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escuelas`.`Escuelas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS escuelas.Escuelas (
  claveEscuela VARCHAR(15) NOT NULL,
  nombreEscuela VARCHAR(100) NOT NULL,
  domicilio VARCHAR(100) NOT NULL,
  codigoPostal INT NOT NULL,
  turno CHAR NOT NULL,
  idLocalidad INT NOT NULL,
  PRIMARY KEY (claveEscuela),
  INDEX fk_Escuelas_Localidades1_idx (idLocalidad ASC),
  CONSTRAINT fk_Escuelas_Localidades1
    FOREIGN KEY (idLocalidad)
    REFERENCES escuelas.Localidades (idLocalidad)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `escuelas`.`EscuelaInforme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS escuelas.EscuelaInforme (
  docenteHombres INT NOT NULL DEFAULT 0,
  docenteMujeres INT NOT NULL DEFAULT 0,
  alumnoHombres INT NOT NULL DEFAULT 0,
  alumnoMujeres INT NOT NULL DEFAULT 0,
  claveEscuela VARCHAR(15) NOT NULL,
  PRIMARY KEY (claveEscuela),
  CONSTRAINT fk_EscuelaInforme_Escuelas1
    FOREIGN KEY (claveEscuela)
    REFERENCES escuelas.Escuelas (claveEscuela)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE escuelas ;

-- -----------------------------------------------------
-- Placeholder table for view `escuelas`.`ListaEscuelas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS escuelas.ListaEscuelas (claveEscuela INT, nombreEscuela INT, turno INT, nombreLocalidad INT, nombreEntidad INT);

-- -----------------------------------------------------
-- View `escuelas`.`ListaEscuelas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS escuelas.ListaEscuelas;

USE escuelas;
CREATE  OR REPLACE VIEW ListaEscuelas AS
SELECT e.claveEscuela, e.nombreEscuela, e.turno, 
l.nombreLocalidad, en.nombreEntidad
FROM Escuelas e 
JOIN Localidades l ON e.idLocalidad = l.idLocalidad
JOIN Entidades en ON en.idEntidad = l.idEntidad 
;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

USE escuelas;

SET FOREIGN_KEY_CHECKS=0;

truncate Entidades;
ALTER TABLE Entidades AUTO_INCREMENT = 1;

insert into Entidades(nombreEntidad) values ("VERACRUZ");

truncate Localidades;
ALTER TABLE Localidades AUTO_INCREMENT = 1;

insert into Localidades(nombreLocalidad, idEntidad) values("XALAPA", 1);
insert into Localidades(nombreLocalidad, idEntidad) values("VERACRUZ", 1);
insert into Localidades(nombreLocalidad, idEntidad) values("COATEPEC", 1);

truncate Escuelas;
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN2549B", "FRANCISCO GABILONDO SOLER", "OYAMEL No. 139", 91779, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN2550R", "PEDRO SAINZ DE BARANDA Y BORREYRO", "CARLOS REYES MONTOYA No. 143", 91716, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN2037B", "MANUEL M. PONCE", "PROLONGACION ACUEDUCTO No. 5", 91015, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN1597E", "COLIBRI", "RIO PANUCO No. 405", 91158, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN2452Q", "FERNANDO MONTES DE OCA", "CIRCUNVALACION ORIENTE No. 13", 91698, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0090I", "GUADALUPE CAMPOS", "URSULO GALVAN No. 1", 91090, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0091H", "JUANA AMELIA CELIS", "PIPILA No. 172", 91030, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0093F", "VIRGINIA AGUILAR PENSADO", "MIGUEL HIDALGO No. 71", 91000, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0095D", "ENRIQUE PESTALOZZI", "JUSTO SIERRA No. 7", 91000, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0098A", "JOSE MARIA MORELOS Y PAVON", "FRANCISCO JAVIER CLAVIJERO No. 15", 91000, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0099Z", "MARGARITA MAZA DE JUAREZ", "ADALBERTO TEJEDA No. 55", 91040, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0104V", "MARGARITA MAZA DE JUAREZ", "NIÑOS HEROES No. 1", 91637, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0116Z", "CARLOS A. CARRILLO", "4TA COLON No. 52", 91500, "M", 3);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0124I", "EL NIÑO ARTILLERO", "IGNACIO DE LA LLAVE No. 1312", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0125H", "BENITO JUAREZ GARCIA", "DIAZ ARAGON No. 148", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0126G", "ELENA V. DEL TORO", "AVENIDA VICTIMAS DEL 5 Y 6 DE JULIO No. 282", 91910, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0002Y", "GRACIELA RIVERA DE POZOS", "NORBERTO MARTINEZ No. 300", 91150, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0007T", "FRANCISCO GABILONDO SOLER", "AVENIDA NICOLAS BRAVO No. 958", 91700, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0018Z", "ELENA MARTINEZ CABAÑAS", "FRANCISCO CANAL No. 1478", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0032S", "ANGELA RECHY", "PROLONGACION FRANCISCO NAVARRETE No. 1200", 91050, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0033R", "GERTRUDIS GUEVARA DE VITE", "FELIX Z LICONA No. 205", 91110, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN2560Y", "OKISPIL", "PABLO NERUDA No. 1", 91714, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN2573B", "GABRIELA MISTRAL", "ANDADOR JUAN SEBASTIAN BACH No. 375", 91788, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0048T", "LUZ MARIA SERRADEL ROMERO", "CIRILO CELIS PASTRANA No. 74", 91119, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0259X", "MARIA DOLORES FLORES MORALES", "TOLUCA No. 203", 91130, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN2822S", "GABRIELA MISTRAL", "CAMINO TRAMO DERECHO KILOMETRO 0+0 No. 4", 91576, "M", 3);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN1935O", "ADOLFO RUIZ CORTINES", "HERNAN CORTES No. 1553", 91720, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN1940Z", "JOSE ANTONIO MURRIETA ALTAMIRANO", "MUNDO NUEVO No. 1", 91583, "M", 3);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0489P", "ELSSA ARCELUS DE ZAPATA", "GREGORIO NAVARRETE No. 126", 91778, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN1645Y", "ROSAS DE LA INFANCIA", "MARIA ENRIQUETA CAMARILLO No. 20", 91150, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN0173S", "ALBERTO VICARTE L.", "PRIMAVERA No. 5", 91060, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN0198A", "EVA FORTIER", "I. ICAZO No. 245", 91898, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN0199Z", "GRAL. IGNACIO ZARAGOZA", "VENUSTIANO CARRANZA No. 889", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN0226G", "MARIA ENRIQUETA", "UNION No. 3", 91080, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN3447L", "NEZAHUALPILLI", "CALLEJON AMPARO DEL CASTILLO No. 74", 91710, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN0230T", "CADETE VIRGILIO URIBE", "ISABEL LA CATOLICA No. 960", 91919, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN0043Z", "GRAL. HERIBERTO JARA CORONA", "SANTOS PEREZ ABASCAL No. 794", 91918, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0129D", "JOSE LUIS ORDAZ L.", "CARLOS CRUZ No. 1157", 91720, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0131S", "PROFRA. CAROLINA ESCALANTE VERA", "AVENIDA VICTIMAS DEL 25 DE JUNIO No. 445", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0132R", "PROFRA. BEATRIZ HERNANDEZ CONTRERAS", "JP SILVA No. 332", 91897, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0133Q", "TOMASA VALDES VIUDA DE ALEMAN", "HERNAN CORTES No. 1099", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN1505X", "VERACRUZ", "HACIENDA SANTA LUCIA No. 212", 91808, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN0694Z", "HERIBERTO JARA CORONA", "SANTOS PEREZ ABASCAL No. 794", 91918, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN0700U", "HERMANOS GRIMM", "JALISCO No. 23", 91130, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN3110A", "ERNESTO QUIRARTE LOPEZ", "JUAN DE LA LUZ ENRIQUEZ No. 2", 91010, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN2311R", "VENUSTIANO CARRANZA", "ALCOCER No. 1741", 91729, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN0135P", "XOCHIQUETZALLI", "AVENIDA ORIENTE 1 No. 800", 91110, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN1008Z", "ALFONSO PRUNEDA", "1 DE ENERO No. 4", 91194, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0236M", "OBRERO CAMPESINO", "OBRERO MUNDIAL No. 26", 91020, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN0316Z", "PROFRA. HILDA HERNANDEZ HUERTA", "ALCOCER No. 1741", 91729, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN0328D", "MARIA CORTINES VIUDA DE RUIZ", "HERNAN CORTES No. 1553", 91720, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN0352D", "ERNESTO MACARTY TORRES", "JUAN DE LA LUZ ENRIQUEZ No. 2", 91010, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN1096K", "ROSARIO ROLDAN GIL DE ALVARADO", "UNION No. 3", 91080, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN0492D", "XALLITIC", "DOCTOR RAFAEL LUCIO No. 112", 91000, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DJN0493C", "ANTONIO M. QUIRASCO", "RIO PANUCO No. 405", 91158, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR0007K", "VICENTE GUERRERO", "PLAYA LA QUEBRADA No. 671", 91810, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR1777F", "ROBERTO MEDELLIN OSTOS", "AVENIDA NIAGARA No. 28", 91155, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR0626T", "PROFR. GREGORIO TORRES QUINTERO", "RIO BRAVO No. 800", 91158, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR1845M", "ADOLFO LOPEZ MATEOS", "SANTIAGO BONILLA No. 83", 91020, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR2879J", "MANUEL C. TELLO", "SANTIAGO BONILLA No. 83", 91020, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR4426W", "EMILIANO ZAPATA", "ALMENDRO No. 726", 91940, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR1347P", "SALVADOR DIAZ MIRON", "JUAN ENRIQUEZ No. 1310", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR1348O", "SALVADOR DIAZ MIRON", "JUAN ENRIQUEZ No. 1310", 91700, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR1350C", "MANUEL C. TELLO", "FRAY BARTOLOME DE LAS CASAS No. 72", 91910, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR1354Z", "JUAN MALPICA SILVA", "CAMPERO No. 1002", 91720, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR1355Y", "JUAN MALPICA SILVA", "CAMPERO No. 1002", 91720, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR1359U", "IGNACIO ZARAGOZA", "MANLIO FABIO ALTAMIRANO No. 408", 91910, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR1367C", "PROFR. GERARDO RIVERO", "MARIANO ARISTA No. 477", 91710, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR1368B", "PROFR. GERARDO RIVERO", "MARIANO ARISTA No. 477", 91710, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR0589E", "GRAL. HERIBERTO JARA CORONA", "ISMAEL CRISTI No. 204", 91110, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR5306Q", "JOSE VASCONCELOS", "AVENIDA NIAGARA No. 28", 91155, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR0467U", "XICOTENCATL", "AVENIDA SALVADOR DIAZ MIRON No. 1489", 91700, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR5007S", "TIERRA Y LIBERTAD", "RIO CONSULADO No. 400", 91158, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR0477A", "JOSE MARIA MORELOS Y PAVON", "ZAMORA No. 3", 91500, "V", 3);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR1159V", "FRANCISCO FERRER GUARDIA", "AVENIDA DE LOS ATLETAS No. 2", 91080, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR1163H", "ENRIQUE C. REBSAMEN", "GUTIERREZ ZAMORA No. 23", 91000, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR1165F", "CARLOS A. CARRILLO", "CORDOBA No. 2", 91020, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR1169B", "DR. AGUSTIN GARCIA FIGUEROA", "CARRETERA FEDERAL LIBRE TRAMO PUEBLA-XALAPA KILOMETRO 140+0 No. 140", 91010, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR2134U", "DR. RAFAEL LUCIO", "GRACIANO VALENZUELA No. 50", 91110, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR3373Z", "JUSTINO SARMIENTO", "AVENIDA REVILLAGIGEDO No. 2571", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR3307B", "NICOLAS BRAVO", "CARLOS MENDEZ ALCALDE No. 65", 91070, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR3406A", "MANUEL R. GUTIERREZ", "GUADALUPE VICTORIA No. 110", 91000, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR3423R", "JUAN ZILLI BERNARDI", "CORDOBA No. 2", 91020, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR3213N", "MARIA ENRIQUETA", "ANDRES QUINTANA ROO No. 71", 91500, "M", 3);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR3238W", "ARTICULO TERCERO CONSTITUCIONAL", "GUILLERMO PRIETO No. 50", 91500, "M", 3);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2618X", "GRAL. MIGUEL ALEMAN", "AQUILES SERDAN No. 311", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2619W", "FRANCISCO JAVIER CLAVIJERO", "AVENIDA FRANCISCO I. MADERO No. 323", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2573R", "ANTONIO REVUELTA", "AVENIDA AVENIDA XALAPA No. 367", 91750, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2574Q", "ANDRES MONTES CRUZ", "AVENIDA MIGUEL A. DE QUEVEDO No. 4905", 91720, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2578M", "ADALBERTO LARA", "AVENIDA REVILLAGIGEDO No. 2571", 91700, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2580A", "XICOTENCATL", "AVENIDA SALVADOR DIAZ MIRON No. 489", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2581Z", "VICENTE GUERRERO", "CONSTITUCION No. 299", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2582Z", "VIRGILIO URIBE", "J. P. SILVA No. 318", 91897, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2584X", "VICENTE E. BARRIOS", "CAÑONERO TAMPICO No. 52", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR1703O", "BENITO JUAREZ GARCIA", "AVENIDA ZAPOTECAS No. 40", 91960, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR1706L", "EMILIANO ZAPATA", "ALMENDRO No. 726", 91940, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2938H", "JOSEFA MURILLO", "AVENIDA VENUSTIANO CARRANZA No. 116", 91150, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2588T", "PROFR. LEOPOLDO KIEL", "ECHEVEN No. 203", 91700, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2591G", "MIGUEL HIDALGO Y COSTILLA", "J. P. SILVA No. 318", 91897, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2594D", "MANUELA HERRERA", "CONSTITUCION No. 246", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2595C", "MARIA MALARD", "AVENIDA GUADALUPE VICTORIA No. 600", 91897, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2599Z", "MARIANA R. DEL T. DE LAZARIN", "AVENIDA 20 DE NOVIEMBRE No. 462", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2601X", "MANUEL AVILA CAMACHO", "AVENIDA REVILLAGIGEDO No. 2549", 91700, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2603V", "LEONA VICARIO", "CONSTITUCION No. 519", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2943T", "PROGRESO", "CHIHUAHUA No. 144", 91130, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2944S", "SALVADOR DIAZ MIRON", "SALVADOR DIAZ MIRON No. 19", 91000, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR3649Y", "LIC. ADOLFO RUIZ CORTINES", "SANTO DOMINGO No. 5", 91936, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2606S", "JULIO S. MONTERO", "AVENIDA REVILLAGIGEDO No. 2549", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2607R", "JOSE MIGUEL MACIAS", "ESTEBAN MORALES No. 123", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2608Q", "JOSEFA ORTIZ DE DOMINGUEZ", "IGNACIO LOPEZ RAYON No. 513", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2609P", "JOSE MARIA MORELOS Y PAVON", "AVENIDA MIGUEL HIDALGO No. 515", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2611D", "JULIO F. REBOLLEDO", "MIGUEL A DE QUEVEDO No. 4905", 91720, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR2593F", "NIÑOS HEROES DE CHAPULTEPEC", "CALLE 8 O CHAPULTEPEC No. 9", 91757, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2617Y", "GRAL. HERIBERTO JARA CORONA", "ECHEVEN No. 203", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR3487C", "FRANCISCO I. MADERO", "PRIMERO DE MAYO No. 45", 91050, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR3488B", "IGNACIO ZARAGOZA", "INSURGENTES No. 102", 91000, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR4869Q", "SIMON BOLIVAR", "EL ROSAL No. 29", 91166, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR4871E", "CRISTOBAL COLON", "ANGEL CARVAJAL No. 52", 91090, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR1056Z", "BENITO JUAREZ GARCIA", "PROLONGACION ACUEDUCTO No. 250", 91015, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR3446B", "ADALBERTO TEJEDA", "AVENIDA MEXICO No. 110", 91119, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR3448Z", "SIETE DE NOVIEMBRE", "PRIVADA DE JOAQUIN ARRONIZ No. 1", 91150, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR3549Z", "ING. CARLOS MENDEZ ALCALDE", "CARLOS MENDEZ ALCALDE No. 65", 91070, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR0137D", "SEBASTIAN LERDO DE TEJADA", "COYOACAN No. 12", 91180, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR3784B", "JESUS GARCIA CORONA", "PRIVADA DE JOAQUIN ARRONIZ No. 1", 91143, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR1978C", "JOSE RODRIGUEZ CLAVERIA", "J P SILVA No. 45", 91898, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR3894I", "PROFR. RAFAEL RAMIREZ", "GRACIANO VALENZUELA No. 50", 91110, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR2683Y", "UNION FEMENINA IBERO AMERICANA", "ALCOCER No. 1721", 91729, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR2696B", "CUAUHTEMOC", "MIGUEL HIDALGO No. 22", 91500, "M", 3);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR5237K", "RAFAEL HERNANDEZ OCHOA", "AVENIDA CAMINO ANTIGUO A NAOLINCO No. 2", 91158, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR2699Z", "ANTONIO BARBOSA HELDT", "AVENIDA PLAYA ROQUETA No. 33", 91810, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR2706S", "RICARDO FLORES MAGON", "PROLONGACION COYOACAN No. 12", 91180, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR1138I", "LUIS HIDALGO MONROY", "AVENIDA ANTONIO CHEDRAUI CARAM No. 153", 91155, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR1139H", "ABRAHAM CASTELLANOS", "VICENTE GUERRERO No. 120", 91000, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR1142V", "MANUEL DE BOZA", "XALAPEÑOS ILUSTRES No. 49", 91000, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2315C", "ANTONIO PEÑAFIEL", "AVENIDA ADOLFO RUIZ CORTINES No. 941", 91010, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR0300N", "ANTONIO REVUELTA", "AVENIDA XALAPA No. 367", 91720, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2620L", "FEDERICO FROEBEL", "AVENIDA SALVADOR DIAZ MIRON No. 812", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2621K", "ESTEBAN MORALES", "AVENIDA NICOLAS BRAVO No. 958", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2623I", "ELENA V. DEL TORO", "IGNACIO LOPEZ RAYON No. 513", 91700, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2626F", "CAYETANO RIVERA", "AVENIDA JIMENEZ No. 3783", 91750, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2627E", "CONSTANZA CONDES DE LA TORRE", "MIGUEL A DE QUEVEDO No. 6118", 91750, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR0471H", "CAROLINO ANAYA", "RIO BRAVO No. 800", 91158, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR0820X", "MIGUEL ALEMAN VALDES", "CAMINO ANTIGUO CAMINO A NAOLINCO No. 201", 91150, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR1429Z", "URSULO GALVAN", "PRIMERO DE MAYO No. 45", 91050, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR2764H", "PROFR. SALVADOR VALENCIA ORTUÑO", "TAMAZUNCHALE No. 1", 91190, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR0519K", "JOSE RODRIGUEZ CLAVERIA", "J P SILVA No. 45", 91898, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR2095I", "16 DE SEPTIEMBRE", "JORULLO No. 101", 91130, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR3535V", "MIGUEL HIDALGO Y COSTILLA", "AVENIDA PRESIDENTE MIGUEL ALEMAN No. 115", 91140, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR5536I", "AGUSTIN DE ITURBIDE", "RIO CONSULADO No. 400", 91158, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR4936Y", "LEONEL ESCUDERO REYES", "JOSE ALVARADO No. 220", 91158, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR4937X", "ALFONSO ARROYO FLORES", "CUAUHTEMOC No. 162", 91500, "V", 3);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR4949B", "MARIA ENRIQUETA", "ANDRES QUINTANA ROO No. 71", 91500, "V", 3);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DPR4791T", "PROFR. ANTONIO BARBOSA HELDT", "AVENIDA PLAYA ROQUETA No. 33", 91810, "V", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EPR3144G", "GUADALUPE VICTORIA", "AQUILES SERDAN No. 1431", 91700, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DES0133A", "ESCUELA SECUNDARIA GENERAL NUM. 7", "PRIVADA BUENAVISTA No. 205", 91850, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DES0135Z", "JESUS REYES HEROLES", "CHIHUAHUA No. 114", 91130, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DES0142I", "NIÑOS HEROES DE CHAPULTEPEC", "ESTRELLA POLAR DEL NORTE No. 2", 91050, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DES0144G", "MAESTRO EFREN RAMIREZ HERNANDEZ", "AVENIDA 16 DE SEPTIEMBRE No. 169", 91500, "M", 3);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EES0110P", "EXPERIMENTAL", "JUAN ESCUTIA No. 2", 91100, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DES0028Q", "IGNACIO DE LA LLAVE", "JUAN DE DIOS PEZA No. 23", 91500, "M", 3);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DES0034A", "JUAN G. ALARCON", "AVENIDA EFREN NAVA Z No. 23", 91240, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DES0043I", "JULIO ZARATE", "CORDOBA No. 4", 91000, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DES0071E", "ANTOLIN TORRES MENDIETA", "PRIMO TAPIA No. 8", 91090, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DES0091S", "DAVID ALFARO SIQUEIROS", "NACIONES UNIDAS No. 26", 91190, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DES0105E", "MANUEL R. GUTIERREZ", "GUILLERMO PRIETO No. 35", 91030, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DES0109A", "EMELIA L. TURINCIO DE EXSOME", "PLAYA ESCONDIDA No. 280", 91810, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DST0003Z", "SECUNDARIA TECNICA INDUSTRIAL NUM. 3", "AVENIDA AVILA CAMACHO No. 114", 91000, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DST0069I", "SECUNDARIA TECNICA INDUSTRIAL NUM. 69", "HEROICA No. 15", 91739, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DST0122N", "SECUNDARIA TECNICA INDUSTRIAL NUM. 122 ALFREDO MARTINEZ PACHECO", "LLANO No. 1", 91097, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DTV1682R", "ADOLFO RUIZ CORTINES", "CIRCUITO LOMA DEL PORVENIR No. 1", 91098, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DTV0580N", "CAROLINO ANAYA", "RIO SOTO LA MARINA No. 207", 91158, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DTV1030R", "ALVARO GALVEZ Y FUENTES", "DE LAS ROSAS No. 367", 91726, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DTV1708I", "MIGUEL HIDALGO Y COSTILLA", "PARQUE ECOLOGICO MACUILTEPETL No. 16", 91015, "V", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DTV0813M", "BENITO FENTANES", "TINAKU No. 24", 91155, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DTV0128V", "JOSE CALAZAN LEON", "PROLONGACION URSULO GALVAN No. 3", 91681, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DTV1781R", "EJERCITO MEXICANO", "MERCURIO No. 720", 91059, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DTV0152V", "RAFAEL HERNANDEZ OCHOA", "28 DE AGOSTO No. 241", 91097, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DTV0297Q", "DR. RAFAEL LUCIO NAJERA", "MANUEL MARIA CONTRERAS No. 700", 91110, "M", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DTV0226W", "TELESECUNDARIA NUM. 226", "ADOLFO SUGASTI SARMIENTO No. 298", 91778, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DTV0288I", "RAFAEL RAMIREZ CASTAÑEDA", "CARLOS CRUZ No. 1675", 91729, "M", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DSN0009J", "ANTONIO CHEDRAUI CARAM", "GUTIERREZ ZAMORA No. 23", 91000, "N", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DSN0018R", "MTRO. JOAQUIN RAMIREZ CABAÑAS", "ZARAGOZA No. 1", 91500, "N", 3);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DSN0037F", "ESCUELA SECUNDARIA GENERAL PARA TRABAJADORES NUM.2", "ORIZABA No. 42", 91049, "N", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30DSN0047M", "ESCUELA SECUNDARIA GENERAL PARA TRABAJADORES", "PASEO FRAMBOYANES No. 205", 91850, "N", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EBA0106G", "VIRGILIO URIBE", "NICOLAS BRAVO No. 958", 91700, "N", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EBA0108E", "NICOLAS BRAVO", "MIGUEL HIDALGO No. 515", 91700, "N", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EBA0109D", "MEXICO", "MIGUEL ANGEL DE QUEVEDO No. 6118", 91750, "N", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EBA0110T", "MANUEL DOBLADO", "SALVADOR DIAZ MIRON No. 489", 91700, "N", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EBA0115O", "DANIEL ARIZA", "CORDOBA No. 7", 91000, "N", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EBA0116N", "ATENOGENES PEREZ Y SOTO", "GUADALUPE VICTORIA No. 110", 91000, "N", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EBA0118L", "MANUEL DE BOZA", "XALAPEÑOS ILUSTRES No. 49", 91000, "N", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EBA0129R", "PROFR. LEOPOLDO KIEL", "VICENTE GUERRERO No. 62", 91050, "N", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EBA0139Y", "MARIANO MATAMOROS", "JOAQUIN ARRONIZ No. 1", 91143, "N", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EBA0146H", "PROFRA. MARIA LUISA SANTOS ROMAN", "REVILLAGIGEDO No. 2571", 91700, "N", 1);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EBA0147G", "JUSTO SIERRA", "PRESIDENTE MIGUEL ALEMAN No. 115", 91140, "N", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EBA0157N", "JOSE VASCONCELOS", "MEXICO No. 110", 91119, "N", 2);
insert into Escuelas(claveEscuela, nombreEscuela, domicilio, codigoPostal, turno,  idLocalidad) values("30EJN0785Q", "ROSAURA ZAPATA", "DIEGO LEÑO No. 2", 91000, "M", 2);


truncate EscuelaInforme;

insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,4,39,26, "30DJN2549B");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,57,45, "30DJN2550R");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,3,29,33, "30DJN2037B");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,7,57,74, "30DJN1597E");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,7,83,77, "30DJN2452Q");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,5,38,38, "30EJN0090I");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,7,51,57, "30EJN0091H");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,12,104,104, "30EJN0093F");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,12,91,97, "30EJN0095D");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,57,55, "30EJN0098A");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,56,45, "30EJN0099Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,8,74,71, "30EJN0104V");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,61,57, "30EJN0116Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,8,65,53, "30EJN0124I");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,7,34,36, "30EJN0125H");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,14,107,97, "30EJN0126G");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,4,27,35, "30EJN0002Y");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,38,41, "30EJN0007T");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,43,51, "30EJN0018Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,5,43,45, "30EJN0032S");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,9,85,95, "30EJN0033R");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,83,45, "30DJN2560Y");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,66,70, "30DJN2573B");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,61,55, "30EJN0048T");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,9,78,86, "30EJN0259X");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,51,48, "30DJN2822S");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,7,39,43, "30DJN1935O");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,7,61,82, "30DJN1940Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,55,56, "30EJN0489P");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,5,49,47, "30DJN1645Y");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,5,42,48, "30DJN0173S");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,5,55,33, "30DJN0198A");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,7,67,74, "30DJN0199Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,70,44, "30DJN0226G");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,8,112,84, "30DJN3447L");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,5,35,36, "30DJN0230T");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,8,73,63, "30DJN0043Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,12,73,92, "30EJN0129D");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,9,86,108, "30EJN0131S");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,11,83,55, "30EJN0132R");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,8,66,83, "30EJN0133Q");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,58,59, "30EJN1505X");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,4,24,36, "30DJN0694Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,24,25, "30DJN0700U");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,63,78, "30DJN3110A");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,5,46,41, "30DJN2311R");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,8,73,82, "30DJN0135P");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,5,46,56, "30DJN1008Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,3,22,16, "30EJN0236M");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,7,65,62, "30DJN0316Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,10,100,79, "30DJN0328D");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,71,74, "30DJN0352D");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,5,31,42, "30DJN1096K");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,5,43,46, "30DJN0492D");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,63,70, "30DJN0493C");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,4,64,47, "30DPR0007K");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,9,167,145, "30DPR1777F");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,15,272,245, "30DPR0626T");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(6,8,182,187, "30DPR1845M");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,8,54,51, "30DPR2879J");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,3,29,23, "30DPR4426W");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,13,170,168, "30DPR1347P");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,7,21,21, "30DPR1348O");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,11,105,94, "30DPR1350C");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,14,282,289, "30DPR1354Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,10,100,64, "30DPR1355Y");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,6,64,42, "30DPR1359U");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,62,42, "30DPR1367C");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,9,110,111, "30DPR1368B");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,10,131,159, "30EPR0589E");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,3,55,65, "30DPR5306Q");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,6,59,46, "30EPR0467U");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,5,110,88, "30DPR5007S");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(5,7,70,63, "30EPR0477A");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(6,16,255,214, "30EPR1159V");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(7,17,316,289, "30EPR1163H");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,26,409,419, "30EPR1165F");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,16,206,213, "30EPR1169B");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(6,16,324,358, "30DPR2134U");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,8,102,75, "30EPR3373Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,5,59,42, "30DPR3307B");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,4,20,11, "30EPR3406A");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,6,40,25, "30EPR3423R");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,12,166,164, "30DPR3213N");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,6,115,91, "30DPR3238W");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,6,90,77, "30EPR2618X");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,11,184,127, "30EPR2619W");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,9,126,142, "30EPR2573R");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,13,147,161, "30EPR2574Q");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,3,26,20, "30EPR2578M");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,8,82,87, "30EPR2580A");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,52,60, "30EPR2581Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,4,60,30, "30EPR2582Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,11,152,147, "30EPR2584X");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,3,48,43, "30DPR1703O");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,10,155,138, "30DPR1706L");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,15,222,227, "30EPR2938H");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,3,37,28, "30EPR2588T");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,12,106,106, "30EPR2591G");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,12,111,229, "30EPR2594D");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,11,136,110, "30EPR2595C");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,7,89,63, "30EPR2599Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,7,46,36, "30EPR2601X");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,5,63,82, "30EPR2603V");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,15,227,245, "30EPR2943T");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(5,19,303,293, "30EPR2944S");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,4,59,60, "30DPR3649Y");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,9,104,141, "30EPR2606S");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,9,126,146, "30EPR2607R");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,18,198,255, "30EPR2608Q");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,10,128,132, "30EPR2609P");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,4,67,65, "30EPR2611D");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,8,59,48, "30DPR2593F");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(5,1,46,38, "30EPR2617Y");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,8,64,56, "30DPR3487C");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,4,47,30, "30DPR3488B");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(5,13,243,261, "30DPR4869Q");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,3,64,63, "30DPR4871E");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,11,167,188, "30DPR1056Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,11,131,152, "30EPR3446B");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,10,136,124, "30EPR3448Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,9,134,120, "30DPR3549Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,4,58,50, "30DPR0137D");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,3,45,38, "30EPR3784B");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,9,139,146, "30DPR1978C");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,9,154,120, "30DPR3894I");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,9,177,209, "30DPR2683Y");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,13,216,249, "30DPR2696B");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(6,6,197,185, "30DPR5237K");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,8,196,159, "30DPR2699Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,7,107,115, "30DPR2706S");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(5,7,146,151, "30EPR1138I");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(5,13,224,248, "30EPR1139H");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,5,34,15, "30EPR1142V");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,12,186,183, "30EPR2315C");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,10,74,75, "30EPR0300N");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,10,174,201, "30EPR2620L");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,4,62,58, "30EPR2621K");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,4,41,25, "30EPR2623I");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,6,62,57, "30EPR2626F");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,3,68,63, "30EPR2627E");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,10,167,131, "30DPR0471H");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,7,126,98, "30DPR0820X");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,12,193,200, "30DPR1429Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,7,82,87, "30EPR2764H");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,2,25,21, "30DPR0519K");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,7,92,83, "30DPR2095I");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,5,41,38, "30EPR3535V");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(6,2,99,95, "30DPR5536I");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(6,1,72,61, "30DPR4936Y");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,5,72,78, "30DPR4937X");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,9,95,109, "30DPR4949B");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,5,47,63, "30DPR4791T");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,6,74,68, "30EPR3144G");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(8,18,220,183, "30DES0133A");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(8,9,274,203, "30DES0135Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(10,19,351,314, "30DES0142I");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(11,11,265,357, "30DES0144G");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(23,32,313,321, "30EES0110P");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(11,18,395,378, "30DES0028Q");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(17,18,385,408, "30DES0034A");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(15,22,318,425, "30DES0043I");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(17,17,291,245, "30DES0071E");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(14,27,313,316, "30DES0091S");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(7,23,397,469, "30DES0105E");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(11,22,284,299, "30DES0109A");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(12,20,346,406, "30DST0003Z");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(10,21,342,381, "30DST0069I");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(14,19,342,291, "30DST0122N");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,4,75,57, "30DTV1682R");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(4,8,195,184, "30DTV0580N");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,8,175,166, "30DTV1030R");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,6,55,44, "30DTV1708I");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(2,10,181,164, "30DTV0813M");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(5,7,160,129, "30DTV0128V");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,1,25,21, "30DTV1781R");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,10,184,211, "30DTV0152V");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(5,10,257,237, "30DTV0297Q");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(3,10,273,200, "30DTV0226W");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(1,10,196,148, "30DTV0288I");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(5,13,114,63, "30DSN0009J");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(8,12,125,112, "30DSN0018R");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(10,9,88,61, "30DSN0037F");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(8,7,35,20, "30DSN0047M");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,0,0,0, "30EBA0106G");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,0,0,0, "30EBA0108E");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,0,0,0, "30EBA0109D");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,0,0,0, "30EBA0110T");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,0,0,0, "30EBA0115O");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,0,0,0, "30EBA0116N");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,0,0,0, "30EBA0118L");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,0,0,0, "30EBA0129R");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,0,0,0, "30EBA0139Y");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,0,0,0, "30EBA0146H");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,0,0,0, "30EBA0147G");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,0,0,0, "30EBA0157N");
insert into EscuelaInforme(docenteHombres, docenteMujeres, alumnoHombres, alumnoMujeres, claveEscuela) values(0,0,0,0, "30EJN0785Q");



SET FOREIGN_KEY_CHECKS=1;