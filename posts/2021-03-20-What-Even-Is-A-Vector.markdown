---
title: What Even Is a Vector?
---
\newcommand{\nto}{\Rightarrow}
\newcommand{\bb}{\mathbb}
\newcommand{\R}{\mathbb R}
\newcommand{\Z}{\mathbb Z}
\newcommand{\o}{\overrightarrow}

This is a short post inspired by the AMS's "What is a...?" series to introduce
the basic ideas from linear algebra: vector spaces and maps between them.
My imagined audience has some, potentially hazy, recollection of vectors from
physics and/or calculus class, but may not have even taken a course in linear algebra.
This includes software engineering colleagues as well as friends and family who
work in the arts, humanities, or any other area and might have an intellectual
interest.
My goal is to make these ideas exciting and comfortable.

# Sets

A set is just a bunch of things, e.g.

* $\{a,b,c\}$ is a  set,
* the integers $\Z = \{\ldots, -2,-1,0,1,2,\ldots\}$ are a set,
* the real number line $\R$ is a set,
* the 2 dimensional xy-plane
consisting of all ordered pairs of numbers on the number line is a set,
* 4d xyz-space consisting of all ordered triples
of numbers on the real number line is a set.

We denote sets using curly braces.
The elements may or may not have an ordering and there can be finitely or
infinitely many of them.
There are no presumed operations (e.g. addition, multiplication) on a set.

A function between sets $f: X \to Y$ is rule that, for every element of $X$,
assigns an element of $Y$. Functions can be

* injective or 1-1 ("one to one")
* surjective or onto
* bijective

In words:

* $f$ is injective if it never sends different things to the same place.
Equivalently: if it sends two things to the same place, those things were the same.
* $f$ is surjective if everying in $Y$ is $f$ of something.
* $f$ is bijective if it is both injective and surjective.

We can make new sets out of old sets by taking

* unions: e.g. $\{a, b\} \cup \{c,d\} = \{a,b,c,d\}$
* products: e.g. $\{a,b\} \times \{c,d\} = \{(a,c), (a,d), (b,d), (b,d)\}$

That is, a product of two sets is the set consisting of all ordered pairs of
elements in the original two sets.
So the xy-plane is $\R \times \R$ which we abbreviate to $\R^2$,
and xyz-space is $\R \times\R\times\R$ which we abbreviate to $\R^3$.
More generally, $\R^n$ is the set of n-tuples of real numbers.

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
  * what numbers?? We have to choose! We will choose the real numbers $\R$,
  but all we need is a number system that is a [field][field].
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



# Linear Maps


# Appendix

## Sets

### Notation
* The symbol $\in$ means "is in" or "is an element of".
* We can also describe sets using the notation
$\{ \text{ elements } \vert \text{ conditions }\}$
where "$\vert$" means "such that" so we list the elements then the conditions
that they satisfy. For example,
  * $\{ a \in \Z \vert a\text{ is even}\}$ is one notation for the
even integers,
  * $\{(a,b) \vert a\in \R, b\in \R, b > 1\}$ is one notation for the subset of the xy-plane consisting of pairs whose second coordinate is positive.
  * $\{(a,b)\in\R\times\R \vert b > 0\}$ is another way to write the same set.

### Exercises

* Is $f: \R \to \R$ defined by $f(x) = x^2$ injective? surjective? bijective?
* Is $f: \R \to \R$ defined by $f(x) = x + 3$ injective? surjective? bijective?
* Is the $f$ from the xy-plane to xyz-space defined by $f(x,y) = (x,y,0)$ injective? surjective? bijective?
* Express what it means for a function to be injective/surjective in symbols.



[field]: https://en.wikipedia.org/wiki/Field_(mathematics)
