
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  hash = {}

  strings.each do |str|

    anagram_key = str.chars.sort

    if hash[anagram_key]
      hash[anagram_key] << str
    else
      hash[a_key] = [str]
    end
  end 

    return hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  hash = Hash.new(0)
  k_array = []

  return [] if list.empty?
 
  list.each do |num|
    hash[num] += 1
  end

  descending_hash = hash.sort_by {|key, value| -value}

  k.times do |i|
    k_array << descending_hash[i][0]
  end

  return k_array
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
