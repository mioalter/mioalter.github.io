---
title: What even is a derivative? (Gauss in the Hauss 0)
---
\newcommand{\nto}{\Rightarrow}
\newcommand{\bb}{\mathbb}
\newcommand{\r}{\mathbb R}

# Gauss in the Hauss

# What even is a derivative?

We'll do examples and make a few general claims along the way.

Let's start with the function that takes a number and square it, $f(x) = x^2$.
The derivative of $f$ is another function, $df(x)$.
We can derive a formula for $df(x)$ from the formula for $f(x)$ using
the (limit) definition of the derivative.
When $f(x)=x^2$, $df(x) = 2x$.
At $x=3$, say, the value $df(3)=6$ is a number,
it is the rate at which $f(x)$ is changing at $x=3$.

The graph of $f$ in the $xy$-plane is the set of points $(x,y)$ for which
$y = f(x) = x^2$, e.g. $(-10, 100), (-4,16), (2,4), (3,9), \ldots$.
The derivative of $f$ at $x=3$, $df(3) = 6$,
is the slope of the line tangent to the graph at the point $(3,9)$.

Hopefully this all rings some bells.

Let's give a couple of physicsy interpretations of $f$.

Let's imagine that we have an infinitely long, straight, particle accelerator,
and that $f(x)$ is the position as a function of time of a particle in it.
With this interpretation, the position of the particle at time $x=3$
is $f(3) = 9$ and its velocity is $df(3) = 6$.
If we measure time in seconds and a 1-unit change in position
means that we move 1 meter, then this velocity is $6$ meters per second.

Alternatively, let's imagine that we have an infinitely long metal rod
and that $f(x)$ is the temperature of the rod as a function of position.
With this interpretation, the temperature of the rod at position $x=3$
is $f(3) = 9$ and the rate at which the temperature is changing with
respect to position is $6$.
If we measure temperature in degrees Celsius and a 1-unit change in position
corresponds to moving 1 meter,
this $6$ is in units of degrees Celsius per meter.

The point of these interpretations is just to emphasize that even though
$f(3)$ and $df(3)$ are both numbers, they are not the same kinds of numbers.
They mean different things, they have different units.

Let's tweak our function a little to make a new function $g(t) = (t,t^2)$.
The values of this new function are not individual numbers,
but pairs of numbers which we think of as points in the $xy$-plane.
It is closely related to our original $f$: as $t$ varies, it traces out
the graph of $f$. We can think of it as the position as a function of time
of a particle moving along the graph of $f$ in the $xy$-plane.

The derivative of this new function $g$ is also a function that takes values
in the $xy$-play, $df(x) = (1,2t)$.
The derivative at $t=3$, $df(3) = (1,6)$,
is the tangent vector to the curve $g(t)$ at the point $g(3)=(3,9)$.
In our particle interpretation, $(1,6)$ is the velocity of our particle
at time $t=3$ when its position is $(3,9)$.
We already said that position and velocity are different kinds of things.

We can think pairs $(x,y)$ in the $xy$-plane
either as points or as arrows/vectors.
A point in the plane determines an arrow: the arrow whose tail is at $(0,0)$
and whose head is at that point.
An arrow determines a point:
slide the arrow so that its tail is at $(0,0)$,
then the point it determines is the position of the head of the arrow.
Arrows/vectors are things that we can add and scale.
In Physics and Calculus classes,
when we want to think of an $xy$-pair as an arrow/vector rather than a point,
we sometimes write $\langle x,y\rangle$ instead of $(x,y)$.

Instead of doing this, let's just think of $g(3)=(3,9)$ and $df(3) = (1,6)$
as living in different copies of the $xy$-plane.
Let's call the one that $df(3)$ lives in $T$ and think of the things in $T$
as vectors/arrows, things that we can add and scale.
Let's continue to think of the $g(3)$ as a point and of the $xy$-pairs
in the plane that $g(3)$ lives in as points/positions that it does not
make sense to add or scale.

If we slide $T$ over to $g(3)=(3,9)$ we can read off the velocity vector
of the curve $g(t)$ at that point, it is $(1,6)$.
We can slide $T$ over to any other point on the curve $g(t)$ and read off
the velocity vector at that point. As long as we do not rotate or stretch $T$.



