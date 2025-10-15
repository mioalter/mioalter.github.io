---
title: Implicit Dependencies and Graphs of Functions
---

Imagine we have a function `makeGRPCQuery(ctx Context, str String) -> Request`
that looks like it takes two independent arguments and constructs protobuf `Request` object,
but, when we look at where this function is called, we realize that we only ever call it with
`query := makeGRPCQuery(ctx, ctx.TextField())`.

Describe the abstract pattern.
Introduce graphs.
Given an example with numbers.
