from tkinter import * ## pip install tk
from Ventana import * ## importacion del archivo de la ventana que se va a crear
import conexion as cn ## importando el archivo de configuracion de la base de datos

def main(): ## Definimos la funcion main que creara la ventana a mostrar cons sus dimensiones e icono 
    root = Tk()
    #Redimenciona la ventana(form) y la centra ----INICIO
    ancho_ventana = 900
    alto_ventana = 400
    x_ventana = root.winfo_screenwidth() // 2 - ancho_ventana // 2
    y_ventana = root.winfo_screenheight() // 2 - alto_ventana // 2
    #Posiciona la ventana en el centro
    posicion = str(ancho_ventana) + "x" + str(alto_ventana) + "+" + str(x_ventana) + "+" + str(y_ventana)
    #da un color de fondo a la ventana
    root.config(background="#FFFFFF")
    #Establece las dimensiones
    root.geometry(posicion)
    #configura el tamaño de la ventana del marco redimensionable
    root.resizable(0,0)
    #-------------------------------------------------FIN
    # Coloca un icono para la ventana en la barra de cerrar, minimizar y maximizar 
    root.iconbitmap("descarga.ico")
    # inserta un titulo para la ventana
    root.title("Deserción de curso por motivo de cambio de colegio")
    # le pasa el parametro de root que es la ventana
    Ventana(root)
    # Muestra la ventana
    root.mainloop()

if __name__ == "__main__":
    main()

