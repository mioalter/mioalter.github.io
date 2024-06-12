---
title: A Couple of Flat Circles OR What Even Is Curvature?
---
\newcommand{\R}{\mathbb R}

I was listening to [a podcast][money stuff] recently and one of the hosts said
"time is a flat circle." Only tangentially—pun intended!—related to the meaning
of that phrase, I started thinking about two different descriptions of the [torus][torus]
(which is a pair of circles): one flat, one not.
This is a post to describe those two ways of viewing a torus.

This is, in fact, a very brief introduction to non-Euclidean geometry.
The punchline about the tori will come at the end once we set everything up.
I will try very hard to focus on intuition and leave out as many details as possible;
I'll freely include links to wikipedia and textbooks instead.
My hope is that anyone with vague memories of calculus will be able to enjoy this.
I'd like this, as much as a written blog post can be, to be like
we are walking down the street talking and I am wildly gesticulating with my hands,
rather than a lesson in front of a board.
I'll use mathematical notation very sparingly and will include few-to-no pictures,
but drawing pictures is extremely helpful here and the linked references all have great ones.

# Euclidean spaces

We'll write $\R$ (pronounced "R") for the [(real) number line][reals] and refer to numbers
on the number line as "real numbers."

For $n = 1, 2, 3, \ldots$, $\R^n$ for the set of all $n$-tuples of real numbers.
So the xy-plane of high school geometry is $\R^2$ (pronounced "R2") and the 3-dimensional
xyz-space of calculus class is $\R^3$ (pronounced "R3").

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

# Tangent vectors and tangent spaces

Suppose we have a particle moving around in $3$-dimensional xyz-space and we have
a function $\alpha(t)$ ("alpha of $t$") that gives its position as a function of time.
So $\alpha$ is really a triple of functions $(x(t), y(t), z(t))$ that give the x, y, and z
coordinates of our particle as functions of time that traces out a curve in xyz-space.

The derivative of $\alpha$, $\alpha'(t)$, is another function of time:
it tells us the velocity of our particle.
The velocity is a vector so has a magnitude and a direction.
(When to think of something in xyz-space as a point and when to think of it as a vector
is pretty confusing. We'll get to this shortly.)

Let's make an extra assumption: let's suppose that are particle is moving at constant
speed: the magnitude of its velocity vector, $\vert \alpha'(t)\vert$ is always $1$,
say, even if its direction may be changing.

If our particle's velocity vector is not changing—both its magnitude and direction
are constant—then it is moving in a straight line.
If our velocity vector *is* changing, then its direction is changing since we said
the magnitude was constant. In this case, our particle is curving.

The curvature of $\alpha$ at time $t$ is $\vert \alpha''(t)\vert$,
the magnitude of the derivative of the velocity vector:
the rate at which the direction of the velocity vector is changing.
Another way to say this is: the curvature at a point $p$ on our curve $\alpha$
tells us how quickly velocity vectors at nearby points are pulling away from the velocity vector at $p$.

Simiarily, but more briefly, if we have a surface in $3$-space described
("parameterized") by a function $\alpha(u,v)$, and a point $p$ on that surface,
then we can talk about the plane of velocity vectors—the velocity vectors of all curves in our surface
that pass through $p$—and measure how quickly the planes at nearby points are pulling away
from the plane at $p$. This is, intuitively, the curvature of a surface in $3$-space.

So, velocity vectors (and planes of velocity vectors) are first derivatives;
rates of change of velocity vectors are second derivatives.
Curvature is a second derivative.


# Curavture is a second derivative



# Non-Euclidean spaces

# Length is speed times time

# Metrics

# Curvature again

# Flat and non-flat Tori

[euclidean]: https://en.wikipedia.org/wiki/Euclidean_space
[money stuff]: https://www.bloomberg.com/podcasts/series/money-stuff
[reals]: https://en.wikipedia.org/wiki/Real_number
[torus]: https://en.wikipedia.org/wiki/Torus
