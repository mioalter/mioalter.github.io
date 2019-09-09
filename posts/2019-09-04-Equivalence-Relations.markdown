---
title: Equivalence Relations with Applications
---
\newcommand{\bb}{\mathbb}
\newcommand{\Z}{\mathbb Z}
\newcommand{\N}{\mathbb N}
\newcommand{\ol}{\overline}

Equivalence relations are very useful and total ubiquitous in math and programming,
yet less widely known to programmers than other ideas from algebra like monoids
and groups.
We'll do a few examples here to see how some familiar things
are defined in terms of equivalence relations,
continue with an application—how to turn any commutative monoid into a group—and
end with some examples of that construction.

We'll start quite gently then pick up momentum.
Hopefully this is useful and interesting to programmers with a wide range
of mathematical experience.

### Modular Arithmetic ###

First, informally: to do arithmetic mod 7, we add, subtract, and multiply integers
as usual,
but with the understanding that if we have two integers whose difference is a
multiple of 7,
we consider them the same in the same way that we consider 1/2 and 2/4 as the same.
So, 0, 7, 14, -7, -28 are all different ways of writing the same number in
arithmetic mod 7.
Any number mod 7 is the same as one of the numbers between 0 and 6,
inclusive because we can always add or subtract enough 7s to get into that
interval so we usually choose one of those to make our lives easier.

Here is a nice visual way to think about this:
take the number line, mark off all the integers—positive, negative, and zero—and
wind it into an infinite vertical spiral so that $\ldots -14, -7, 0, 7, 14\ldots$
are
stacked on top of each other, $\ldots -13, -6, 1, 8, 15, \ldots$
are stacked on top of each other, $\ldots-12, -5, 2, 9, 16, \ldots$
are stacked on top of each other, etc.

So we go 7 steps around the spiral to go one level up.
Now, let’s imagine we have a flat plane below our spiral and a light above it,
and we shine the light down onto the plane.
The shadow of our spiral is a circle with 7 points on it.
One point in the circle is the shadow of all the points
$\ldots -14, -7, 0, 7, 14,\ldots$
another is the shadow of all the points
$\ldots -13, -6, 1, 8, 15\ldots$ and so on.

Let's write $[0]$ for “the point in the circle which is the shadow of
all the points $\ldots -14, -7, 0, 7, 14 \ldots$”
and similarly for the other numbers.
Obviously, $[0]$, $[7]$, $[14]$, $[-28]$ are all different ways of
writing the same point in the circle so shadow notation is not unique,
but that’s not a huge surprise.

Now, can we do arithmetic on our shadow circle using the fact that we know how
to do arithmetic on the number line? Yes, here’s how: given two shadow points
$a$ and $b$, we can say:
choose a number whose shadow is $a$,
choose a number whose shadow is $b$,
add them, and take its shadow.
That’s the definition of addition of shadow points.
In notation: $[a] + [b] = [a + b]$.
That is: the sum of the shadows is the shadow of the sum.
A reasonable question is: since there are infinitely many numbers whose
shadow is $a$ and infinitely many numbers whose shadow is $b$,
will I get the same answer as you do if I choose different numbers whose
shadows are $a$ and $b$ than you do? Yes.

Colloquially, when we say “let’s compute $3 + 11 \mod 7$” we may be thinking
of $3$ and $11$ as integer integers or we may be thinking of them as integers mod 7;
in either case, what we do is add them as integers, get $14$,
then remember that $14$, $7$, $0$, etc. are all the same mod 7.
Since we can add any multiple of $7$ to $3$, $11$, or both and get the same answer,
we don’t worry too much if we are starting out with integer integers or
integers mod 7 which is a bit confusing.

The punchline is: arithmetic $\mod 7$ is actually shadow arithmetic downstairs
on the circle which we define in terms of ordinary arithmetic upstairs in the spiral,
ordinary integer arithmetic. We need a little formalism to make this concrete.


### Relations and Equivalence Relations ###

Given a set $S$, a relation on $S$ is a subset of ordered pairs of elements of $S$:
the pairs of elements that are related according to the relation.
Equivalently, a relation is a subset of S x S;
equivalently, a relation is a function $S \times S \to \{ 0, 1\}$ which,
for each pair $(a,b)$ is $1$ if $a$ is related to $b$ and $0$ otherwise.
That’s it. We write $a \sim b$ as a shorthand for “$(a,b)$ is in the relation $R$”
when it is clear which relation we are talking about.

