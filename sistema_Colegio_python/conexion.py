import mysql.connector ## pip instalar mysql-conector-python
import re

## Declaramos las variables para la conexion
ht = "localhost"
usuario="root"
contrasenia="mysql123"
nombreBD="datamartcolegio"
puerto="3306"

class Conexion: ## creamos una clase

    def __init__(self): ## definimos la funcion init que contendra la variable de conexion con sus datos de la BD
        self.conexion = mysql.connector.connect(host=ht, user=usuario, passwd=contrasenia,
        database=nombreBD, port=puerto)

    def mostrarDatos(self): ## definimos una funcion para mostrar los datos que contendra el query a consultar
        cur = self.conexion.cursor()
        cur.execute("SELECT nombre_periodo FROM datamartcolegio.dim_periodo;")
        datos = cur.fetchall()
        cur.close
        return datos

    def datosSumaGrafico(self, fecha):
        cur = self.conexion.cursor()
        cur.execute("SELECT suma_desercion AS Suma FROM dim_curso INNER JOIN hec_desercioncurso hec_desercioncurso ON dim_curso.id = hec_desercioncurso.id_curso INNER JOIN dim_motivo dim_motivo ON hec_desercioncurso.id_motivo = dim_motivo.id INNER JOIN dim_periodo dim_periodo ON hec_desercioncurso.id_periodo = dim_periodo.id INNER JOIN dim_profesor dim_profesor ON hec_desercioncurso.id_profesor = dim_profesor.id WHERE dim_periodo.nombre_periodo = '" + fecha +"'")
        resultado = cur.fetchall()
        consulta = [] ## Instanciamos el array para poder guardar los resultados de la query en el arreglo
        for d1 in resultado:  ##recorremos el resultado de la consulta y lo agregamos en el array
            consulta.append(d1[0])
        cur.close
        return consulta

    def datosLabelGrafico(self, fecha):
        cur = self.conexion.cursor()
        cur.execute("SELECT dim_curso.nivel AS Curso, dim_curso.paralelo AS Paralelo FROM dim_curso INNER JOIN hec_desercioncurso hec_desercioncurso ON dim_curso.id = hec_desercioncurso.id_curso INNER JOIN dim_motivo dim_motivo ON hec_desercioncurso.id_motivo = dim_motivo.id INNER JOIN dim_periodo dim_periodo ON hec_desercioncurso.id_periodo = dim_periodo.id INNER JOIN dim_profesor dim_profesor ON hec_desercioncurso.id_profesor = dim_profesor.id WHERE dim_periodo.nombre_periodo = '" + fecha +"'")
        label = cur.fetchall()
        resultado = [] ## Instanciamos el array para poder guardar los resultados de la query en el arreglo
        for x in label:  ##recorremos el resultado de la consulta y lo agregamos en el array
            resultado.append(x[0] + ' "' + x[1] + '"') ## concatenamos la columna 0 del query sql con la columna 1 y los agregamos en el array
        cur.close
        return resultado

    def totalDesercion(self, fecha):
        cur = self.conexion.cursor()
        cur.execute("SELECT SUM(hec_desercioncurso.suma_desercion) AS Total FROM dim_curso INNER JOIN hec_desercioncurso hec_desercioncurso ON dim_curso.id = hec_desercioncurso.id_curso INNER JOIN dim_motivo dim_motivo ON hec_desercioncurso.id_motivo = dim_motivo.id INNER JOIN dim_periodo dim_periodo ON hec_desercioncurso.id_periodo = dim_periodo.id INNER JOIN dim_profesor dim_profesor ON hec_desercioncurso.id_profesor = dim_profesor.id WHERE dim_periodo.nombre_periodo = '" + fecha +"'")
        query = cur.fetchall()
        for x in query:  ##recorremos el resultado de la consulta y lo agregamos en el array
            Total = x[0] ## concatenamos la columna 0 del query sql con la columna 1 y los agregamos en el array
        cur.close
        print(Total)
        return Total