# Taller de Programación para el análisis de datos

# Clase 11.1: Conexión Python MySQL Workbench para inserción de datos 
# Módulos y Librerías

#si no los tiene instalado, previamente instalar desde la terminal 
# pip install mysql-connector-python
# pip install pandas

import pandas as pd

#buscar el path donde se encuentra alojado el csv
#insertar el path correspondiente a donde tiene el archivo de datos BANK.csv
path = "C:\Users\Alexander\Proyectos\educacion\datos\taller-tgad-fce\sesiones\segundo-parcial\u2\clase11\bank_transactions.csv"
BANK=pd.read_csv(r{path}, sep=";")
BANK

BANK.shape

BANK.columns

### Conexión a MySQL-Workbench ###

#Recuerde primero crear la base BANK en Workbench: ejecutar el script

# para verificar los datos: abrir Workbench y en donde se 
# va a conectar, click derecho -> Edit Connection
from sqlalchemy import create_engine

db_url = "mysql+mysqlconnector://{USER}:{PWD}@{HOST}/{DBNAME}"


db_url=db_url.format(
    USER = "root",
    PWD = "PASSWORD", #ingrese su password de Workbench donde dice PASSWORD
    HOST = "localhost",
    DBNAME = "BANK" #poner el nombre de la base BANK creada previamente (Ver primero script SQL)
)


engine = create_engine(db_url, echo=False)

### crear las tablas con Python y almacenarlas directamente en la base 
# luego en Workbench deberá modificar la tabla para establecer PK, FK y documentar

BANK.columns

#Primero crear los ID que faltan: ID_GENERO, ID_LOCALIDAD, ID_PROVINCIA

#si utiliza cat.code recuerde que el primer valor que asigna es 0

#BANK['Localidad_Cliente'].unique() #observo valores únicos
#BANK['ID_LOCALIDAD']=BANK['Localidad_Cliente'].astype('category').cat.codes
#BANK['ID_LOCALIDAD'].unique()

#BANK['Provincia_Cliente'].unique() #observo valores únicos
#BANK['ID_PROVINCIA']=BANK['Provincia_Cliente'].astype('category').cat.codes
#BANK['ID_PROVINCIA'].unique()

# Generalmente los ID en una base de datos relacional comienzan en 1
# para ello, entonces cree los ID con un diccionario (ver clases del taller)

#observar valores únicos
BANK['Localidad_Cliente'].unique()
# Diccionario para recategorizar
valoresL = {'CABA': 1,'Ciudad de Cordoba': 2, 'Rosario':3}
# Crear nueva columna con la categoría
BANK['ID_LOCALIDAD'] = BANK['Localidad_Cliente'].map(valoresL)
#observar
BANK['ID_LOCALIDAD'].unique()


#observar valores únicos
BANK['Provincia_Cliente'].unique()
# Diccionario para recategorizar
valoresP = {'CABA': 1,'Cordoba': 2, 'Santa Fe':3}
# Crear nueva columna con la categoría
BANK['ID_PROVINCIA'] = BANK['Provincia_Cliente'].map(valoresP)
#observar
BANK['ID_PROVINCIA'].unique()

BANK

####### CREACIÓN DE TABLAS en la base de Workbench

# Datos únicos para la tabla PROVINCIA

#dataframe TIPO DE CUENTA
PROVINCIA=pd.DataFrame({'ID_PROVINCIA':BANK['ID_PROVINCIA'].unique(), 'Provincia_Cliente':BANK['Provincia_Cliente'].unique()})

PROVINCIA

#se crea la tabla PROVINCIA en la base
with engine.begin() as conn:
    PROVINCIA.to_sql(
        name='PROVINCIA', # nombre de la tabla
        con=conn,
        index=False # para que no guarde el indice
    )

# Datos únicos para la tabla LOCALIDAD
BANK.columns

#dataframe State, teniendo en cuenta agregar ID_COUNTRY
LOCALIDAD=pd.DataFrame({'ID_LOCALIDAD':BANK['ID_LOCALIDAD'].unique(), 
                    'Localidad_Cliente':BANK['Localidad_Cliente'].unique(),
                    'ID_PROVINCIA':BANK[['ID_LOCALIDAD', 'ID_PROVINCIA']].drop_duplicates()['ID_PROVINCIA']
                    }) 
LOCALIDAD

with engine.begin() as conn:
    LOCALIDAD.to_sql(
        name='LOCALIDAD_1', # nombre de la tabla
        con=conn,
        index=False # para que no guarde el indice
    )

# y así sucesivamente con las restantes tablas

#si va a Workbench y actualiza, aparecerán la stabals en la base

# tener en cuenta que tablas como la de OPERACIONES (o transacciones) no debo tomar valores únicos de la variables, 
# sino directamente es la variable completa 

#Luego, para definir el PK, FK volver a script sql, ver paso 3

#Con las tabla creadas en la base puede o trabajar difectamente en Workbench con queries SQL

# o hacer queries con Python (de una tabla como en el ejemplo a continuación o de muchas para un dataframe completo)

# pip install mysql-connector-python
import mysql.connector

cnx = mysql.connector.connect(
    host="localhost", #por default
    port=3306, #por default
    user="root", #por default
    password="PASSWORD") #ingresar su password de conexión de Workbench

cur = cnx.cursor()
#crear cualquier query sobre una tabla o muchas, etc
#Por ejemplo
cliente=cur.execute(''' select * 
                        from bank.provincia''') #tener en cuenta anteponer el nombre del schema o base
tabla=cur.fetchall()
print(tabla)

#se crea DataFrame 

DATA_PROV=pd.DataFrame(tabla,columns=['ID_PROVINCIA','PROVINCIA'])
DATA_PROV

#cerrar el cursor
cur.close()

# Finalizar conexión
cnx.close()

#Continuar trabajando con el DataFrame en Python
DATA_PROV

