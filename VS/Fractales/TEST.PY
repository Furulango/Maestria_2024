
a = 16
tol = 0.000001
x = a / 2


if (a > 0):
    while True:
        y = (x + a / x) / 2
        e = abs((y - x) / y)
        x = y
        if e < tol:
            break

    raiz_cuadrada = x
else: 
    raiz_cuadrada = 0

print(raiz_cuadrada)
