class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
  
  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList

  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    if @head.next == @tail
      true
    else
      false
    end
  end

  def get(key)
    if self.include?(key)
      self.each {|node| return node.val if node.key == key}
    end
  end

  def include?(key)
    self.any? {|node| node.key == key }
  end

  def append(key, val)
    new_node = Node.new(key,val)

    @tail.prev.next = new_node
    new_node.prev = @tail.prev

    @tail.prev = new_node
    new_node.next = @tail
  end

  def update(key, val)
    self.each do |node|
      node.val = val if node.key == key
    end
  end

  def remove(key)
    if include?(key)
      self.each do |node|
        if node.key == key
          node.prev.next = node.next
          node.next.prev = node.prev
          node.next = nil
          node.prev = nil
          break
        end
      end
    end
    #could return self, removed node, nil etc
  end

  def each
    f = self.first
    until f == @tail
      yield(f)
      f = f.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
