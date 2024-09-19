import numpy as np

def metodo_potencia_inversa(A, x, tol=1e-5, max_iter=1000):
    x = x / np.linalg.norm(x)
    iter_count = 0
    
    A_inv = np.linalg.inv(A)
    
    while iter_count < max_iter:
        x_nuevo = np.dot(A_inv, x)
        x_nuevo = x_nuevo / np.linalg.norm(x_nuevo)
        
        error_relativo = np.linalg.norm(x_nuevo - x) / np.linalg.norm(x_nuevo)

        if error_relativo < tol:
            break
        
        x = x_nuevo
        iter_count += 1
    
    eigenvalor_inverso = np.dot(A_inv, x) / x
    eigenvalor = 1 / np.max(eigenvalor_inverso)
    
    return eigenvalor, x

A = np.array([[0, 11, -5],
              [-2, 17, -7],
              [-4, 26, -10]])

x_inicial = np.random.rand(3)

eigenvalor, eigenvector = metodo_potencia_inversa(A, x_inicial)

print("Eigenvalor:", eigenvalor)
