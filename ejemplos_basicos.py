# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np


def media_df(archivo_csv):
    """
    Esta Función toma un archivo csv y cambia -9999 por NaN
    para hacer el promedio.
    :return:
    """
    df = pd.read_csv(archivo_csv)
    print(df)
    # se reemplazan los valores -9999 con NaN
    df = df.replace(-9999, np.nan)
    print("-----------------------")
    print(df)
    print("------La Media---------")
    print(df.mean())


def manejo_archivos_txt():
    """
    Esta función muestra el manejo básico de archivos .txt
    :return:
    """
    archivo = open("archivo.txt")
    for linea in archivo:
        linea = linea.rstrip("\n")
        linea = linea.replace(".", ",")
        print(linea)

    archivo.close()

    archivo = open("archivo2.txt", "w")
    archivo.write("hola2")
    archivo.close()

if __name__ == '__main__':
    # leer numero de columnas
    df_ = pd.read_table("TRfs_min_prg_2.asc")
    numero_columnas = df_.columns
    ncols = int(numero_columnas[0].split()[1])
    df = pd.read_table("TRfs_min_prg_2.asc", sep=' ', names=range(ncols))
    df = df.drop(df.index[[0, 1, 2, 3, 4, 5]])
    # pasar las columnas de str a float
    for i in range(ncols):
        df[i] = df[i].astype(float)
    print(df)
