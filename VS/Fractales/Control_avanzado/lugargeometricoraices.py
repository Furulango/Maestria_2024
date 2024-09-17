import control as ctl
import matplotlib.pyplot as plt

# Definir los parámetros del sistema
numerador = [20]          # Numerador de la función de transferencia
denominador = [1,12,44,48]     # Denominador de la función de transferencia

# Crear la función de transferencia
G = ctl.TransferFunction(numerador, denominador)

# Diseñar un controlador PID
Kp = 140# Ganancia proporcional
Ki = 0 # Ganancia integral
Kd = 2 # Ganancia derivativa

# Crear el controlador PID usando la representación s
C = ctl.TransferFunction([Kd, Kp, Ki], [1, 0])

# Sistema en lazo abierto (sin realimentación)
G_open = ctl.series(C, G)

# Sistema en lazo cerrado (con realimentación unitaria)
G_closed = ctl.feedback(G_open)

# Crear una figura con subplots horizontales
fig, axs = plt.subplots(1, 2, figsize=(16, 6))

# Graficar el lugar geométrico de las raíces en el primer subplot
ctl.rlocus(G_closed, ax=axs[0])
axs[0].set_title('LGR del Sistema en Lazo Cerrado con Controlador ')
axs[0].grid(True)

# Respuesta a una entrada escalón en el segundo subplot
t, y = ctl.step_response(G_closed)
axs[1].plot(t, y)
axs[1].set_title('Respuesta al Escalón del Sistema en Lazo Cerrado con Controlador ')
axs[1].set_xlabel('Tiempo (s)')
axs[1].set_ylabel('Amplitud')
axs[1].grid(True)

# Mostrar la figura completa
plt.tight_layout()
plt.show()
