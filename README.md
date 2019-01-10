This is an exercise based on https://www.youtube.com/watch?v=OMPfEXIlTVE.

This is a great talk and I recommend watching it. There a lot of good content but I disagree with Sandi in some remarks:

- I believe inheritance is for sharing code, while she claims it isn't.
- I believe mixins are a better solution for implementing roles than dependency injection.

The advantages of using mixin are:

- Strategy can be chosen at runtime when using the object instead of when constructing it. In Sandi's version you would have to either
  know before hand which version of house you need or delay construction of the object to the last minute forcing you to deal with
  intermediary representations.
- If you know before hand, then the concepts of `RandomHouse`, `EchoHouse` and `RandomEchoHouse` are part of your domain
  and should be expressed as first class citizens in your model instead of being just some combinations of parameters.
  Using mixins you can reify those concepts as classes

As I said, the talk is great and I highly recommend it. I understand what Sandi is trying to teach there and it's worth learning.
The only disagreement I have is how to better implement the roles.
