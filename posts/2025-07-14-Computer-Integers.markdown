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

# Unsigned and Two's-Complement Integers

To define the arithemtic of $w$-bit computer integers, we have three sets

* $U_w = \{0, 1, 2, \ldots, 2^w - 1\}$, the set of unsigned $w$-bit integers
* $T_w = \{-2^{w-1}, \ldots, -1, 0, 1,\ldots, 2^{w-1}-1\}$, the set of $w$-bit two's-complement integers
* $B_w$ the set of bit vectors of size $w$

and three bijections (invertible transformations) of sets

* $u: B_w \to U_w$ which maps a bit vector to its corresponding unsigned value
* $t: B_w \to T_w$ which maps a bit vector to its corresponding two's-complement value
* $h: T_w \to U_w$ which maps a two's-complement value to its corresponding unsigned
value, that is, to the unsigned value represented by the same bit vector as the original value.

Since these are bijections, each has an inverse function;
we can write $h$ in terms of the others

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

# Arithmetic of Unsigned and Two's-Complement Integers

Next, to define the arithemtic of computer integers,
we first define addition and multiplication in $U_w$,
roughly, as arithmetic mod $2^w$, then define arithmetic in $T_w$
_in terms of arithmetic in $U_w$_.

Explicitly, for $x,y \in T_w$, we define

* $x + y := h^{-1}(h(x) + h(y))$
* $xy := h^{-1}(h(x)h(y))$

that is: to add or multiply in $T_w$, we send stuff to $U_w$, add or multilpy there,
then send the result back.

Notice that defining operations this way on $T_w$ does not depend in any way on the
implementation details of our operations on $U_w$, we can do it simply because
we have this bijection $h$.

It turns out this is an extremely general and useful trick.

# The One Neat Trick

When we define arithmetic on $U_w$, we are defining the structure of a
commutative ring on $U_w$. When we define arithmetic on $T_w$ in terms of
arithmetic on $U_w$ via $h$, we are _pulling back_ that ring structure.

The general statement is

> _**Neat Trick**_: given a set $S$, a ring $R$, and a bijection $f: S\to R$,
> defining addition and multipliaction on $S$ by
>
> * $x + y = f^{-1}(f(x) + f(y))$
> * $xy = f^{-1}(f(x)f(y))$
>
> makes $S$ into a ring and $f$ into a homomorphism (in fact, an isomorphism) of rings.


The crucial point here is, not only do we get a ring structure on $S$, but
doing it in this way, in terms of $f$, _makes $f$ into a homomorphism_, that is,
for $x, y$ in $S$,

* $f(x + y) = f(x) + f(y)$
* $f(xy) = f(x)f(y)$

Why? We can just work it out from the definitions of operations in $S$
(remembering that $f\circ f^{-1} = id$):

> $f(x + y) = f(f^{-1}(f(x) + f(y))) = f(x) + f(y)$

and similarly for multiplication.

Going back to $U_w$, $T_w$, and $h: T_w \to U_w$:
we defined a commutative ring structure on $U_w$, we pulled that structure
back via $h$ to $T_w$ and, most importantly, according to the One Neat Trick

> _**Observation**_: $h$ is a homomorphism.

# Proving the Principle

The point of all of this is that, by appealing to the One Neat Trick,
it is very simple to prove our _Principle of the Bit-Level Equivalence of Multiplication_:
we don't need to know about the implementation details of any of our operations,
or of our transformations $u$, $t$, and $h$,
we just have to know that our diagram commutes and that $h$ is a homomorphism.

Another way to say this is: this principle follows from the _specification_ of
computer integers—we have some sets, some transformations between them,
and these transformations fit together in a certain way—not on their implementation.

If we are not satisfied with appealing to some result from algebra and want to prove
everything ourselves, we can still do that! But clearly distinguishing between
what is general algebra and what is specific to this particular problem
makes that a _whole_ lot easier.

Now, the proof.
If $x,y \in B_w$ are bit vectors, recall that we want to show that

> $t^{-1}(t(x)t(y)) = u^{-1}(u(x)u(y))$

This is an equation in $B_w$.
Let's transport it to $U_w$ by applying $u$ to both sides;
since $u$ is a bijection, if we can show the equation holds in $U_w$
we can apply $u^{-1}$ to get back our original equation in $B_w$.

Let's do this in a slightly clever way: remember that our diagram commutes so
$h\circ t = u$.
Let's apply $u$ in the form $h\circ t$ on the left and $u$ as is on the right.

Now we have

> $h(t(x)t(y)) = u(x)u(y)$

where, on the left, we used that $t\circ t^{-1} = id$ and, on the right, that $u\circ u^{-1} = id$.

Now we are in a great position. Since $h$ is a homomorphism, we know that

> $h(t(x)t(y)) = h(t(x))h(t(y))$

but $h(t(x))$ _is_ $u(x)$! And $h(t(y)) = u(y)$! So we have

> $h(t(x)(t(y)) = h(t(x))h(t(y)) = u(x) u(y)$

first using that $h$ is a homomorphism, then using that $h\circ t = u$. That's it!

So we just proved our principle using that

* the diagram commutes ($h \circ t = u$) and
* $h$ is a homomorphism ($h(ab) = h(a)h(b))$).

Is there a _Principle of the Bit-Level Equivalence of Addition_, too?
You bet, same idea, no need to do arithmetic in $U_w$ or $T_w$ to prove it.

# One Step Further

There is a glaring omission in what we have done:
if the One Neat Trick works for $T_w$, shouldn't it work for $B_w$, too?
Yes, it does!
We can _also_ pull the ring structure on $U_w$ back to $B_w$.
In so doing, $u$ _also_ becomes a homomorphism and, in fact,
so does $t$!
(Since $t = h^{-1}\circ u$ and a composition of homomorphisms is a homomorphism.)

If we do this, we can prove our principle even more directly:
for $x, y \in B_w$, we have

> $t^{-1}(t(x)t(y)) = u^{-1}(u(x)u(y))$

because $t$ and $u$ (and their inverses) are both homomorphisms so

> $t^{-1}(t(x)t(y)) = t^{-1}(t(x)) t^{-1}(t(y)) = x y$

and

> $u^{-1}(u(x) u(y)) = u^{-1}(u(x)) u^{-1}(u(y)) = x y$

so the two sides are equal because both just _are_ the product in $B_w$.

# To Algebra and Beyond

We were vague about the operations on $U_w$,
we just said they are _roughly_ arithmetic mod $2^w$.

The more precise way to say this is: there is a (commutative) ring
called [_the ring of integers mod $2^w$_][mod], written $\Z/2^w\Z$, and
the operations we define on $U_w$ are, in fact,
pulled back from this ring via a bijection using the One Neat Trick.

In fact, _all three_ of our sets have bijections to $\Z/2^w\Z$, _all_ of bijections
are defined in terms of those bijections, and _all_ of our
ring structures are pulled back from it via the One Neat Trick.

So $\Z/2^w\Z$ is the Rosetta Stone at the middle of everything
and we can make a diagram that looks like

_**DIAGRAM**_

[mod]: https://en.wikipedia.org/wiki/Modular_arithmetic#Integers_modulo_m
