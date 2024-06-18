---
title: A Couple of Flat Circles
---
\newcommand{\R}{\mathbb R}

I was listening to [a podcast][money stuff] recently and one of the hosts said
"time is a flat circle." Only tangentially—pun intended!—related to the meaning
of that phrase, I started thinking about two different descriptions of the [torus][torus]
(which is a pair of circles): one flat, one not.
This post will describe those two ways of viewing the torus.

The real point, though, is to answer the question: what does it even mean for a
non-Euclidean space to be flat or not flat?
So really, this a brief introduction to non-Euclidean geometry.
 
The punchline about the tori will come at the end once we set everything up.
I'm very intentionally keeping this light on details and heavy on intuition.
I'll freely include links to wikipedia and textbooks for anyone interested in going deeper.
My hope is that anyone with vague memories of calculus will be able to enjoy this.
I'll use mathematical notation very sparingly and will include few-to-no pictures,
but only because I am lazy.
Drawing pictures is extremely helpful here and the linked references have some great ones.

# Euclidean spaces

We'll write $\R$ (pronounced "R") for the [real number line][reals] and refer to numbers
on the number line as "real numbers."

For $n = 1, 2, 3, \ldots$, we'll write $\R^n$ for the set of all $n$-tuples of real numbers.
So the xy-plane of high school geometry is $\R^2$ (pronounced "R-2") and the 3-dimensional
xyz-space of calculus class is $\R^3$ (pronounced "R-3").

The set $\R^n$ along with all of the [familiar structure we are accustomed to][euclidean]—
we can measure distances between points, say when sequences converge, etc.—
is variously called
"Euclidean space",
"Euclidean $n$-space",
"$n$-dimensional Euclidean space",
"Euclidean space of dimension $n$",
"$n$-dimensional space",
or just "$n$-space."

When $n$ is $2$, we usually say "the plane" or the "the xy-plane";
when $n$ is $3$, we usually say "$3$-space", "$3$-dimensional space", "xyz-space"
or some combination of these.

For everything that follows, $n$ will be $2$, $3$, or $4$.

# Tangent vectors

Suppose we have a curve $\alpha(t)$ ("alpha of t") in $3$-dimensional xyz-space,
that is, not only the path traced out by a particle moving in space,
but it's position as a function of time.
So $\alpha(t)$ is really a triple of functions $(x(t), y(t), z(t))$ that give the
x, y, and z coordinates of our particle as functions of time.

The derivative $\alpha'(t)$ ("alpha prime of t") is the [tangent vector][tangent vector]
to our curve. It is the velocity as a function of time.

# Tangent spaces

Something extremely confusing happens in most calculus classes:
we write a curve in $\R^3$ as $\alpha(t) = (x(t), y(t), z(t))$,
we write its derivative as $\alpha'(t) = \langle x'(t), y'(t), z'(t) \rangle$
(pointedly using angle brackets instead of parentheses), and go to great lenghts
to emphasize that the velocity $\alpha'(t)$ is a vector—a thing with
a magnitude and a direction that we can freely move around as long as we don't
change its magnitude or direction—whereas the position $\alpha(t)$ is not.
All fine so far: there is nothing so strange about position and velocity being
not exactly the same type of thing.
But then we throw a wrench in it by calling $\alpha(t)$ a _vector_-valued function
which implies that positions are vectors, too, which we said they are not.

What is going on?

Well, there are really many different copies of $3$-dimensional space:
there is the space of positions and, at each position, a space of all possible
tangent vectors. So there is the $\R^3$ that $\alpha(t)$ lives in and, at every
point in that $\R^3$, another $\R^3$ of the tangent vectors to all curves that pass
through that point.
It just happens that we have a standard way to think of all of these different
$\R^3$s as a single $\R^3$, so we do that, except for the parentheses vs. angle brackets thing,
and it ends up being very confusing.

The 20th century way to say this is: there is the space $\R^3$ and,
at each point $p$ in that space, there is the space of tangent vectors $T_p\R^3$
("T-P-R-3") which is another $\R^3$.
A space along with the spaces of tangent vectors at every point is called the
[_tangent bundle_][tangent bundle]. So really, calculus in $\R^3$ is the geometry/physics/dynamics
of the tangent bundle to $\R^3$.

# Curvature is a second derivative

The second derivative $\alpha''(t)$ is a vector that tells us how our velocity
vector is changing, its magnitude $\vert \alpha''(t)\vert$ tells us how quickly
our velocity is changing, ignoring the direction of change.

If the magnitude and direction of our velocity vector are constant, then we are moving
in a straight line and $\vert \alpha''(t)\vert = 0$ .
If our velocity vector is changing,
then our curve is curving and $\vert\alpha''(t)\vert\neq 0$.

So $\vert \alpha''(t)\vert$ (suitably normalized) is the [curvature of our curve][curvature].

Similarly, but more briefly, if we have a surface in $\R^3$ described ("parameterized")
by a function $\alpha(u,v) = (x(u,v), y(u,v), z(u,v))$,
then we can measure [how quickly the tangent planes change][gaussian curvature]
as we move along the surface. This again measures rates of change
of (planes of) velocity vectors so is a second derivative.

This is the Gaussian—first half of the 19th-century—description of curvature
of curves and surfaces embedded in $\R^3$.

What we'll see next is the modern, Riemannian, description of curvature
which generalizes the Gaussian view to higher-dimensional, non-Euclidean, spaces.

Gauss' machinery is already not bad! It's enough to prove [why a slice of pizza
doesn't flop if you fold it][egregium].

# Non-Euclidean spaces

# Length is speed times time

# Metrics

# Curvature again

# Flat and non-flat Tori

[curvature]: https://en.wikipedia.org/wiki/Curvature
[gaussian curvature]: https://en.wikipedia.org/wiki/Gaussian_curvature#Informal_definition
[egregium]: https://en.wikipedia.org/wiki/Theorema_Egregium
[euclidean]: https://en.wikipedia.org/wiki/Euclidean_space
[money stuff]: https://www.bloomberg.com/podcasts/series/money-stuff
[reals]: https://en.wikipedia.org/wiki/Real_number
[tangent bundle]: https://en.wikipedia.org/wiki/Tangent_bundle
[tangent vector]: https://en.wikipedia.org/wiki/Tangent_vector
[torus]: https://en.wikipedia.org/wiki/Torus
