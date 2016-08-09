module.exports = class Bst
  constructor: (value) ->
    @data = value
    @left
    @right

  insert: (value) ->
    insert_to = if value <= @data then 'left' else 'right'
    if @[insert_to]
      @[insert_to].insert(value)
    else
      @[insert_to] = new Bst(value)

  each: (f) ->
    @left.each(f) if @left
    f(@.data)
    @right.each(f) if @right
