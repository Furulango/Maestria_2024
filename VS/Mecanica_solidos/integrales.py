import sympy as sp

x, L, A, P_o, γ, E = sp.symbols('x L A P_o γ E')

integrand = ((γ * A * (L - x) + P_o)**2) / (2 * A * E)

U = sp.integrate(integrand, (x, 0, L))

U_simplified = U.simplify()

sp.pprint(U_simplified)
