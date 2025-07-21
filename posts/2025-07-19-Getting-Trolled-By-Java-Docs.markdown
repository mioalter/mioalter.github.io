---
title: Do you like to get trolled by Java docs?
---

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
