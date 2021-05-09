
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * m) n is the length of the array, m is the max length of string within the array. 
# Could pull chars method to run first on each element of strings, for O(n) n being the longest string or array.
# Space Complexity: O(n)

def grouped_anagrams(strings)
  return [] if strings.nil?
  return [] if strings.empty?

  counts_hash = Hash.new([])
  strings.each do |string|
    counts_hash[string.chars.sort] += [string]
  end
  return counts_hash.map {|k, v| v}
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n) n is list length
# Space Complexity: O(n^2 * k) is that right?
def top_k_frequent_elements(list, k)
  return [] if list.nil?
  return [] if list.empty?
  
  counts_hash = Hash.new(0) # space = O(n)
  list.each do |num|
    counts_hash[num] += 1
  end

  sorted_values_2d = counts_hash.sort_by {|k, v| -v} # space = O(n)
  
  k_most_common_ele = [] # space = O(k)
  k.times do |i|
    k_most_common_ele << sorted_values_2d[i][0]
  end
  return k_most_common_ele
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
