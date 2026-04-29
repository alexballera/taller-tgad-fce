----------------------------------------------------------------------------------
#PASO 1

CREATE DATABASE IF NOT EXISTS BANK2;

USE BANK2;

-----------------------------------------------------------------------------------
#Paso 2:
#En VSCode ejecute el script
-----------------------------------------------------------------------------------
#Paso 3

alter table PROVINCIA 
ADD CONSTRAINT ID_PROVINCIA PRIMARY KEY (ID_PROVINCIA);
commit;

select * from provincia;

select * from localidaD_1;

#NOTA:LOS TIPO DE DATOS DE PK Y FK DEBEN SER IGUALES
ALTER TABLE LOCALIDAD_1 MODIFY COLUMN ID_PROVINCIA SMALLINT;
COMMIT;

alter table LOCALIDAD_1 
ADD CONSTRAINT ID_LOCALIDAD PRIMARY KEY (ID_LOCALIDAD),
ADD CONSTRAINT ID_PROVINCIA FOREIGN KEY (ID_PROVINCIA) REFERENCES PROVINCIA(ID_PROVINCIA);