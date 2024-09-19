import numpy as np

matriz = np.array([[0,11,-5],
                   [-2,17,-7],
                   [-4, 26, -10]])

eigenvalores, eigenvectores = np.linalg.eig(matriz)

print("Eigenvalores de la matriz:")
print(eigenvalores)
