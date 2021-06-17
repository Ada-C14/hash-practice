
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) where n is number of strings
# O(n) to build strings_map, O(n) to build reverse_map, O(n) to build answer_array
# Space Complexity: O(n) where n is number of strings
# While there is a large amount of data structures, they scale linearly

def grouped_anagrams(strings)
  # Put strings into hash map of string -> # of occurrences of character
  # Luckily {a:1, b:2} == {b:2, a:1}
  strings_map = {}
  strings.each do |string|
    letter_map = Hash.new(0)
    string.each_char do |char|
      letter_map[char] += 1
    end

    strings_map[string] = letter_map

  end

  # Reverse the hash
  reverse_map = Hash.new([])
  strings_map.each do |key, value|
    if reverse_map[value] == []
      reverse_map[value] = [key]
    else
      reverse_map[value].push(key)
    end
  end

  # Build answer array
  answer_array = []
  reverse_map.each do |key, value|
    answer_array.push(value)
  end

  return answer_array
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
