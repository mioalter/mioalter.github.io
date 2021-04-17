---
title: What even is derivative?
---
\newcommand{\R}{\mathbb R}
\newcommand{\Rm}{\mathbb{R}^m}
\newcommand{\Rn}{\mathbb{R}^n}
\newcommand{\nto}{\Rightarrow}
\newcommand{\bb}{\mathbb}

This is a short post to elaborate on this twitter thread
as well the ~ once a month epiphany that functional programmers
have that the derivative is a higher order function.
It is, but, even more than that, it is a functor.
This will be a wildly fast and incomplete tour of these ideas.
I would rather get to the good stuff and let readers fill in details
if they want than get bogged down in definitions
and lose the forest in the trees.

# Vector spaces
A [vector space][vs] is a set in which we can add things and scale them by numbers.
A [basis][b] of a vector space $V$ is a subset of vectors in terms of which we can
write any vector in $V$, that is, a set of coordinate vectors.
The dimension of a vector space is the number of vectors in any basis.
(Theorem: this number is always the same).
A map between vector spaces $V$ and $W$ is a [linear map][lm], that is,
one that preserves the vector space operations.
Given choices of bases for $V$ and $W$, we can write a linear map $f$
as a matrix: the columns of a matrix representation of $f$ are vectors in $W$
(written in terms of our chosen basis of $W$) which are where $f$ sends each of
our chosen basis vectors of $V$.
That is, a matrix is a specific representation of a linear map that depends on choices;
making different choices gives us a different representation of the same linear map.

Observe that there is nothing intrinsic about the elements of a vector space
that makes them vectors, they are vectors because we can perform vector space operations on them.
A single set can be a vector space and can also plenty of other things—
a group, a ring, an affine space, a topological space, and/or a metric space—
and the elements of that set are only vectors when we are thinking of it as a vector space.

# $\Rn$

When we say "numbers", we mean numbers on the real number line $\R$.

For any whole number $n > 0$,
$\Rn$ is the set of ordered $n$-tuples (lists of length $n$) of numbers.
It is a vector space by component-wise addition and scaling.
$\R^2$ is the set of ordered pairs of numbers, the xy-plane,
$\R^3$ is the set of ordered triples of numbers, xyz-space.
We'll mostly stick with $\R^2$ and $\R^3$.

The endlessly confusing thing is that there are many different copies of
$\Rn$ that we often consider the same $\Rn$.
The point of this post is that it is much easier to understand derivatives
if we are explicit about what these different $\Rn$s are and which vectors
live in which ones.

# Tangent and Cotangent spaces

Given a point $p$ in $\Rn$,
the tangent space at $p$ is the set of vectors $q - p$ for $q$ in $\Rn$.
That is, it is a copy of $\Rn$ whose origin is at $p$.
Let's write it as $T_p\Rn$.
Note that we have one of these for every $p$ in $\Rn$,
so, lots of different $\Rn$s.

The cotangent space at $p$ is the set of linear maps $T_p\Rn \to \R$.
This is a vector space because we can add and scale linear maps
and we still get linear maps.
Let's write this as $T^\ast_p\R^n$.

# Derivatives

Given a function $f: \Rm\to\Rn$ and a point $p$ in $\Rm$,
the derivative of $f$ at $p$ is a linear map of tangent spaces
$df_p: T_p\Rm \to T_{f(p)}\Rn$.

So, yes, "the derivative at $p$" is a higher-order function that
takes a function $f$, and produces another function $df_p$,
but it is more more than that:
if $g:\Rn \to\R^k$ is another function, the [Chain Rule][cr] says that
$d(gf)_p = dg_{(f(p))} df_p$, that is, the derivative of the composition
is the composition of the derivatives.
This says that "take the derivative at $p$" is a functor:
not only does it send differentiable functions between Euclidean spaces
to linear maps between their tangent spaces,
it sends composition to composition,
and identity maps to identity maps.
(Really, _pointed_ Euclidean spaces because we need to choose a point $p$.)

# Derivatives by example












[vs]: https://en.wikipedia.org/wiki/Vector_space
[b]: https://en.wikipedia.org/wiki/Basis_(linear_algebra)
[lm]: https://en.wikipedia.org/wiki/Linear_map
[cr]: https://en.wikipedia.org/wiki/Chain_rule
