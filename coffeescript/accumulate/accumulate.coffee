# I assume part of the point of this exercise is to learn to extend
# prototypes, but hopefully nobody ever actually does this in
# practice.
Array::accumulate = (fn) -> fn i for i in @
