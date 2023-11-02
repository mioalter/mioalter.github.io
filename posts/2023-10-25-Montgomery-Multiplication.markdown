---
title: Montgomery multplication
---
\newcommand{\bb}{\mathbb}
\newcommand{\Z}{\mathbb Z}
\newcommand{\M}{\mathbb M}
\newcommand{\SQ}{\mathbb S \mathbb Q}

Montgomery multiplication is a fast way to compute products in [modular arithmetic][MA].
In general, reducing an integer mod $N$ requires division which is expensive
because it uses the division algorithm.
Montgomery multiplication replaces division by shifting bits which is much faster.
There are many good references that explain the intuition and core algorithm,
but none that do the algebra much justice. This post aims to do that.
This assumes basic familiarity with abstract algebra—groups, rings, and homomorphisms—or the desire to pick these ideas up along the way.

There is a Scala implementation below and there are references at the end.

Throughout: let N be a positive odd integer and let $R = 2^r$ be a positive integer power of $2$.

### Rings of integers mod $N$

The integers mod $N$ form a [ring][RING],
the [quotient ring][SQR] $\Z/N\Z$ whose elements are [equivalence classes][EQC]
$[a],[b],[c]$ of integers mod $N$, addition is given by $[a]+[b]:=[a+b]$,
and multiplication by $[a][b]:=[ab]$.

Multiplication by $R$ defines a function $R: \Z/N\Z \to\Z/N\Z$,
$R([a]) = [aR]$, which is a _group_ homomorphism:

* $R([a] + [b]) = R([a + b]) = [(a + b) R]$
* $R([a]) + R([b]) = [aR ] + [bR] = [aR + bR]$

and these are equal.

It is _not_, however, a _ring_ homomorphism:

* $R([a][b]) = R([ab]) = [abR]$
* $R([a])R([b]) = [aR][bR] = [abR^2]$

and these are not.

All is not lost! To quote [The Great Spicoli][SPICOLI]:
we can fix it.
We can define a new multiplicative structure with respect to which $R$
_is_ a ring homorphism. But we need something first.

