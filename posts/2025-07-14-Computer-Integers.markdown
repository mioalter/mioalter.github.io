---
title: Computer Integers and this One Neat Trick
---
\newcommand{\Z}{\mathbb Z}

The presentation of computer integers in Bryant and O'Halloran (Chapter 2)
includes the statement

> _**Principle**_: bit-level equivalence of unsigned and two-complement multiplication

which means: if we start with two bit vectors and,
on the one hand multiply the corresponding two's complement values,
on  the other multiply the corresponding unsigned values,
then the bit-level representations of those two products are the same.

This is wildly unsatisfying—to me as a mathematician, but really to any algebraically-minded
person—because this property should just fall out for free if we take a little
more care in how we set up the arithemtic of computer integers in the first place.

So let's do that.

# Arithmetic of Computer Integers

To define the arithemtic of $w$-bit computer integers, we have three sets

* $U_w$ the set of $w$-bit unsigned integers
* $T_w$ the set of $w$-bit two's-complement integers
* $B_w$ the set of bit vectors of size $w$

and three bijections (invertible transformations) of sets

* $u: B_w \to U_w$ which maps a bit vector to its corresponding unsigned value
* $t: B_w \to T_w$ which maps a bit vector to its corresponding two's-complement value
* $h: T_w \to U_w$ which maps a two's-complement value to its corresponding unsigned
value, that is, to the unsigned value represented by the same bit vector as the original value.

Since these are bijections, each has an inverse function
and we can write an explicit formula for $h$ interms of the others

> $h := u \circ t^{-1}$

These functions have more descriptive names in Bryant and O'Halloran e.g. $u$ is
called $B2U$ because it maps bit vectors to unsigned integers and $u^{-1}$ is called
$U2B$ because it goes the other way. This naming convention will make our eyes bleed
once we start writing equations so let's stick with these shorter, if less descriptive,
names.

If $x,y \in B_w$ are bit vectors, we can state the
_Principle of the Bit-Level Equivalence of Unsigned and Two's-Complement Multiplication_
as the equation

> $t^{-1}(t(x)t(y)) = u^{-1}(u(x)u(y))$

That is: if we start with two bit vectors, multiply the corresponding
two's-complement integers and multiply the corresponding unsigned integers,
then the bit-vector representations of the results are equal.

We can draw the following diagram:

**DIAGRAM**

An extremely important point is

> _**Observation**_: this diagram commutes.

Meaning: if we choose any starting point and any ending point in this diagram
and find two different ways of getting from the starting point to the ending point,
then the sequences of transformations corresponding to those two paths are equal.

This is true by construction: we defined $h$ to be $u \circ t^{-1}$.

For example, if $b \in B_w$ (read: "b is an element of $B_w$"),
then $h(t(b)) = u(b)$. Why? Exactly because we defined $h$ to be $u \circ t^{-1}$
so $h\circ t = u \circ t^{-1} \circ t = u$.

So the statement "this diagram commutes" implies $h \circ t = u$
and similarly for all other pairs of transformations that start and end in the same places.

Pretty neat. So there is a commutative digram and some diagrammatic reasoning
right there in the first week of intro to CS.

Next, to define the _arithemtic_ of computer integers,
we first define addition and multiplication in $U_w$,
roughly, as arithmetic mod $2^w$, then define arithmetic in $T_w$
_in terms of arithmetic in $U_w$_.

Explicitly, for $x,y \in T_w$, we define

* $x + y := h^{-1}(h(x) + h(y))$
* $xy := h^{-1}(h(x)h(y))$

that is: to add or multiply in $T_w$, we send stuff to $U_w$, add or multilpy there,
then send the result back.

The next extremely important point is:

> _**Observation**_: with this definition of arithmetic in $T_w$, $h$ is a _homomorphism_.

When we define arithmetic in $U_w$, we are defining the structure of a commutative ring
on $U_w$; when we define arithmetic in $T_w$, we are defining the structure of a
commutative ring in $T_w$. Defining the ring structure on $T_w$ in terms of
our ring structure on $U_w$ using $h$ (and $h^{-1})$ makes $h$ into a homomorphism
(in fact, an isomorphism) of commutative rings.

Explicitly, for $x, y\in T_w$, we have

* $h(x + y) = h(x) + h(y)$
* $h(xy) = h(x)h(y)$

Why? Well $x + y = h^{-1}(h(x) + h(y))$ by definition so, applying $h$ to both sides
(and using that $h\circ h^{-1} = id$), we have

> $h(x + y) = h (h^{-1}(h(x) + h(y))) = h(x) + h(y)$

and similarly for multiplication.

# Proving the Principle

This is enough to prove our _Principle of the Bit-Level Equivalence of Multiplication_.
The point of all of this is that we don't need to actually _do_ arithmetic in $U_w$ or $T_w$,
to prove this, we just have to know that our diagram commutes and that,
with the ring structures as we have defined them, $h$ is a ring homomorphism.

Behold: if $x,y \in B_w$ are bit vectors, recall that we want to show that

> $t^{-1}(t(x)t(y)) = u^{-1}(u(x)u(y))$

Let's re-write this a little by applying $u$ to both sides

> $u(t^{-1}(t(x)t(y))) = u( u^{-1}( u(x) u(y) ) )$

Now, since $u \circ t^{-1} = h$ we can write the left-hand side as

> $u(t^{-1}(t(x)t(y)) = h( t(x) t(y) )$

and since $u\circ u^{-1} = id$ we can write the right-hand side as simply

> $u(u^{-1}(u(x)u(y))) = u(x) u(y)$

We haven't done anything yet.
All we did was re-write the thing we want to show
as

> $h(t(x) t(y)) = u(x) u(y$).

All of our transformations are invertible so if we can show this, we can
do what we just did backward to show the original equation holds as well.

_This_ is where the magic happens. Ready?
What is $h(t(x)t(y))$? Well, $h$ is a _homomorphism_ so

> $h(t(x) t(y)) = h(t(x)) h(t(y))$

And what is that? Well, $h = u \circ t^{-1}$ so $h(t(x)) = u(x)$ and $h(t(y)) = u(y)$.

That's it! All together

> $h(t(x) t(y)) = h(t(x)) h(t(y)) = u(x) u(y)$

the first because $h$ is a homomorphism, the second just by the definition of $h$.

So we just proved our principle using that

* the diagram commutes ($h = u\circ t^{-1}$) and
* $h$ is a homomorphism ($h(ab) = h(a)h(b))$).

Is there a _Principle of the Bit-Level Equivalence of Addition_, too?
You bet, same idea, no need to do arithmetic in $U_w$ or $T_w$ to prove it.

# One Step Further

(pull the ring structure back to $B_w$)

# The One Neat Trick

# To Algebra and Beyond
