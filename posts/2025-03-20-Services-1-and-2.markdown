---
title: Services
---

Talk about services vs. monoliths
1. at Stripe, preface with the state in 2016, then talk about
needing rules on top of multiple models in 2019
2. at Spotify, Jukebox architecture vs. monolith.

What are services trying to solve?
1. Enforce interfaces, make it impossible for users to reach around the interface
and rely on implementation details.
2. Enable things implemented in different language communicate.
3. Create / enforce "separation of concerns": make it so that each component has
clear responsibilities and boundaries.

I'm sure there are many other reasons, too, but in the two cases I will talk about,
these were the primary motivations.

So that my argument is clear up front:
I think there are plenty of other ways to do 1 and 2.
And for 3, I think services create an illusion of safety, but do not actually
create clear responsibilities and boundaries between components, people have to do that.

So I guess the actual punchline is: when engineers on a team have a shared vision
of how the system they are building should work i.e. an overarching design philosophy,
a set of principles to follow when adding new functionality or restructering existing code,
a shared "how should I think about this" that they would articulate to a new teammate,
that is what enables 1 and 3; 2 a technical problem with various solutions.
One valid solution is: don't do it! (link to: funny game, dr. fawlking, the best strategy is not to play at all.")

I'm mostly here to just tell a couple stories.
Coming out of Stripe, it felt like "monoliths are so constraining, services are so liberating" services make everything so much easier.
At Spotify, it felt like "why is my team's system made up of two services and a data processing component, when this could all just be one thing with clear interfaces."

