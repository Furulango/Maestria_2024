import numpy as np

def metodo_potencia(A, x, tol=1e-5, max_iter=1000):
    x = x / np.linalg.norm(x)
    for _ in range(max_iter):
        x_nuevo = np.dot(A, x)
        x_nuevo = x_nuevo / np.linalg.norm(x_nuevo)
        if np.linalg.norm(x_nuevo - x) < tol:
            break
        x = x_nuevo
    eigenvalor = np.dot(x.T, np.dot(A, x)) / np.dot(x.T, x)
    return eigenvalor, x

A = np.array([[4, 2, 1],
              [2, 3, 1],
              [1, 1, 2]])

x_inicial = np.random.rand(3)
eigenvalor, eigenvector = metodo_potencia(A, x_inicial)

print("Eigenvalor:", eigenvalor)
print("Eigenvector:", eigenvector)
