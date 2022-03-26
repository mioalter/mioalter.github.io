---
title: What even is a derivative? (Gauss in the Hauss 0)
---
\newcommand{\nto}{\Rightarrow}
\newcommand{\bb}{\mathbb}
\newcommand{\r}{\mathbb R}

# Gauss in the Hauss

# What even is a derivative?

We'll do examples and make a few general claims along the way.

The tl;dr is: we usually think of the values of a function, its outputs,
and the values its derivative as living in the same place,
but they actually don't.
When we think of them as living in the same place, it is because there
is some way to relate these two places so that we can think of them as the same,
but this is much more confusing than just thinking of them as different.

Let's suppose we have a particle that is confined to move along a line and
write down a function that desribes its position as a function of time.
Let's picture our line as being oriented so that numbers get more negative
going to the left and more positive going to the right, with zero in the middle.
Let's say that our position function is $f(t) = t^2$.
This is just the function that takes a number and squares it.
We could just as well write it as $f(x) = x^2$, but let's write it as
$f(t) = t^2$ to remind ourselves to think of the input as time.

The derivative of $f$ at time $t=3$ is the number $6$, but what is that number?
It is the rate of change of the position of our particle: its velocity.
Saying "the derivative of $f$ at $t=3$ is $6$" means
"at time $t=3$, our particle is moving at a speed of $6$ to the right, i.e.,
in the positive direction."

At time $t=3$ the position of our particle is $3^2 = 9$.
Is there some time $t$ for which the position of our particle is $6$?
Yes, $t = \sqrt6$.
Do the $6$ which is the position of our particle at time
$t = \sqrt 6$ and the $6$ which is its velocity at time $t=3$ have anything to do
with each other? No. They are both numbers, but they mean different things.
Does the number $6$ which is the velocity of our particle at time $t=3$ have
anything to do with the number $9$ which is the position of our particle at time $t=3$
or with the positions of the particle at different times?
Sure! The way that we compute that $6$ is by measuring the distance from
position $9$ to nearby positions, computing a ratio, and taking a limit (using the definition of the derivative).
So, yeah, velocities and positions are definitely related, but do the numbers which are velocities
and the numbers which are positions live in the same number line? No way.

Now let's tweak our function a little and make a new function $g(t) = (t, t^2)$.
This produces values which are not single numbers, put pairs of numbers which
we can think of as points in the xy-plane.
As $t$ varies, $g(t) traces out a parabola in the xy-plane: a bowl shape
that sits on the $x$-axis, and opens up toward the positive $y$-axis.
This parabola is actually the graph of our function $f$, this is just not the way
we usually desribe it.
We can think of $g$ as describing the position of a particle that moves in a
parabolic curve in the xy-plane.
At time $t=3$, the position $g(3)$ of this particle is $(3,9)$ and if we compute
the derivative of $g$ at time $t=3$, we get $(1,6)$




