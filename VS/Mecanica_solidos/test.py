import sympy as sp

P, E, A_1, A_2,L, x = sp.symbols('P E A_1 A_2 L x')

integrand = (P**2)/(2*A_2*E)

U = sp.integrate(integrand, (x, 0.75*L, L))

U_simplified = U.simplify()

sp.pprint(U_simplified)

#valores = [(T, ), (J, ), (G, ), (L, )]
#valores_dict =dict(valores)

