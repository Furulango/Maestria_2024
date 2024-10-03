import numpy as np
import matplotlib.pyplot as plt
import control as ctl

# Función para recibir la función de transferencia del usuario
def obtener_funcion_transferencia():
    print("Ingrese los coeficientes del numerador separados por comas:")
    num = [float(x) for x in input().split(',')]
    
    print("Ingrese los coeficientes del denominador separados por comas:")
    den = [float(x) for x in input().split(',')]
    
    return ctl.TransferFunction(num, den)

# Función para graficar el diagrama de Bode y obtener márgenes
def graficar_bode_y_margenes(tf):
    # Obtener el margen de ganancia y fase
    gm, pm, wg, wp = ctl.margin(tf)
    
    # Mostrar los márgenes
    print(f"Margen de ganancia: {gm} dB")
    print(f"Margen de fase: {pm} grados")
    print(f"Frecuencia de margen de ganancia: {wg} rad/s")
    print(f"Frecuencia de margen de fase: {wp} rad/s")
    
    # Graficar el diagrama de Bode
    mag, phase, omega = ctl.bode(tf, dB=True)
    
    plt.tight_layout()
    plt.show()

# Función para graficar la respuesta al escalón
def graficar_respuesta_escalon(tf):
    t, y = ctl.step_response(tf)
    
    plt.figure()
    plt.plot(t, y)
    plt.title("Respuesta al Escalón")
    plt.xlabel("Tiempo (s)")
    plt.ylabel("Amplitud")
    plt.grid(True)
    plt.show()

if __name__ == "__main__":
    
    # Obtener la función de transferencia del usuario
    planta = obtener_funcion_transferencia()
    
    # Graficar el diagrama de Bode y márgenes
    graficar_bode_y_margenes(planta)
    
    # Graficar la respuesta al escalón
    graficar_respuesta_escalon(planta)
