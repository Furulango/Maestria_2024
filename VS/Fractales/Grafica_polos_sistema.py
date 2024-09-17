import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import lti

# Coeficientes del numerador y denominador del sistema
numerador = [1]
denominador = [1, 2*0.1*1, 1] 

# Crear la función de transferencia
sistema = lti(numerador, denominador)

# Polos y ceros del sistema
poles = sistema.poles
zeros = sistema.zeros

# Grafica
plt.figure()
plt.scatter(np.real(poles), np.imag(poles), marker='x', color='r', label='Polos')
plt.scatter(np.real(zeros), np.imag(zeros), marker='o', color='b', label='Ceros')
plt.title('Diagrama de Polos y Ceros')
plt.xlabel('Parte Real')
plt.ylabel('Parte Imaginaria')
plt.axhline(0, color='black',linewidth=0.5)
plt.axvline(0, color='black',linewidth=0.5)
plt.grid(True, which='both')
plt.legend()
plt.show()
