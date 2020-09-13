---
title: A Functional Data Remodel
---

# Intro
This is a short post about a piece of work that my
team did at work to rejigger a data model we inherited.
The original design was informed by object-oriented thinking and the
design that we ended up with is more functionally flavored.
Hopefully this post will make a good case for the clarity and flexibility of
the latter.

# Context
Very brief context: my team at Spotify is under an umbrella that builds
Machine Learning infrastructure, we are currently focued _features_ for ML models.
We'll talk a bit more about features in another post, for our purposes: these
are the input data needed to build and use ML models.
Features are _about_ things: "user age" is about a user,
"user-artist afinity score" is about a user-artist pair.
The things that features are _about_ we call _entities_;
this post is about how we model entities.

We use entities to say both what a given set of features is about
and how to join different sets of features together.
A given set of features can have a singular (user, artist, track, ...)
or plural (user-artist, user-track,...)  thing it is about
and each singular thing can have multiple types of id: there are various
formats of user id, an artist can be identified by an id or a uri, etc.
A feature set about user-artist relationships will have
both some kind of user id column and some kind of artist id column.
We may want to join in features about just users or just artists,
and we'll have to know what kinds of user and artist ids we have to do those joins.

# The Original Data Model

The original data model looked something like this

```
message Entity {
  String name = 1;
  repeated EntityKeyType entity_key_types = 2;
}

message EntityKeyType {
  String name = 1;
  repeated EntityKey entity_keys = 2;
}

message EntityKey {
  String name = 1;
}
```

so an `Entity` can have a name like `user`, `artist` or `user_artist`,
the `EntityKeyType` is the singular thing, `user`, `artist`, or the list
`[user, artist]`, respectively, of which the `Entity` consists,
and the `EntityKey` is the kind of identifier each `EntityKeyType` has,
e.g. `user` has `user_id_hex`, `user_id_base62`, etc.
Note that the actual value of the user id, say, is not reprsesented here,
we just care about the things, their constituent things, and the kinds of
identifiers of those constituent things.

So, an `Entity` is a list of one or more things;
each of those things can have one or more kinds of identifiers.
That's all that is going on.
But! Having a hierarchy of things each of which _has a_ list of the next
level of thing obscures what the building blocks are and how we are allowed
to combine them.

Also, nit: `Entity.name` is actually just a string representation of the other
field which is a list, not an independent piece of information.

Mathy aside: a "has a" relationship just says "there is a function", but does
not tell you anything about it. "An A has a B" just says "there is a function
from As to Bs", but not how much or little about the A is captured by resulting B.

# The New Data Model

Our observation was: there are two kinds of building blocks

* the _primitive/singular_ entities: user, artist, track, podcast, etc.
* the kinds of identifiers: id_hex, id_base62, gid, uri, etc.

There are two kinds of things we can build with these:

* we can build compound entities by making sets/lists of distinct primitive entities
* we can build primitive entity identifiers by forming `(primitive entity, identifer)` pairs

In types/aspirational pseudo-Scala:

* we have two union types `PrimitiveEntity` and `Identifier`
* `Entity = ListOfDistinct[PrimitiveEntity] / Set[PrimitiveEntity]`
* `PrimitiveEntityIdentifier = (PrimitiveEntity, Identifier)`

Now, an Entity _is a_ list of primitive entities.
A PrimitiveEntity has a list of PrimitiveEntityIdentifiers because
PrimitiveEntityIdentifiers are explicitly (PrimitiveEntity, Identifier) pairs.

Concretely, for a given primitive entity `pe`, the list of tuples `(pe, _)` is the
list of primitive entity identifiers corresponding to that primitive entity.
Each primitive entity still has a list of primitive entity identifiers, e.g.
user has user_id_hex, user_id_base62,
but that list doesn't have to be a field on PrimitiveEntity,
we get it by having a couple of types and functions between them.

Mathily: there is a projection function

```
π: (PrimitiveEntity, Identifier) => PrimitiveEntity
```

and for a given primitive entity `pe`, the _fiber/inverse-image_ of π over `pe`,
is the collection of tuples upstairs that maps to `pe` downstairs. That is the
list of primitive entity identifiers corresponding to that primitive entity.

The new model in proto is

```
message Entity {
  repeated String primitive_entity_names = 1;
}

message PrimitiveEntity { // fka EntityKeyType
  String name = 1;
}

message PrimitiveEntityIdentifier { // fka EntityKey
  String primitive_entity = 1;
  String identifier = 2;
}
```

If we want an Entity to have a name,
we can define a function `Entity => String`
which is basically `Entity.primitiveEntityNames.mkString("_")`.

# Conclusion

This doesn't look like much of a change, but it is actually pretty significant.
We exploded the hierarchy of things each of which _has a_ list of the next
things on it.
It is now clear what the basic things are,
which things are built from other things and how,
and we have much more flexibility in how we program with these new types.