Here’s a familiar example: take $S$ to be the integers, and define the relation “$a \sim b$ if (and only if) $b-a$ is a multiple of $7$”;
some pairs in this relation are $(0,7)$, $(0, 14)$, $(3, 10)$,
and some pairs not in this relation are $(1,2)$ and $(4, 13)$.

A particularly nice kind of relation is an equivalence relation.
This is a relation that satisfies three nice properties:

- reflexivity: $a \sim a$
- symmetry: if $a \sim b$, then $b \sim a$
- transitivity: if $a \sim b$ and $b \sim c$, then $a \sim c$

In words: every element is related to itself; if $a$ is related to $b$,
then $b$ is related to $a$;
if $a$ is related to $b$ and $b$ is related to $c$, then $a$ is related to $c$.

Given any set of people, “loves” is a relation that fails to be an equivalence
relation on all fronts:
you do not necessarily love yourself,
if you love someone, they may not love you,
and if you love someone and they love someone else, you may or may not love
that someone else.
This joke is due to [Robert Friedman][RF].

A relation that is an equivalence relation is:
on the set of integers, “$a \sim b$ if and only if $b - a$ is a multiple of 7”
(or, more generally, a multiple of any positive integer). Try it.

Another relation on the integers which is not an equivalence is
“$a \sim b$ if and only if $a < b$.”

If anyone says [“here are some axioms: reflexivity, symmetry, transitivity,”][ILC](pdf)
you should say “it sounds like we have defined an equivalence relation.”

We can also take any relation and add to it the minimum number of pairs necessary
for it to satisfy some or all of these properties.
This is called the reflexive (or symmetric or transitive or equivalence)
relation generated by a relation.

More generally, we can think of a relation as a subset of $S \times T$ where
$S$ and $T$ may be different sets.
Given a set of terms and a set of types, typing in the sense of type theory
is a relation like this that satisfies some rules.
See [Pierce][TAPL].

We’ll restrict to relations which are equivalence relations from here on out.

An equivalence relation on $S$ defines a bunch of subsets of $S$:
the subsets of elements related to each other via the relation.
We call these subsets _equivalence classes_.
If $s$ is an element of $S$, we write “the equivalence class of s” as $[s]$.
This should start looking familiar now:
the equivalence classes in arithmetic mod 7 are exactly the subsets of integers
that all have the same shadow.

Strictly speaking, we are conflating “the set of all points with the same shadow”
with the shadow point itself, but this shouldn’t be too confusing.
We have two sets—the set of shadow points and the set whose elements are sets of
points that all have the same shadow, i.e. the set of equivalence classes—and
a specific isomorphism between them, and we are identifying the two via our
chosen isomorphism so there is no ambiguity.

One useful thing about equivalence relations is that the equivalence classes
partition the set $S$:
that is, every element of $S$ is in exactly one equivalence class.
We can deduce this from three properties, e.g. $a \sim a$ so every element is
in at least one equivalence class, the equivalence class $[a]$, and so on.
This is clearly the case with our circle.

Forming the set of equivalence classes is called “modding out” or “quotienting by”
the equivalence relation.

Finally, if we have some extra algebraic structure on $S$, we can try to transport
it to $\ol{S}$.
Having an equivalence relation doesn’t let us do this automatically,
but we’ll see examples where we can do it.

### Modular arithmetic, again ###

Arithmetic mod 7 one more time: $S$ is the integers,
$\ol S$ is the set of equivalence classes $[0], [1], \ldots, [6]$,
the set of subsets of integers whose differences are multiples of 7,
and we can define addition on $\ol S$, exactly as we did,
by $[a] + [b] = [a + b]$.
The work left to do is to show that this is well-defined,
that we get the same answer no matter which element-whose-shadow-is-$a$ and
element-whose-shadow-is-$b$ we use to compute the result.
Let’s do this one out: if we choose different elements $a’$ and $b’$ that
are equivalent to $a$ and $b$, the fact that they are equivalent to $a$ and $b$
means we can write each as $a + 7m$ and $b + 7n$ for some integers $m$ and $n$.
Then we compute $[a' + b'] = [a + 7m + b + 7n] = [a + b + 7(n + m)] = [a + b]$,
that is, $a + b + 7(n + m) \sim a + b$ since their difference is a multiple of 7.
Thus, our definition of $[a] + [b]$ is independent of which elements of
[a] and [b] we use to compute it so is well-defined.

