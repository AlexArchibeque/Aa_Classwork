# two_sum?
# Given an array of unique integers and a target sum, determine whether any two integers in the array sum to that amount.

# def two_sum?(arr, target_sum)
#     # your code here...
# end

def bad_two_sum?(arr, target_sum)
    arr.each_with_index do |ele1, i1|
        arr.each_with_index do |ele2, i2|
            return true if i2 != i1 && (ele1 + ele2 == target_sum)
        end
    end

    false
end

# Time : O(n^2)
# Space: O(1)

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

# #2 Sort your data, then try to solve the problem.

# have we reached the end or 



# def okay_two_sum?(arr,target_sum) # (6 - 1)  5 << 
#     return false if arr == []
#     start = arr.shift  # 
#     tgt_sum = target_sum - start 
#     arr.each { |el| return true if el == tgt_sum } # n
#     okay_two_sum?(arr,target_sum) # log_n
# end

# [1,5]

def okay_two_sum?(arr,target_sum)
    length = arr.length

    left = arr.shift # 1
    right = arr.pop  # 5

    length.times do
        if left + right == target_sum # 5+0 == 6
            return true 
        elsif (left + right) > target_sum # 5 > 6
            right = arr.pop #
        else
            left = arr.shift #
        end
    end

    false

end
# Time  : O(n)
# Space : O(1)

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false


# Hash Map
# Finally, it's time to bust out the big guns: a hash map. 
# Remember, a hash map has O(1) #set and O(1) #get, so you can build a hash out of each of the n elements in your array in O(n) time. 
# That hash map prevents you from having to repeatedly find values in the array; now you can just look them up instantly.

# See if you can solve the two_sum? problem in linear time now, using your hash map.

# Once you're finished, make sure you understand the time complexity of your solutions and then call over your TA and show them what you've got. 
# Defend to them why each of your solutions has the time complexity you claim it does.


def great_two_sum(arr,target_sum)
    hash = {}
    arr.each do |ele|
        hash[ele] = true
        return true if hash[target_sum-ele]
    end
    false
end
# Time  : O(n)
# Space : O(n) 

# 1 ==> memory space as ==> 1238109248091274589012748912708934718923478913478901278901278903

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false