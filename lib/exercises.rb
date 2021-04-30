
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  anagrams = {}
  strings.each do |string|
    sorted_string = string.split('').sort.join
    if anagrams[sorted_string]
      anagrams[sorted_string] << string
    else
      anagrams[sorted_string] = [string]
    end
  end
  return anagrams.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(nlog(n))
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  return list if list.length == k
  return [] if list.length == 0
  frequency = {}
  list.each do |element|
    if frequency[element]
      frequency[element] += 1
    else
      frequency[element] = 1
    end
  end

  sorted_hash = frequency.sort_by{|k, v| -v}
  result = []
  index = 0
  k.times do
    result << sorted_hash[index][0]
    index += 1
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
