import numpy as np
import sympy as sp

def polinomio_caracteristico(matriz):
    lambda_ = sp.symbols('lambda')

    matriz_sym = sp.Matrix(matriz)

    identidad = sp.eye(matriz_sym.shape[0])
    polinomio = (matriz_sym - lambda_ * identidad).det()

    polinomio_expandido = sp.expand(polinomio)

    return polinomio_expandido

matriz = np.array([[3, -1, 0],
                   [-1, 2, -1],
                   [0, -1, 3]])

polinomio = polinomio_caracteristico(matriz)

print("Polinomio característico expandido:")
print(polinomio)
