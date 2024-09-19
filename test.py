import numpy as np
import matplotlib.pyplot as plt

P = 1000 #1Fuerza P kN
E = 69e9 #Modulo de elasticidad 69 GPa 
I = 5.21e-7 #Momento Inercia 10x5 cm
L = 2 #2 Nts longitud

def f(x):
    return (P / (E * I)) * ((L * x**2) / 2 - (x**3) / 6)

x_vals = np.linspace(0, L, 500)

y_vals = f(x_vals)

plt.plot(x_vals, y_vals, label=r"$\frac{P}{EI}\left[\frac{Lx^2}{2} - \frac{x^3}{6}\right]$")
plt.title("v(x)")
plt.xlabel("x")
plt.ylabel("f(x)")
plt.grid(True)
plt.legend()
plt.show()
