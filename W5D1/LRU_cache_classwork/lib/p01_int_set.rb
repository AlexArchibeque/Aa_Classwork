class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max,false)
  end

  def insert(num)
    if num > @store.length || num < 0
      raise "Out of bounds"
    else
      @store[num] = true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    if @store[num] == true
      true
    else
      false
    end
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % 20] << num
  end

  def remove(num)
    if include?(num)
      @store[num % 20].delete(num)
    end
  end

  def include?(num)
    @store[num % 20].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      @store[num % num_buckets] << num
      @count += 1
    end
    if @count > num_buckets
      resize!
    end
  end

  def remove(num)
    if include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length # 20
  end

  def resize!
    num = num_buckets
    num.times { @store << [] }

    @store.flatten.each do |ele|
      @store[ele % num_buckets] << ele
    end
  end
end
