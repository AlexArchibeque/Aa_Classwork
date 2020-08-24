require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).each do |node|
      return true if node.key == key
    end
    false
  end

  def set(key, val)
    if self.include?(key)
      bucket(key).update(key, val)
    else
      bucket(key).append(key, val)
      @count += 1
      resize! if @count > num_buckets
    end
    self.to_s
  end

  def get(key)
    bucket(key).each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def delete(key)
    if self.include?(key)
      bucket(key).remove(key)
      @count -= 1
    end
  end

  def each
    @store.each do |list|
      list.each do |node|
        yield([node.key,node.val])
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{#{pairs.join(", ")}}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    arr_dup = @store.dup
    @store = Array.new(num_buckets*2) { LinkedList.new }
    @count = 0
    arr_dup.each do |list|
      list.each do |node|
        set(node.key,node.val)
      end
    end
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end
end

new_h = HashMap.new

new_h[1] = "a"
new_h[2] = "b"
new_h[3] = "c"
new_h[4] = "d"
new_h[5] = "d"
new_h[6] = "d"
new_h[7] = "d"
new_h[8] = "d"
new_h[9] = "d"


new_h.each { |node| puts node.to_s }
