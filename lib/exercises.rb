
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: ?
# Space Complexity: ?

def grouped_anagrams(strings)
  return [] if strings.length == 0
  array = strings.group_by { |string| string.chars.sort }.values
  return array
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  return [] if list.empty?

  counter_hash = Hash.new(0)

  list.each do |num|
    counter_hash[num] += 1
  end

  sorted_hash = counter_hash.sort_by {|key, value| -value}
  
  array = []
  
  i = 0
  while i < k do 
    array << sorted_hash[i][0]
    i += 1
  end

  return array

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
