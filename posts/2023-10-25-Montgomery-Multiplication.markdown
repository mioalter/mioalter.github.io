---
title: Montgomery multplication
---
\newcommand{\bb}{\mathbb}
\newcommand{\Z}{\mathbb Z}

Montgomery multiplication is a fast way to compute products in [modular arithmetic][MA].
In general, reducing an integer mod $N$ requires division which is expensive
because it requires the division algorithm.
Montgomery multiplication replaces division by shifting bits which is much faster.
There are many good references that explain the intuition and core algorithm,
but none that do the algebra much justice. This post aims to do that.
This assumes basic familiarity with abstract algebra—groups, rings, and homomorphisms—or the desire to pick these ideas up along the way.

# Rings of integers mod $N$

Let N be an odd number and let $R = 2^r$ be a power of $2$.

The integers mod $N$ form a [ring][RING], the [standard quotient ring][SQR]
$\Z/N\Z$.
Multiplication by $R$ defines a function $R: \Z/N\Z \to\Z/N\Z$,
$R([a]) = [aR]$, which is a _group_ homomorphism:

* $R([a] + [b]) = R([a + b]) = [(a + b) R]$
* $R([a]) + R([b]) = [aR ] + [bR] = [aR + bR]$

and these are equal. It is _not_, however, a _ring_ homomorphism:

* $R([a][b]) = R([ab]) = [abR]$
* $R([a])R([b]) = [aR][bR] = [abR^2]$

and these are not.

All is not lost! To quote the [great Jeff Spicoli][SPICOLI]:
we can fix it.
We can define a new multiplicative structure with respect to which $R$
_is_ a ring homorphism.

But we need something first.
We said that $N$ is odd and $R$ is a power of $2$ so $N$ and $R$ are
[relatively prime][COPRIME]: their greatest common divisor (GCD) is $1$.
By [Bézout's identity][BEZOUT], there exist integers $N'$ and $R'$
such that we can write $1 = NN' + RR'$.
This means that $RR'$ is $1 \mod N$
—literally [RR'] = [1] in $\Z/N\Z$—
which means that $R'$ is the multplicative inverse of $R$ in $\Z/N\Z$.
We can find $N'$ and $R'$ using the [extended Euclidean algorithm][EEA].
That's all we need right now: to know there exists an $R'$
which is the multiplicative inverse of $R \mod N$.

Now, let's define a new multiplicative structure.
Let's write $S Q(N)$ for $\Z/N\Z$ with its standard addition and multiplication.
Let's write $M(N)$ for the _Montgomery ring_ of integers mod $N$:
$M(N)$ has the same underlying set and additive structure, but we'll define
the product of elements $[a]$ and $[b]$ to be $[abR']$.
With this multiplicative structure, $R:SQ(N) \to M(N)$
is a ring homomorphism:

* multiplying in $SQ(N)$: $R([a][b]) = R([ab]) = [abR]$
* multiplying in $M(N)$: $R([a])R([b]) = [aR][bR] = [abR^2R']$

and $[abR^2R'] = [abR(RR')] = [abR]$ because $[RR'] = [1]$.

Moreover, $R$ is not just a ring homomorphism, it is a ring _isomorphism_:
its inverse is given by multiplying by $R'$.

So, we have an isomorphism of rings. If we can implement multiplication
in $M(N)$ more efficiently than multiplication in $SQ(N)$ _and_
we can implement the transformations to and from $M(N)$ efficiently,
then we can send all the stuff we want to multiply over,
multiply it there, then send the result back
and we will have done it all more efficiently than multiplying in $SQ(N$).

# REDC




[COPRIME]: https://en.wikipedia.org/wiki/Coprime_integers
[BEZOUT]: https://en.wikipedia.org/wiki/B%C3%A9zout%27s_identity
[EEA]: https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm
[MA]: https://en.wikipedia.org/wiki/Modular_arithmetic
[RING]: https://en.wikipedia.org/wiki/Ring_(mathematics)
[SPICOLI]: https://www.youtube.com/watch?v=Y1En6FKd5Pk
[SQR]: https://en.wikipedia.org/wiki/Montgomery_modular_multiplication#Modular_arithmetic
