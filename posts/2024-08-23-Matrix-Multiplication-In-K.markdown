---
title: Matrix Multiplication in K
---

`K` is a language—family of langauges—in the APL family.
Everything in `K` is a vector (or vector of vectors, or vector of vector of vectors, ...).
This is a short post about [matrix multiplication][matrix-multiplication] in `K`,
in particular, why the thing that does matrix multiplication is doing matrix multiplication.

To be clear: I don't know `K`. I do know linear algebra.
But this post will not attempt to teach you either.

A couple ways to run `K` are

* in your browser [like so][k-browser] or [like so][ngn-k-repl] or
* by [installing it locally][kona].

See the references at the end for helpful links.

First, given a vector `v`, we can

```
  v: 1 2 3   // create a vector v
  2+v        // add 2 to every element
3 4 5
  2*v        // multiply every element by 2
2 4 6
  +/v        // fold / sum over v
6
```

The `/` operator is called "over" so `+/v` is read "plus over v."

Given two vectors `v` and `w`, we can add and multiply them element-wise,
and compute their [dot product][dot-product].

```
  w: 4 5 6   // create a vector w
  v+w        // add v and w element-wise
5 7 9
  v*w        // multiply them element-wise
4 10 18
  +/v*w      // take their dot product
32
```

We can give the dot product a name and call it with two arguments.

```
  dot: (+/*)
  dot[v;w]
32
```

We can use the "left each" operator `\:` to multiply each element of `v` by all of `w`

```
  v*\:w      // multiply each element of v by all of w
(4 5 6       // this produces a vector of vectors
 8 10 12     // aka a matrix
 12 15 18)
```

The same thing manually

```
  (1*w;2*w;3*w)    // a vector of 3 vectors, all of size 3
(4 5 6             // aka a 3x3 matrix
 8 10 12
 12 15 18)
```

This is how you define a matrix in `K`: as a vector of rows.

Now, for some math.
If $A$ is an $m \times n$ matrix—$m$ rows, $n$ columns—and $B$ is an $n\times p$
matrix, the product $AB$ is the $m\times p$ matrix whose $(i,j)^{th}$ element
is the dot product of the $i^{th}$ row of $A$ with the $j^{th}$ _column_ of $B$.
In the standard [imperative impelementation][mat-mul-algo] with 3 loops,
the outer loop iterates over the rows of $A$, the second loop iterates over the
columns of $B$, and the inner loop computes the dot product
by multiplying element-wise and summing.
Although we know how to compute dot products of vectors in `K`,
since matrices are represented as vectors of rows, we cannot easily access
their columns so this is not how we will implement matrix multiplication.

We can, however, make an astute observation:
the $i^{th}$ row of $AB$ is the $i^{th}$ row of $A$—viewed
as a $1 \times n$ matrix—times $B$.
So, if we can figure out how to multiply a single row of $A$ by all of $B$,
then we can do that for each row and that will give us $AB$.

So, can we figure out how to multiply a single row of a matrix by another
matrix in `K`-y way? Let's say that $A$ and $B$ are

```
  A1: 1 2 3        // the first row of A
  A2: 4 5 6        // the second row of A
  :A: (A1;A2)      // A is a 2x3 matrix
(1 2 3
 4 5 6)
    :B: (10 11 12 13;20 21 22 23;30 31 32 33)
(10 11 12 13       // B is a 3x4 matrix
 20 21 22 23
 30 31 32 33)
```

Note: the leading `:` in `:A:` is to make the REPL display
the value of the assignment `A:`.

What do we do to mulitply the first row of $A$ by all of $B$?
First, we mutiply the first row of $B$ by the first element of $A1$,
the second row of $B$ by the second element of $A1$, and so on

```
  A1*B
(10 11 12 13
 40 42 44 46
 90 93 96 99)
```

then we add the rows element-wise

```
  +/A1*B
140 146 152 158
```

These numbers really are the dot products of `A1` with the columns of `B`

```
  dot[A1;10 20 30]
140
  dot[A1;11 21 31]
146
  dot[A1;12 22 32]
152
  dot[A1;13 23 33]
158
```

But, wait: `(+/*)` is `dot`

```
  dot[A1;B]
140 146 152 158
```

So, `dot` is actually more general than the dot product in linear algebra:
not only does it compute dot products of vectors, it also computes
the matrix product of a row vector—$1\times n$ matrix—and a matrix.

So now, to compute the entire product $AB$, we want to do this for every row of $A$
and all of $B$.

```
  (dot[A1;B];dot[A2;B])
(140 146 152 158
 320 335 350 365)
```

We can write this more succinctly using the "left each" operator `\:`

```
  A(+/*)\:B
(140 146 152 158
 320 335 350 365)
```

or

```
  matmul: (+/*)\:
  matmul[A;B]
(140 146 152 158
 320 335 350 365)
```

And that is matrix multiplication in `K`.

# Conclusion
The impetus for writing this post was that this looked extremely wrong to me when
I first saw it:
it _looked_ like `matmul[A;B]` would compute the dot products of the rows of $A$
with the _rows_ of $B$ since matrices are vectors of rows and `matmul` is just doing
something with dot products. I expected to see a matrix transpose in there somewhere.
It turns out that `dot` in `K` is _not_ just the dot product of vectors,
it includes a hefty chunk of matrix multiplication.
Figuring out what `matmul` is doing and why it works gave me a new way to think
about matrix multiplication.

Mind expanded. I hope you feel the same.

# References
Here are some things I looked at to figure this out

* [What about k?][k-book]
* The short article ["K" by Arthur Whitney][k-by-arthur]
* This [tutorial][ngn-k-tutorial]
* This [other tutorial][ok-manual]


[dot-product]: https://en.wikipedia.org/wiki/Dot_product
[k-browser]: http://johnearnest.github.io/ok/index.html
[k-book]: https://xpqz.github.io/kbook/Introduction.html#
[k-by-arthur]: http://archive.vector.org.uk/art10010830
[kona]: https://github.com/kevinlawler/kona
[matrix-multiplication]: https://en.wikipedia.org/wiki/Matrix_multiplication
[mat-mul-algo]: https://en.wikipedia.org/wiki/Matrix_multiplication_algorithm
[ngn-k-repl]: https://ngn.bitbucket.io/k/
[ngn-k-tutorial]: https://razetime.github.io/ngn-k-tutorial/
[ok-manual]: https://github.com/JohnEarnest/ok/blob/gh-pages/docs/Manual.md
