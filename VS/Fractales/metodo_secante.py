
def secante(f, a, b, Es=1e-6, max_iter=100):
    iteraciones = []
    
    for _ in range(max_iter):
        f_a = f(a)
        f_b = f(b)
        
        if f_b - f_a == 0:
            return None
        
        x = b - f_b * (b - a) / (f_b - f_a)
        f_x = f(x)
        
        Ea = abs(x - b)
        
        iteraciones.append((a, b, x))
        
        print(f"Iteración {_+1}: a = {a:.6f}, b = {b:.6f},x = {x:.6f}, f(x) = {f_x:.6f}, Ea = {Ea:.6f}")
        if abs(f_x) < Es:
            return x
        if Ea <= Es:
            return x
        a, b = b, x
    
    return x

def funcion(x):
    return x**2 +2*x- 2

a = 1.0
b = 0.0

raiz = secante(funcion, a, b)
if raiz is not None:
    print(f"Raiz: {raiz:.6f}")
