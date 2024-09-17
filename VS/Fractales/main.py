
import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import lti, step, lsim

# Definir parámetros del sistema de segundo orden
zeta = 0.1 # Factor de amortiguamiento
wn = 1  # Frecuencia natural no amortiguada (puedes ajustarla si es necesario)

# Coeficientes del numerador y denominador
numerador = [wn**2, 0]
denominador = [1, 2*zeta*wn, wn**2]

# Crear la función de transferencia
sistema = lti(numerador, denominador)

# Calcular la constante de tiempo T
T = 1 / (zeta * wn)

# Definir el tiempo para la simulación hasta 3T
t = np.linspace(0, 3*T, 1000)

# Entrada tipo escalón
t_step, y_step = step(sistema, T=t)

# Entrada tipo rampa
u_ramp = t
t_ramp, y_ramp, _ = lsim(sistema, U=u_ramp, T=t)

# Graficar la respuesta al escalón
plt.figure()
plt.plot(t_step, y_step, label='Entrada Escalón')
plt.title('Respuesta a la Entrada Escalón (hasta 3T)')
plt.xlabel('Tiempo (s)')
plt.ylabel('Amplitud')
plt.grid(True)
plt.legend()

# Graficar la respuesta a la rampa
plt.figure()
plt.plot(t_ramp, y_ramp, label='Entrada Rampa')
plt.title('Respuesta a la Entrada Rampa (hasta 3T)')
plt.xlabel('Tiempo (s)')
plt.ylabel('Amplitud')
plt.grid(True)
plt.legend()

plt.show()

