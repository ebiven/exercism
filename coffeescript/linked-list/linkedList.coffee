class Node
  constructor: (value, prev, next) ->
    @value = value
    @prev = prev || null
    @next = next || null

module.exports = class LinkedList
  constructor: () ->
    @head = null
    @tail = null
    @count = 0

  pushNode: (value) ->
    @count += 1
    if @tail is null
      @head = new Node(value)
      @tail = @head
    else
      n = new Node(value, @tail)
      @tail.next = n
      @tail = n

  popNode: () ->
    return undefined if @tail is null
    @count -= 1
    tailValue = @tail.value
    @tail = @tail.prev
    tailValue

  unshiftNode: (value) ->
    @count += 1
    if @head is null
      @head = new Node(value)
      @tail = @head
    else
      n = new Node(value, null, @head)
      @head.prev = n
      @head = n

  shiftNode: () ->
    return undefined if @head is null
    @count -= 1
    headValue = @head.value
    @head = @head.next
    headValue

  deleteNode: (value) ->
    @count -= 1
    i = @tail
    while i isnt null
      if i.value == value
        i.prev.next = i.next if i.prev
        i.next.prev = i.prev if i.next
        @tail = null if i == @tail
        @head = i.next if i == @head
        break

      i = i.prev

  countNodes: () -> @count
