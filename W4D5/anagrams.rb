# Our goal today is to write a method that determines if two given words are anagrams. 
# This means that the letters in one word can be rearranged to form the other word. 

# For example:

# Assume that there is no whitespace or punctuation in the given strings.

def anagram?(str_1,str_2)
    str_1.split("").permutation.to_a.each do |anags| # [ ['g','i','z'],['g','i'],['g','i','z','m','o'] ]
        return true if str_2 == anags.join("")
    end
    false
end

#Time : O(n * n!)
#Space: O(n!)


# p anagram?("gizmo", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true
# Phase I:
# Write a method #first_anagram? 
# that will generate and store all the possible anagrams of the first string. 
# Check if the second string is one of these.

# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?


# Phase II:
# Write a method #second_anagram? that iterates over the first string. 
# For each letter in the first string, find the index of that letter in the second string 
# (hint: use Array#find_index) and delete at that index. 
# The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.

# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??


def second_anagram?(str_1,str_2)

    str_2_arr = str_2.split("")

    str_1.split("").each_with_index do |char,idx|
        if str_2_arr.index(char) != nil
            str_2_arr.delete_at(str_2_arr.index(char))
        end
    end

    str_2_arr.empty?
end
# Time : O(n * m)
# Space : O(n)

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

# Phase III:
# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. 
# The strings are then anagrams if and only if the sorted versions are the identical.

# What is the time complexity of this solution? Is it better or worse than #second_anagram??

def third_anagram?(str_1, str_2)
    str_1.split("").sort == str_2.split("").sort # 
end

# Time : O(n log n)
# Space: O(n)

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

# Phase IV:
# Write one more method #fourth_anagram?. 
# This time, use two Hashes to store the number of times each letter appears in both words. 
# Compare the resulting hashes.

# What is the time complexity?
# Discuss the time complexity of your solutions together, then call over your TA to look at them.

def fourth_anagram?(str_1,str_2)
    hash_1 = Hash.new(0)

    str_1.each_char { |char| hash_1[char] += 1}
    str_2.each_char { |char| hash_1[char] -= 1}

    hash_1.all? { |k,v| v == 0 } 
end
# Bonus: Do it with only one hash.
# Time  : O(n)
# Space : O(1)


# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true