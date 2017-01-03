# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np


def media_df(archivo_csv):
    """
    Esta Función toma un archivo csv y cambia -9999 por NaN
    para hacer el promedio.
    :return:
    """
    df1 = pd.read_csv(archivo_csv)
    print(df1)
    # se reemplazan los valores -9999 con NaN
    df1 = df1.replace(-9999, np.nan)
    print("-----------------------")
    print(df1)
    print("------La Media---------")
    print(df1.mean())


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


def menores_uno(_df, n):
    valores = []
    cont = 0
    for c in range(n):
        valores.extend(_df[c].values)
    for j in valores:
        if j < 1.0 and not(np.isnan(j)):
            cont += 1
    return cont

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

    df = df.replace(-9999, np.nan)
    minimo = min(df.min())
    promedio = np.mean(df.mean())

    # uso la función de menores que uno
    menores = menores_uno(df, ncols)
    print("Menores que 1: ", menores)
    total = sum(df.count())
    print("Total: ", sum(df.count()))
    # celdas que fallan porcentaje de area que falla
    porcentaje = menores/total
    print("Porcentaje de celdas que fallan: ", porcentaje)
