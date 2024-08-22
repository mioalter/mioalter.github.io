# Matrix Multiplication in K

`K` is a language in the APL family.
Everything in `K` is a vector (or vector of vectors, or vector of vector of vectors, etc.).
This is short post about matrix multiplication in `K`, in particular, why
the thing that does matrix multiplication is doing matrix multiplication.

To be clear: I don't know `K`.
I do know linear algebra, but this post isn't trying to teach you either.

You can run `K` in your browser:...
or install it locally (e.g. `brew install kona`).

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

Given two vectors `v` and `w`, we can add and multiply them element-wise,
and compute their dot product.

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

we can do the same thing manually

```
  (1*w;2*w;3*w)    // a vector of 3 vectors
(4 5 6             // aka a 3x3 matrix
 8 10 12
 12 15 18)
```

This is how you define a matrix in `K`: as a vector of rows.

Now, for some math.
If $A$ is an $m \times n$ matrix—$m$ rows, $n$ columns—and $B$ is an $n\times p$
matrix, the product $AB$ is the $m\times p$ matrix whose $(i,j)^{th}$ element
is the dot product of the $i^{th}$ row of $A$ with the $j^{th}$ _column_ of $B$.
In the standard imperative impelementation with 3 loops,
the outer loop iterates over the rows of $A$, the second loop iterates over the
columns of $B$, and the inner loop computes the dot product
by multiplying element-wise, then summing.

Let's make a few observations.
First, suppose for a minute that $A$ is a $1\times n$ matrix, a row vector.
Here is a description of how to compute $AB$:
we multiply the first row of $B$ by the first element of $A$, the second row of $B$
by the second element of $A$, and so on, then we add up all of those rows element-wise.

In `K`, this looks like

```
  A: 1 2 3
  :B: (10 11 12 13;20 21 22 23;30 31 32 33)
(10 11 12 13     // so B is a 3x4 matrix
 20 21 22 23
 30 31 32 33)
  +/A*B
140 146 152 158
  dot[A;B]
140 146 152 158
  (dot[A;(10 20 30)];dot[A;(11 21 31)];dot[A;(12 22 32)];dot[A;(13 23 33)])
140 146 152 158
```

Note the leading `:` in `:B:` is just to make the repl to display the value of $B$.

So `dot` in `K` is more general that the dot product in math:
the dot product in math takes two vectors of the same size and produces a number;
`dot` in `K` does that, but it can also compute the matrix product of a $1\times n$
matrix with an $n \times p$ matrix.

Now let's relax our assumption and let $A$ be an arbitary $m\times n$ matrix,
not necessarily a row vector.
Observe that the $i^{th}$ row of $AB$ is the $i^{th}$ row of $A$ times $B$:
this is because the $i^{th}$ row of $AB$ consists of the dot products of the $i^{th}$
row of $A$ with each of the columns of $B$.
This is the last piece we need to implement matrix multiplication in `K` in general:
we just have to do what we did above and `dot` each row of $A$ with all of $B$

``
  A1: 1 2 3
  A2: 4 5 6
  :A: (A1;A2)
(1 2 3
 4 5 6)
  :B: (10 11 12 13;20 21 22 23; 30 31 32 33)
(10 11 12 13
 20 21 22 23
 31 31 32 33)
```

```
  (A1*B;A2*B)
((10 11 12 13
  40 42 44 46
  90 93 96 99)
 (40 44 48 52
  100 105 110 115
  180 186 192 198))
  (+/A1*B;+/A2*B)
(140 146 152 158
 320 335 350 365)
  (dot[A1;B];dot[A2;B])
(140 146 152 158
 320 335 350 365)
 ```

To perform an operation on each row of $A$ and all of $B$,
we just need the "left each" operator again

```
  A(+/*)\:B
(140 146 152 158
 320 335 350 365)
```

So this is the definition of matrix multiplication in `K`:

```
matmul: (+/*)\:
```

This looked extremely wrong to me when I first saw it: it _looked_ like
`matmul[A;B]` would compute the dot products of the rows of $A$ with the _rows_ of $B$
since matrices are vectors of rows and `matmul` is just applying `dot` to
each row of $A$ and all of $B$.
I expected to see a matrix transpose in there somewhere.
It turns out that `dot` in `K` is more general than the dot product in math
and this absolutely does the right thing.