We said that $N$ is odd and $R$ is a power of $2$ so $N$ and $R$ are
[relatively prime][COPRIME]: their greatest common divisor (GCD) is $1$.
By [Bézout's identity][BEZOUT], there exist integers $N'$ and $R'$
such that we can write $1 = NN' + RR'$.
This means that $RR'$ is $1 \mod N$
—literally [RR'] = [1] in $\Z/N\Z$—
which means that $R'$ is the multplicative inverse of $R$ in $\Z/N\Z$.
We can find $N'$ and $R'$ using the [extended Euclidean algorithm][EEA].
Having said that "there exists an $R'$", let's suppose we have found one.
That's all we need right now:
an $R'$ which is the multiplicative inverse of $R \mod N$.

Now, let's define a new multiplicative structure.
To avoid confusion, let's write $\SQ(N)$ for $\Z/N\Z$ with its standard addition
and multiplication[0].
Let's write $\M(N)$ for the _Montgomery ring_ of integers mod $N$:
$\M(N)$ has the same underlying set and additive structure, but we'll define
the product of elements $[a]$ and $[b]$ to be $[abR']$.

This trick doesn't work in genereral! But it does here[1].

With this multiplicative structure, $R:\SQ(N) \to \M(N)$
is a ring homomorphism:

* multiplying in $\SQ(N)$: $R([a][b]) = R([ab]) = [abR]$
* multiplying in $\M(N)$: $R([a])R([b]) = [aR][bR] = [abR^2R']$

and $[abR^2R'] = [abR(RR')] = [abR]$ because $[RR'] = [1]$.

Moreover, $R$ is not just a ring homomorphism, it is a ring _isomorphism_:
its inverse is given by multiplying by $R'$.

So, we have an isomorphism of rings. If we can implement multiplication
in $\M(N)$ more efficiently than multiplication in $\SQ(N)$ _and_
we can implement the transformations to and from $M(N)$ efficiently,
then we can send all the stuff we want to multiply over,
multiply it there, then send the result back
and we will have done it all more efficiently than multiplying in $\SQ(N$).


### REDC

To multiply in $\M(N)$, we have to multiply by $R'$ and reduce mod $N$.
The [REDC][REDC] algorithm, "Montgomery reduction", is a way to do both at once.
Moreover, it does them by dividing by $R$ and reducing mod $R$ rather than by $N$.
Since $R$ is a power of $2$, both division by $R$ and reduction mod $R$
can be implemented by simply shifting bits.

Let's write `redc` for a function that implements this algorithm.
We are going to use it in a few different places, so let's just say
that is has type signature `redc: Int => Int`
and be clear about what we are feeding it.

Elements of $\M(N)$ are equivalence classes $[a]$ and $[b]$ of integers mod $N$.
To multiply them in $\M(N)$, we compute $[a][b]=[abR']$ as `redc(a * b)`.
The equivalence class mod $N$ of `redc(a * b)` is $[abR']$.

To transform to $\M(N)$, we have to multiply by $R$ and reduce mod $N$.
Since `redc` is multiplication by $R'$ and reduction mod $N$,
we can implement $R:\SQ(N) \to \M(N)$
by computing $R([a]) = [aR]$ as `redc(a * R * R)`.
The equivalence class mod $N$ of `redc(a * R * R)` is
$[aR^2R'] = [aR(RR')] = [aR]$ since $[RR']=1$.

To transform back from $\M(N)$, we have to multiply by $R'$ and
reduce mod $N$ which is just `redc` again so we can implememnt
the inverse function $R':\M(N) \to \SQ(N)$
by computing $R'([a])] = [aR']$ as `redc(a)`.
The equivalence class mod $N$ of `redc(a)` is $[aR']$.

### Implementation

Here _*TODO: ADD LINK*_ is a demo Scala implementation.
It is not meant to be a high-performance anything,
but it does everything mentioned here.

Here is a brief walkthrough:

* There is a `redc` function which implements the REDC algorithm.
It is ripped straight from the pages of wikipedia.
* There are functions `divideByR` and `modR` which implement
division by $R$ and reduction mod $R$, respectively, by shifting.
* There are `SQInt` and `MInt` classes to model the elements of
$\SQ(N)$ and $\M(N)$, respectively
* The transformation to $\M(N)$ is implemented on the `SQInt` class
as `toMInt`; it uses the `redc` function.
* The transformation back from $\M(N)$ is implemented on the `MInt`
class as `toSQInt`; it also uses the `redc` function.
* There is a class `Bezout` to compute the Bézout coefficients of a
pair of integers that contains an implementation of the extended
Euclidean algorithm.

Note that, since the transformation to the Montgomery ring involves multiplying
by $R^2$, if $R$ is large e.g. close to $2^32$ or larger, it overflows.
There is a [multiprecision implementation of REDC][MPREDC]
which works in this case, but it is not implemeneted here.

### Diffie-Hellman

[Diffie-Hellman][DIFFIE HELLMAN] is a way of doing public key exchange, that is,
of securely sharing secrets in public.

[The setup is][DH CRYPTO EXPLANATION]:
choose a large (necessarily odd) prime $P$ and form the
_multiplicative group of integers mod $P$_, denoted $(\Z/P\Z)^{\times}$.
(The $\times$ superscript is for "multiplication").
The elements of this group are the equivalence classes of integers mod $P$
which have multiplicative inverses (mod $P$).
As we saw, using Bézout's identity, this means
the equivalence classes of integers $1,2,\ldots,P-1$ which are relatively prime to $P$.
Since $P$ is prime, this is all of them (though note that we excluded $0$).
So $(\Z/P\Z)^{\times}$ has elements $[1],[2],\ldots,[P-1]$.
Furthermore, this group has a [_primitive root_][PRIMITIVE ROOT]:
that is, an element $[g]$ such that every element of the group is some power of $[g]$,
i.e. every element is $[g]^k$ (which is $[g^k]$ by definition) for some $k$.

Now, for us to securely share secrets:
we agree on $P$ and choose a $[g]$,
I choose a positive integer $a$, you choose a positive $b$,
I send you $[g]^a$, and you send me $[g]^b$.
My private key is $a$ and my public key is $[g]^a$,
your private key is $b$ and your public key is $g^b$.
We can each compute our shared secret $[g]^{ab}$:
I compute it as $([g]^b)^a$ using your public key and my private key,
you compute it as $([g]^a)^b$ using my public key and your private key.
We each have to compute, on our own, $([g]^{ab})^{-1}$,
the multiplicative inverse to our shared secret.
This exists because every element of our group has an inverse,
but I don't know if there is a slick way to do it!
Having done all of this, to send you the message $[m]$,
I encrypt it by computing $[m][g]^{ab}$, send it to you, and you decrypt it
by computing $([m][g]^{ab})([g]^{ab})^{-1} = [m]([g]^{ab}([g]^{ab})^{-1}) = m$.

The point of all of this is: we have to compute large powers of things mod $P$
which involves a lot of modular multiplication.
If we can replace all of that modular multiplication in $\SQ(P)$ with
Montgomery multiplication in $\M(P)$ by transforming to $\M(P)$, multiplying there,
then transforming back, we can do it all _waaaay_ faster.

This is all very hand-wavy because I don't know much about it!
Can we compute the inverse $g^{ab}$ fast?
How often do we have to recompute these things i.e. how often do $P$, $g$, $a$, and $b$ change?

### Notes

[0] The notation $\SQ(N)$ and $\M(N)$ is not at all standard and the choice of font
is frivolous: it just felt like a let down to start with $\Z/N\Z$ and then
drop the black board bold font and start writing $SQ(N)$ and $M(N)$.
Also, $\M(N)$ clearly depends on $R$ and $R'$, too, but they are not included
in the notation.

[1] Multiplication has to be associative:
if $s,t,u$ are elements of an arbitrary ring, multiplication must satsify
$(st)u = s(tu)$.
With our definition of multiplication in $\M(N)$, we have

* $([a][b])[c] = [abR'][c] = [abR'cR']$
* $[a]([b][c]) = [a][bcR'] = [abcR'R']$

Multiplication in general need not be commutative—$st \neq ts$—but in $\Z/N\Z$ it is:
multiplication of integers is commutative so multiplication of integers
mod $N$ is commutative. This implies that $[abR'cR'] = [abcR'R']$
which means that our new definition of multiplication is associative as required.

### Thanks / More

Thanks to [Dan Pittman](https://types.pl/@pittma@tilde.zone) for turning me onto this topic!
He encountered this in the wild and [actually fixed some bugs](https://tilde.zone/@pittma/111269760709591730).

If this algebra stuff seems cool / useful and you don't already know it

* You can find copies of [Dummit and Foote](https://www.amazon.com/Abstract-Algebra-3rd-David-Dummit/dp/0471433349)
floating around the internet.
* [Harvard's entire Abstract Algebra course](https://www.youtube.com/playlist?list=PLzVTusWerVcIzewg9dQxOKl9_62kTgOgI),
taught by Benedict Gross, is free on the internet, too.
* That course uses Artin's Algebra book which you can also find copies of on the internet.

### References

* [Montgomery Multiplication][MONTY] on Wikipedia
* [This blog post](https://codeforces.com/blog/entry/103374): I find this a bit terse
and confusing, but it is one of the things I read.
* [Montgomery's original paper][OGMONTY]

[COPRIME]: https://en.wikipedia.org/wiki/Coprime_integers
[BEZOUT]: https://en.wikipedia.org/wiki/B%C3%A9zout%27s_identity
[DIFFIE HELLMAN]: https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange
[DH CRYPTO EXPLANATION]: https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange#Cryptographic_explanation
[EEA]: https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm
[EQC]: https://en.wikipedia.org/wiki/Equivalence_relation#Related_important_definitions
[MA]: https://en.wikipedia.org/wiki/Modular_arithmetic
[MONTY]: https://en.wikipedia.org/wiki/Montgomery_modular_multiplication
[MPREDC]: https://en.wikipedia.org/wiki/Montgomery_modular_multiplication#Montgomery_arithmetic_on_multiprecision_integers
[OGMONTY]: https://www.ams.org/journals/mcom/1985-44-170/S0025-5718-1985-0777282-X/S0025-5718-1985-0777282-X.pdf
[PRIMITIVE ROOT]: https://en.wikipedia.org/wiki/Primitive_root_modulo_n
[REDC]: https://en.wikipedia.org/wiki/Montgomery_modular_multiplication#The_REDC_algorithm
[RING]: https://en.wikipedia.org/wiki/Ring_(mathematics)
[SPICOLI]: https://www.youtube.com/watch?v=Y1En6FKd5Pk
[SQR]: https://en.wikipedia.org/wiki/Montgomery_modular_multiplication#Modular_arithmetic
