
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) if you pretend line 12 is a simple mathematically based hashing function,
# probably O (n * n log n) as for each string you have to sort the string to get a key for 
# the hash. 

# Space Complexity: O(n) - worst case is one string to one key, which is linearly dependent on 
# the number of strings in the input array -- for an array of N strings, the has will at minimum expand
# to hold N elements, and at most 2 * N elements

# assume all anagrams are unique 
def grouped_anagrams(strings)
  string_hash = {}

  strings.each do |string|
    key = string.split("").sort.join # probably an O(n log n) operation, I couldn't find an integer based hashing function i liked

    string_hash[key] ||= [] # trying this thing out
    string_hash[key] << string
  end
  
  return string_hash.values # also probably an O(n) operation
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  raise NotImplementedError, "Method hasn't been implemented yet!"
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
