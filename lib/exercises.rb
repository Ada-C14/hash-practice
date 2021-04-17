
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * m(logm)), n = num of strings, m = length of string
# Space Complexity: O(n) where n is the number of anagram groups

def grouped_anagrams(strings)
  # assumptions:
  # all strings 3 letters

  strings_hash = Hash.new
  strings.each do |string|
    key = string.split('').sort #O(n) + O(log n)
    # split into letters, alphabetize, use as key
    if strings_hash[key]
      strings_hash[key].push(string)
    else
      strings_hash[key] = [string]
    end
  end

  return strings_hash.values

end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n), where n is number of elements
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)

  # assumptions:
  # list is integers, non-empty - do account for 1 num arr
  nums_hash = Hash.new
  list.each do |num|
    if nums_hash[num]
      nums_hash[num] += 1
    else
      nums_hash[num] = 1
    end
  end

  most_frequent = nums_hash.values.max(k)

  if most_frequent.length == 1 # if it's a tie, return the first only
    nums_hash.each_key do |key|
      return [key]
    end
  end

  keys_arr = [] # otherwise, return an array

  nums_hash.each_key do |key|
    if most_frequent.include?(nums_hash[key])
      keys_arr.push(key)
    end
  end

  return keys_arr
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: ?
# Space Complexity: ?
def valid_sudoku(table)
  raise NotImplementedError, "Method hasn't been implemented yet!"
end
