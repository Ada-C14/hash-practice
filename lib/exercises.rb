
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n log n) - ruby's quicksort is O(n log n)
# Space Complexity: O(n) - creation of the anagrams hashmap

def grouped_anagrams(strings)
  return [] if strings.empty?
  anagrams = Hash.new{|h,k| h[k] = []}

  strings.each do |word|
    sorted = word.chars.sort
    anagrams[sorted] << word
  end

  anagrams.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n log n) - internal sort_by
# Space Complexity: O(n) - hashmap and arr data structure creation
def top_k_frequent_elements(list, k)
  return [] if list.empty?

  hash = Hash.new(0)
  list.each {|num| hash[num] += 1 }
  sorted_hash = hash.sort_by {|k, v| -v}

  arr = []
  k = k - 1
  while k >= 0 
    arr.unshift(sorted_hash[k][0])
    k -=1
  end

  arr
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
