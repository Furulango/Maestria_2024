

def f(x):
    return -0.5*x**2 +2.5*x + 4.5  

tol = 0.000001  
a = -2  
b = 0  

while (abs(b-a)/abs(b+a)) > tol:
    x = (a + b) / 2

    if f(a) * f(x) > 0:
        a = x
    elif f(a) * f(x) < 0:
        b = x
    else:  
        r = x
        break

r = (a + b) / 2
print(r)

