from logging import root
from tkinter import ttk ## desde tkinter importamos la clase ttk
from tkinter import *   ## pip install tk
import tkinter as TK
from conexion import *  ## importando el archivo de configuracion de la base de datos
import matplotlib.pyplot as plt ## pip install matplotlib ## Libreria para el grafico

import numpy as np

class Ventana():

    datamart = Conexion() ## Definimos una variable que contendra la clase de Conexion

    def __init__(self,master=None): ## definimos la funcion init para llamar a las funciones distintas de la ventana
        self.master = master
        self.crear_widgets()
        self.llenarComboBox()
        
    
    def crear_widgets(self): ## definimos la funcion para crear los widgets para la ventana
        # Renderiza la imagen
        img = TK.PhotoImage(file='RubenDario.png')
        new_img = img.subsample(1,1)
        # Coloca la imagen renderizada en el label dentro de la ventana
        Lblimg = Label( background="#FFFFFF", image= new_img)
        # 
        Lblimg.image = new_img
        Lblimg.pack()
        # Creando LABEL de la pantalla principal
        self.lblUnidad = Label(foreground="black", background="#FFFFFF", text="Unidad Educativa 'Ruben Dario'",
        font='Arial 18 bold').pack(anchor=CENTER,padx=5,pady=5)
        self.lblRepor = Label(foreground="black", background="#FFFFFF", text="Reporte de deserción de curso",
        font='Arial 16').pack(anchor=CENTER,padx=5,pady=5)
        self.lblPeriodo = Label(foreground="black", background="#FFFFFF", text="Periodo:",
        font='Arial 12 bold').pack(anchor=CENTER,padx=5,pady=5)
    
    def llenarComboBox(self): ## Definimos la funcion para llenar el combo box que aparecera con los distintos periodos
        # Creacion del combobox
        self.combo = ttk.Combobox(values=self.datamart.mostrarDatos(), state="readonly", justify="center" , width="10")
        self.combo.pack()
        self.combo.current(1)
        btnImprimir = ttk.Button(text="Buscar", command = self.grafico)
        btnImprimir.pack(padx=5, pady=10)

    def grafico(self):
        self.res = self.datamart.datosSumaGrafico(self.combo.get()) ##Obtenemos el resultado de la consulta segun el periodo

        self.label = self.datamart.datosLabelGrafico(self.combo.get()) ##Obtenemos el resultado de la consulta segun el periodo
        self.total = self.datamart.totalDesercion(self.combo.get())

        self.y = np.array(self.res)
        plt.pie(self.y, labels= self.y, startangle = 60, labeldistance=0.6) ##Le pasamos lo valores de la consulta para el label y el data del grafico
        plt.title("Deserción de curso por motivo de cambio de colegio", )
        plt.legend(self.label)
        plt.show() ##Mostramos el grafico

        
