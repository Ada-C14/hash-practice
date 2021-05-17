
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  anagrams_hash = Hash.new
    
  strings.each do |string|
    alphabetically_sorted_string = string.chars.sort
      if anagrams_hash[alphabetically_sorted_string]
        anagrams_hash[alphabetically_sorted_string] << string
      else
        anagrams_hash[alphabetically_sorted_string]=[string]
      end
  end

  output_array = []
  anagrams_hash.each do |key,value|
    output_array << value
  end

  return output_array
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
