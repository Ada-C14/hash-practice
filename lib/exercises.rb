
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

def grouped_anagrams(strings) 
  grouped_anagrams = []
  hash_table = {}

  strings.each do |word|
    letters = word.split("").sort!  

    if hash_table.key?(letters)
      hash_table[letters] << word
    else 
      hash_table[letters] = [word]
    end 
  end 

  hash_table.each do |k, v|
    grouped_anagrams << v 
  end 

  return grouped_anagrams
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: o(n)
# Space Complexity: o(n)
def top_k_frequent_elements(list, k)
  # raise NotImplementedError, "Method hasn't been implemented yet!"
  return [] if list.empty?

  result = []
  hash = Hash.new(0)

  list.each do |num|
      hash[num] += 1
  end

  # sort values in descending order
  sorted_hash = hash.sort_by {|k,v| -v}  
  # [[1, 3], [2, 2], [3, 1]]

  i = 0
  while i < k do 
      result << sorted_hash[i][0]
      i += 1
  end
  return result   
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