More generally, we don’t just have addition:
the integers are a group—a ring, even!—and we can define a whole group structure
on the set of equivalence classes:
we also have an identity, $[0]$, and additive inverses, $-[a]$ is $[-a]$.
With this group structure, the projection map $\pi: S \to \ol S$
which sends an integer to its equivalence class is a group homomorphism.
This is basically by construction: $\pi(a + b) = \pi(a) + \pi(b)$ since $\pi(a + b) = [a + b]$, $\pi(a) + \pi(b) = [a] + [b]$,
and we defined the latter to be the former.

Pithy summary: to do arithmetic mod 7, we

- define an equivalence relation on the integers
- mod out by that equivalence relation, that is, form the set of equivalence classes
- transport the group structure on the integers to the set of equivalence classes
  by defining, e.g. $[a] + [b] = [a + b]$
- do arithmetic downstairs, on the set of equivalence classes

### The integers from the natural numbers ###

Here’s another example: suppose we only have the natural numbers
$\N = 0, 1, 2, \ldots$
Can we construct the integers from these?
Intuitively: yeah by, like, taking pairs of natural numbers where the first
component is the positive part and the second component is the negative part.
This actually works! Like so: take the set of ordered pairs $\N\times \N$.
Now $\N$ is a monoid under addition and we can define a monoid structure on
$\N \times \N$ by doing addition component-wise:
$(a, b) + (c, d) := (a + c, b + d)$.
Define an equivalence relation on $\N\times \N$ by $(a,b) \sim (a + n, b + n)$
for any $n \in \N$.

Visually: take the $xy$-plane and consider the points with integer
coordinates that are both $\geq 0$, the first quadrant.
This is $\N\times \N$.
Now, draw all of the lines with slope $1$, the ones whose equation is $y = x + c$
for all integers $c$.
These lines are the equivalence classes.
Each of these lines intersects either the positive $x$-axis at a point of the form
$(a,0)$, goes through the origin $(0,0)$, or intersects the positive $y$-axis
at a point of the form $(0,b)$ so every equivalence class can be written
as $[(a,0)]$ or $[(0,0)]$ or $[(0,b)]$ (where $a,b >0$).
Dropping the brackets and parentheses and writing $a$ for the first,
$0$ for the second and $-b$ for the third,
we get the integers!

Less hand wavily: we can define a group structure on the set $\ol{\N \times \N}$
of equivalence classes, define a function $f: \ol{\N \times \N} \to \Z$
by $f[(a,b)] = a - b$,
show that $f$ is well-defined, show that $f$ is a group homomorphism,
then show that it is, in fact, an isomorphism.
That’s how we get the integers.

The is a special case of a general construction as we are about to see.

So: if you are, say, futzing around with the λ-Calculus and you’ve got
[Church numerals][CHURCH] (natural numbers) and are looking around for a way to
define the integers, this will do it.

Exercise: define the rational numbers from the integers using a similar construction.
The equivalence relation is a little trickier to write down, but not bad.


### The best group from a commutative monoid ###

I have been in many many conversations with programmers that go something like:
we have some monoid—data structure we know how to aggregate and that has a
zero/”neutral” element—and we want to be able to talk about subtraction, too,
and someone says “I know, let’s just take pairs of elements where the first
component is the positive part and the second component is the negative part!”
Yes, this works! With the caveat that we are working with equivalence classes
and will wind up with multiple ways to represent the same thing.

Nonetheless, what we just did is a special case of a totally general construction:
given any commutative monoid $(M, +, 0)$, we can define the analogous
equivalence relation on $M \times M$—$(a,b) \sim (a + m, b + m)$ for all $m\in M$—and
define a group structure on the set $\ol{M \times M}$ of equivalence classes.
The inclusion map $\iota: M \to \ol{M \times M}$, $\iota(m) = [(m,0)]$
is a monoid homomorphism.

This is “the best group we can make from $M$” in the following sense:
suppose we have another monoid $N$ and a monoid homomorphism $M \to N$,
if $N$ happens to actually be a group, we get, for free, a unique group homomorphism
$\ol{M \times M} \to N$.
Another way to say this is that $\ol {M \times M}$ satisfies a universal property.
This group is called the [_Grothendieck group_][GG] of the commutative monoid $M$.


### Some Grothendieck groups ###

Let’s do some programming-ish examples.

For any datatype `A`, we have the datatype `Set[A]` of sets (no repeated elements)
of values of type `A`.
This is a commutative monoid under union of sets,
where the empty set is the identity element.
We can form the Grothendieck group of this commutative monoid, but it is not
very interesting: we get the trivial group.
To see this, observe that

