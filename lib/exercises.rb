
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n^2)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  hash = Hash.new
  strings.each do |string|
    if hash[str_to_int(string)]
      hash[str_to_int(string)] << string
    else
      hash[str_to_int(string)] = [string]
    end
  end

  return hash.values
end

def str_to_int(string)
  return string.chars.map { |char| char.ord }.sum
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  return list if list.empty? || list.length == 1

  hash = Hash.new(0)
  list.each { |int| hash[int] += 1 }

  nested_array = hash.sort_by { |k, v| -v }

  k_most_frequent = []
  k.times { |i| k_most_frequent << nested_array[i][0] }
  return k_most_frequent
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
