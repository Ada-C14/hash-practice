
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * klog(k)) where n is the number of strings and k is the length of each string. 
# Space Complexity: O(n) - using hash to store each word. 
# Does having an array as a key increase the space complexity?

def grouped_anagrams(strings)
  # Create a hash table
  anagrams = {}
  # Keys will be sorted word
  # values will be the arrays of words that are anagrams of sorted word. 
  strings.each do |word|
    sorted_word = word.split('').sort.join
    if anagrams.has_key?(sorted_word)
      anagrams[sorted_word].push(word)
    else
      anagrams[sorted_word] = [word]
    end
  end
  return anagrams.values
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