$$(s,t) \sim (s, t) + (s + t, s + t) = (s + s + t, t + s + t) = (s + t, s + t) \sim (empty,empty)$$

thus every pair $(s,t)$ in `Set[A] x Set[A]` is equivalent to `(empty, empty)`
so we have the trivial group.

Next, we can consider the datatype `MultiSet[A]` where we are allowed to have
repeated elements, but ordering doesn’t matter.
`MultiSet[A]` is isomorphic to the [free commutative monoid][FM] on `A` and
its Grothendieck group is isomorphic to the [free Abelian (commutative) group][FAG]
on `A`.
Working out this isomorphism is analogous to showing that the Grothendieck group
of the natural numbers is isomoprhic to the integers,
you can just write it down and show it or, since there are also free things and
universal properties floating around, you can use those, too.

The Grothendieck group of `MultiSet[A]` is called _bags with signed multiplicities_
in the [Incremental λ-Calculus][IncLC] and used there as a _change structure_
to define the derivative of a program.
As the name suggests, it consists of unordered bags of elements with integer
multiplicities.

Since we can count the _total_ number of elements in a multiset, we can count
the total number of changes, i.e. the total number of things in an element
of its Grothendieck group. Here's the general construction.

Suppose that $M$ is a datastructure that comes
equipped with a homomorphism  $count: M \to \mathbb N$.
Now suppose that we want to use $M$ to keep track of both additions and
deletions/subtractions of things so want to turn it into something fancier that has
a homomorphism to the integers.

As a first step toward constructing the Grothendieck group of $M$,
let’s form $M\times M$ and consider the function $f: M \times M \to \Z$
defined by $f(a,b) = count(a) - count(b)$.
This is a homomorphism and it descends to a well-defined homomorphism
$\ol f: \ol{M\times M} \to \Z$ defined by $\ol f([(a,b)]) = f(a,b)$.
This is well-defined because $f(a+m, b+m) = f(a,b)$.

So, if we can find a commutative monoid $M$ with a homomorphism to the
natural numbers, we can use its Grothendieck group to keep track of both
additions and subtractions of things and count the number of those using
our induced homomorphism to the integers.

We can do this with `MultiSet[A]` to count the total number of changes, but
we can't do it to count the number of _distinct_ changes:
the problem is that the number of distinct elements in
a union of multisets is definitely not the sum of the numbers of distinct
elements in each.

[HyperLogLog][HLL] is a cool datastructure for counting the _approximate_ number of
distinct elements in a multiset which _does_ form a commutative monoid in
exactly the way you would want:
so that the function that sends a multiset to an HLL into which the elements of
that multiset have been inserted is a homomorphism.
So we could form its Grothendieck group, but our counting construction
would fail again for the same reason:
that $approxCount: HLL \to \N$ is not a homomorphism.
We can only ask the approximate count of distinct elements
_after_ we've added all our HLLs. Sad trombone.
This might not be the most useful Grothendieck group as a result,
but there you have it.

Finally, in math, it is pretty common to have a commutative monoid
that you want to turn into a group:
[topological K-theory][KT], a basic tool in algebraic topology,
is one example.

Exercise: There is nothing special about the natural numbers in our counting
construction: for any homomorphism $f: M \to N$ of commutative monoids,
define the induced homomorphism $\ol f$ of Grothendieck groups.
What if we have two: $f: M\to N$ and $g: N \to O$?
How are $\ol{g\circ f}$ and $\ol g \circ \ol f$ related?
What does this say in category theory terms abut the Grothendieck group?

### Conclusion ###

That’s it! Equivalence relations, modular arithemtic,
constructing the integers from the natural numbers,
the Grothendieck group, and some examples of it.
I hope you enjoyed.

[IncLC]: https://inc-lc.github.io
[FAG]: https://en.wikipedia.org/wiki/Free_abelian_group
[FM]: https://en.wikipedia.org/wiki/Free_monoid
[KT]: https://en.wikipedia.org/wiki/Topological_K-theory
[HLL]: https://twitter.github.io/algebird/datatypes/approx/hyperloglog.html
[GG]: https://en.wikipedia.org/wiki/Grothendieck_group
[CHURCH]: https://en.wikipedia.org/wiki/Church_encoding
[RF]: http://www.math.columbia.edu/~rf/
[ILC]: http://www.cse.chalmers.se/research/group/logic/TypesSS05/Extra/geuvers.pdf
[TAPL]: https://www.cis.upenn.edu/~bcpierce/tapl/
