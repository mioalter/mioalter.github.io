---
title: Fibers of Maps or How Not To Get Trolled By Java Docs
---

Think back to grade school: a teacher starts a group activity by saying
"We're going to split up into 3 groups", points at students one at a time
and counts off "1, 2, 3, 1, 2, 3", then says "all the 1s over here, all the 2s over
there, all the 3s over there."

A nice thing aobut this way of splitting the class up is that everyone is in exactly one group
so everyone is included and groups and there is no ambiguity (no one is in two groups at once).

One way to describe this process is:
if $S$ is the set of students, by couning off, the teacher is defining a map / function
$f: S \to \{1, 2, 3\}$
from the set of students to the set $\{1, 2, 3\}$.
The resulting groups are the _fibers_ of this map:
group $1$ is the subset of all students $s$ for which $f(s) = 1$.
In calculus class, we would call these the "level sets" of $f$.

Collecting the students into groups, we can form the set of groups:
Group $1$ is the subset $Grp_1 = \{s \in S \vert f(s) = 1 \}$
Group $2$ is the subset $Grp_2 = \{s \in S \vert f(s) = 2\}$
Group $3$ is the subset $Grp_3 = \{s \in S \vert f(s) = 3\}$
Groups is the set $\{Grps = \{ Grp_1, Grp_2, Grp_3 \}$.
...

Another function we could define is the one that maps each student to the first letter
of their last name. This is a function $g: S \to \{a, b, \ldots, z\}$.


## Java doc part
Here are the Comparator Java docs https://docs.oracle.com/javase/8/docs/api/java/util/Comparator.html
Here is the contract for `compare` https://docs.oracle.com/javase/6/docs/api/java/util/Comparator.html#compare%28T,%20T%29

Pretty sure what we want to say is just: $x \sim y$ iff $x \leq y$ _and_ $y \leq x$ defines a relation.
Uh....by the contract, this is an equivalence relation?

> Compares its two arguments for order. Returns a negative integer, zero, or a positive integer as the first argument is less than, equal to, or greater than the second.

In the foregoing description, the notation sgn(expression) designates the mathematical signum function, which is defined to return one of -1, 0, or 1 according to whether the value of expression is negative, zero or positive.

The implementor must ensure that sgn(compare(x, y)) == -sgn(compare(y, x)) for all x and y. (This implies that compare(x, y) must throw an exception if and only if compare(y, x) throws an exception.)

The implementor must also ensure that the relation is transitive: ((compare(x, y)>0) && (compare(y, z)>0)) implies compare(x, z)>0.

Finally, the implementor must ensure that compare(x, y)==0 implies that sgn(compare(x, z))==sgn(compare(y, z)) for all z.

It is generally the case, but not strictly required that (compare(x, y)==0) == (x.equals(y)). Generally speaking, any comparator that violates this condition should clearly indicate this fact. The recommended language is "Note: this comparator imposes orderings that are inconsistent with equals." 
