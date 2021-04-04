# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) where n is the total number of characters in all strings
# >> Go through each character in every string by visiting each string in array
# and each character in each string
# >> O(1) for ord
# >> O(k), where k == num strings in input array, to get all hash values
# Space Complexity: O(n)
#
# Notes:
# >> considered just assigning score using ord,
# but this doesn't account for diff combinations of letters that sum to same score
# >> FIX:
# >> keep track of individual alphabet chars using array w/ 26 indices
# >> index into that array using ch.ord - 'a'.ord (to baseline 'a' to 0)

def grouped_anagrams(strings_arr)
  anagrams_hash = {}
  strings_arr.each do |str|
    char_counts = [0] * 26
    str.each_char { |ch| char_counts[ch.ord - 'a'.ord] += 1 }
    if anagrams_hash[char_counts]
      anagrams_hash[char_counts] << str
    else
      anagrams_hash[char_counts] = [str]
    end
  end

  return anagrams_hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occurring element.
# Time Complexity: ?
# Space Complexity: ?
#
# PSEUDOCODE:
# >> iterate through all elems in list and populate hash with count -- O(n)
# >> invert hash O(n)
# >>
def top_k_frequent_elements(list, k)

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
