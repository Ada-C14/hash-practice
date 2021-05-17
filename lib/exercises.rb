
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
# Time Complexity: O(n^2) because of the .sort_by used mid method
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  return [] if list.nil? || list == []
  
  frequency_hash = Hash.new

  list.each do |integer|
    if frequency_hash[integer]
      frequency_hash[integer] += 1
    else
      frequency_hash[integer] = 1
    end
  end

  descending_freq_array = frequency_hash.sort_by {|k,v| -v}

  i = 0
  output_array = []
  until i == k do
    output_array << descending_freq_array[i][0]
    i += 1
  end
  return output_array
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
