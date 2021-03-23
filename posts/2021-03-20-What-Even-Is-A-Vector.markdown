---
title: What Even Is a Vector Space?
---
\newcommand{\nto}{\Rightarrow}
\newcommand{\bb}{\mathbb}
\newcommand{\R}{\mathbb R}
\newcommand{\Z}{\mathbb Z}
\newcommand{\o}{\overrightarrow}

This is a very rapid introduction to linear algebra.
The title is inspired by the AMS's "What is a...?" series.
This will be wildly wildly hand wavy,
but I'm hoping that by omitting details and providing intuition,
this provides a good foundation for further study and/or
for reading future posts :)
At the very least, it hopefully provides enough context to
make some things from high school phyiscs and calculus
make a little more sense.


# Sets

A set is just a bunch of things, e.g.

* $\{a,b,c\}$ is a set with three elements,
* the integers $\Z = \{\ldots, -1,-1,0,1,2,\ldots\}$ are a set,
* the real number line $\R$ is a set,
* the 2 dimensional xy-plane
consisting of all ordered pairs of numbers on the number line is a set,
* 3d xyz-space consisting of all ordered triples
of numbers on the real number line is a set.

We denote sets using curly braces.
The elements may or may not have an ordering and there can be finitely or
infinitely many of them.
There are no presumed operations (e.g. addition, multiplication) on a set.

A function $f$ from a set $X$ to a set $Y$, written $f: X \to Y$,
is rule that assigns to every element of $X$, an element of $Y$.

* the domain of $f$ is $X$
* the range of $f$ is $Y$
* the image of $f$ is the subset of all $y$s in $Y$ that are
  $f$ of something in $X$
* the preimage of a $y$ in $Y$ is the subset of all $x$s in $X$
  that $f$ sends to that $y$.

A function can be

* injective or 1-1 ("one to one")
* surjective or onto
* bijective

In words:

* $f$ is injective if it never sends different things to the same place.
Equivalently: if it sends two things to the same place, those things were the same.
* $f$ is surjective if everything in $Y$ is $f$ of something in $X$.
Equivalently: the image of $f$ is all of $Y$.
* $f$ is bijective if it is both injective and surjective.

We can make new sets out of old sets by taking

* unions: e.g. $\{a, b\} \cup \{c,d\} = \{a,b,c,d\}$
* products: e.g. $\{a,b\} \times \{c,d\} = \{(a,c), (a,d), (b,d), (b,d)\}$

That is, a product of two sets is the set consisting of all ordered pairs of
elements in the original two sets.
So the xy-plane is $\R \times \R$ which we abbreviate to $\R^2$,
and xyz-space is $\R \times\R\times\R$ which we abbreviate to $\R^3$.
More generally, $\R^n$ is the set of ordered n-tuples of real numbers.

# Vector Spaces

We'll launch right in to vector spaces in general first, then circle back
to connect what we get to the things we learned in high school.

A vector space is

* a set
* whose elements we can add
* and multiply by numbers
* where addition and multiplication interact in expected ways

This is obviously very vague, but the point is that a vector space is
a set, with some operations, that satisfy some conditions.
There is nothing intrinsic about the elements that makes them vectors,
they are vectors becasue they are elements of a set with operations that
satisfy the conditions that make it a vector space.
One upshot of this is that a set may be a vector space and it may
also be something else, too. The elements are vectors when you are
considering the set as a vector space,
but they are not vectors in and of themselves, all the time, no matter what,
so you are free to stop thinking about them as vectors whenever you want.

Let's say in words what this all means in a little more detail,
but still not that much

* we have a set whose elements we call vectors
* we can add vectors
  * we have an addition operation that takes two vectors and produces
  another vector
  * there is a zero vector, that is, a single vector that,
  when we add it to any other vector, we get back that other vector
  * every vector has a negative vector, that is, for every vector,
  there is another vector that, when we add the two together, we get
  the zero vector
  * addition is associative
  * addition is commutative
* we can multiply vectors by numbers
  * what numbers?? We get to choose!
  In this post, we'll take "numbers" to mean the real numbers $\R$,
  but in general, we can talk about vector spaces "over" any [field][field].
  * we have a multiplication operation that takes a number and a vector and
  produces another vector
  * zero (the number) times any vector is the zero vector
  * negative one (the number) times any vector is the negative of that vector
  * mulitplying a vector by a number, then multiplying it by another number
  is equal to multiplying the original vector by the product of those numbers
  * multiplication distributes over addition

We won't go into every detail, but you get the idea: we need rules for
how addition and multiplication each works and how they work together.
Everything is intuitive, but we're mathematicians here and have to spell it
all out.

# A Few Vector Spaces

Let's again start kind of out there:
if $X$ is any set, finite or infinite,
we can make the set of all functions $X \to\R$ into a vector space.
We define

* the sum of two functions $f$ and $g$ to be the function that,
on an input $x$, takes the value $f(x) + g(x)$.
* multiplying a function $f$ by a number $c$ produces the function that,
on an input $x$, takes the value $c$ times $f(x)$.

This feels like a tautology, but it is not: we just made a set of functions
into a vector space by defining addition and scaling of functions in terms
of the addition and multiplication of numbers we already have.
We are being very loose: to do this for real, we would have to list all
of the things a vector space in general must satisfy and check that this one,
with these definitions of addition and scaling,
really does satisfy all of those things.
Smells like an exercise to me :)

This is a standard way to turn sets of functions into vector spaces.

Here's another function space example: if $V$ is a vector space,
we can make the set of _linear_ functions $V\to \R$ into a vector space
in the same way.
A function $f: V \to \R$ is linear if $f$
of a sum is the sum of the $f$s and $f$ of a number times a vector is
that number times $f$ of that vector.
That is, we can do our vector space operations, then apply $f$, or we can apply
$f$, then do our vector space operations on the other side:
we get the same thing either way.

Finally, here's a more familiar example:
let's consider the set of all ordered triples
of real numbers, but let's write them vertically as columns of numbers,
instead of horizontally.


![](http://www.latex2png.com/pngs/07d599c0bb53f793a1a66c3c6ab3decf.png)


# Linear Maps


# Appendix


## Notation
* The symbol $\in$ means "is in" or "is an element of".
* We can also describe sets using the notation
$\{ \text{ elements } \vert \text{ conditions }\}$
where "$\vert$" means "such that" so we list the elements then the conditions
that they satisfy. For example,
  * $\{ a \in \Z \vert a\text{ is even}\}$ is one notation for the
even integers,
  * $\{(a,b) \vert a\in \R, b\in \R, b > 0\}$ is one notation for the subset of the xy-plane consisting of pairs whose second coordinate is positive.
  * $\{(a,b)\in\R^2 \vert b > 0\}$ is another way to write the same set.

## Exercises

* Is $f: \R \to \R$ defined by $f(x) = x^2$ injective? surjective? bijective?
* Is $f: \R \to \R$ defined by $f(x) = x + 3$ injective? surjective? bijective?
* Is the $f$ from the xy-plane to xyz-space defined by $f(x,y) = (x,y,0)$ injective? surjective? bijective?
* Express what it means for a function to be injective/surjective in symbols.



[field]: https://en.wikipedia.org/wiki/Field_(mathematics)
