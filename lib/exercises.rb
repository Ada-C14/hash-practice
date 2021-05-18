
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: o(n)
# Space Complexity: o(n)

def grouped_anagrams(strings)
  hash = {}
  return [] if strings.nil? || strings.empty?

  strings.each do |string|
    key = string.chars.sort.join
    if hash.include?(key)
      hash[key] << string
    else
      hash[key] = [string]
    end 
  end 
  return hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: o(n)
# Space Complexity: o(n)
def top_k_frequent_elements(list, k)
  return [] if list.length == 0
  
  hash = {}

  list.each do |element|
    if hash[element]
      hash[element] += 1
    else
      hash[element] = 1
    end
  end

  sorted = hash.sort_by {|key, value| -value }
  result = []
  k.times do |index|
    result << sorted[index].first
  end
    return result

end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or moregit in the same 
#   row, column or 3x3 subgrid
# Time Complexity: ?
# Space Complexity: ?
def valid_sudoku(table)
  raise NotImplementedError, "Method hasn't been implemented yet!"
end
