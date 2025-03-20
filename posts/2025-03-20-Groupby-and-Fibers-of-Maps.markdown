---
title: `GROUP BY` and Fibers of Maps
---

Grouping a collection of `A`s by the values of some function `f: A -> B`.
Fibers of maps, in general.
They partition the domain.
Example: all the "good/bad/whatever" pairs leetcode questions e.g.
given an array `nums` of integers, find all distinct pairs of indices `(i, j)`
for which `f(i, nums[i]) = f(j, nums[j])` for some function `f: Indices x Values -> Int`.
