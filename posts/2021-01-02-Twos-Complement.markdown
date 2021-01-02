---
title: The Algebra of Two's Complement
---
\newcommand{\bb}{\mathbb}

Suppose we want to work with positive and negative integers, but only have room
to store $2^N$ distinct numbers where $N$ is a positive even integer, think
32 or 64? Suppose further that we want to do this on a computer?
Let's first figure out how to do this at all,
then figure out how to do it on a computer.

# A cyclic group

We want to work with integers—the whole numbers on the number line, positive,
negative, and zero—meaning we want to have numbers and be able to add and
multiply them, but we can only have $2^N$ distinct numbers.

We can take "the integers mod $2^N$", but let's be precise about what that is.
We take all of the integers, ask each one its remainder when we divide it by
$2^N$, group together the integers with the same remainder onto a team,
and define addition and multiplication on the set of resulting teams.
This is the "how do you make teams in gym class" description.

More formally: we define an equivalence relation by saying that
two integers are equivalent if their difference is a multiple of $2^N$
(this is equivalent to "have the same remainder when divided by $2^N$")
and take the set of _equivalence classes_.
Let's write $[2]$ for "the equivalence class of $2$", meaning,
the set of all integers equivalent to $2$, namely
$\{\ldots, -2^N + 2, 2, 2^N + 2, \ldots \}$.
This means, of course, that $[2]$ is the same as $[2^N + 2]$,
is the same as $[-2^N + 2], etc.
so there are infinitely many ways to represent each of these.
We call $2$ the _representative_ of its equivalence class,
each class has infinitely many representatives.

One way to think of this is: we mark off all the multiples of $2^N$ on the
number line, then roll up the whole number line so these points all align
to get a circle of circumference $2^N$.
We will only care about the integer points on the number line / circle, but
there is no harm in picturing the points in between.
So we have a circle.
We can define addition, multiplication, and negatives on here,
but we need to figure out how. Our intuition about how these work on the
usual flat number line may fail us so we'll need to build up new intution.

Remember that our numbers on the circle are our gym class teams,
our equivalence classes, the sets $[0]$, $[1]$, ..., $[2^N - 1]$.

First, addition: let's define $[a] + [b]$ to be $[a + b]$.
So, for example, $[1] + [2] = [1 + 2] = [3]$.
Does this make sense?
We have to check that we get the same answer no
matter which representative we choose.
Try it, it works.

Next, multiplication: let's define $[a] * [b]$ to be $[a * b]$.
So, for example, $[2] * [3] = [2 * 3] = [6]$.
Same story, this has to be independent of which representatives we choose.
It is.

There is plenty more: we have a zero for addition, $[0]$,
we have a one for multiplication, $[1]$, we have inverses for addition,
multiplication distributes over addition, and then there are a few weird
things. Let's make a list

* we have addition: $[a] + [b] = [a + b]$
* addition is commutative
* we have a zero (additive identity): $[0] + [a] = [a]$
* we have additive inverses: $[a] + [2^N - a] = [a + 2^N - a] = [2^N] = [0]$
* we have multiplication: $[a] * [b] = [a * b]$
* we have a one (multiplicative identity): $[1] * [a] = [1 * a] = [a]$
* mulplication distributes over addition: $[a] * ([b] + [c]) = [a] * [b + c] = [a * (b + c)] = [a * b + a * c] = [a * b] + [a * c]$

and some weirdness

* we can add together nonzero positive-looking numbers and get zero:
e.g. $[3] + [2^N - 3] = [0]$

* we can multiply together nonzero numbers and get zero:
e.g. $[2] * [2^{N-1}] = [2 * 2^{N-1}] = [2^N] = [0]$

These just come with the territory: we are on a circle,
addition and multiplication move us around the circle
and sometimes we end up back at the point on the circle called $[0]$.

The number system we just defined is usually written $\bb Z / 2^N\bb Z$
and called "Z mod 2 to the N" or "Z mod 2 to the N Z".
It has both addition and multiplication so it is a ring.

So that's how to work with integers when we can only have $2^N$ distinct numbers.
Next, we'll figure out how to represent these using bits.



