require 'byebug'
#Given a list of integers find the smallest number in the list.
#Example:

    # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
    # my_min(list)  # =>  -5

# Phase I

# First, write a function that compares each element to every other element of the list. 
# Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

def my_min(list)
    list.inject { |min,ele| min < ele ? min : ele }
    
    # Time  : O(n)
    # Space : O(1)
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# Phase II

# Now rewrite the function to iterate through the list just once while keeping track of the minimum. 
# What is the time complexity?

def my_min(list)
    smallest = 0
    
    list.each_with_index do |ele1, idx1|
        list.each_with_index do |ele2, idx2|
            if idx2 > idx1 
                if ele1 < smallest
                    smallest = ele1
                end
                if ele2 < smallest
                    smallest = ele2
                end
            end
        end
    end

    smallest
end


# time : O(n^2)
# space: O(1)
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. 
# Find the sums of all contiguous sub-arrays and return the max.

def largest_contiguous_subsum(arr)
    all_sub_arrays = [] # space : O(n^2)

    (0...arr.length).each do |i|
        (i...arr.length).each do |i2|
            all_sub_arrays << arr[i..i2]  # slice makes n^3
        end
    end

    all_sub_arrays.map { |sub_arr| sub_arr.sum }.max # O(n^2)
end

# Time  : O(n^3)
# space : O(n^2)

# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops. 
# First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.

# Discuss the time complexity of this solution.


# together in sequence
 [1,2,3,4] # [1,2]
def largest_contiguous_subsum(list)
    largest = list[0] # 2
    current_sum = list[0] # 2

    (1...list.length).each do |i| # 1...list_length 2
        current_sum += list[i] # current_sum += -5
        if current_sum > largest # -5 > 7
            largest = current_sum # 7
        end
        current_sum = 0 if current_sum < 0 # current_sum = 1
    end
    largest
end

# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory.  <<< 
# Keep a running tally of the largest sum. To accomplish this efficient space complexity, consider using two variables. 
# One variable should track the largest sum so far and another to track the current sum. We'll leave the rest to you.

# Get your story straight, and then explain your solution's time complexity to your TA.

# Example: 
list = [5, 3, -7] 
p largest_contiguous_subsum(list) # => 8
list2 = [2, 3, -6, 9, -6, 7]
p largest_contiguous_subsum(list2) # => 10 (from [7, -6, 7])
 list3 = [-5, -1, -3]
p largest_contiguous_subsum(list3) # => -1 (from [-1])
list4 = [-5,-1,-2,-3]
