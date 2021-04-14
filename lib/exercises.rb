
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n*m), when build the hash table, it's O(n) (n is the size of the list), 
#                          and the inner sort depends on the lenght of the word, 
#                          so it will be O(n)*O(m) --> O(n*m).
# Space Complexity: O(n), the worst case scenarios for hash table and result are O(n).
#                         So it will be O(n)*2 --> O(n) (n is the size of the list).

def grouped_anagrams(list)
  result = []
  index = 0
  hash = {}
  list.each do |word|
    sorted_word = word.chars.sort
    if !hash[sorted_word]
      hash[sorted_word] = index
      result[index] = []
      index += 1
    end
    result[hash[sorted_word]].push(word)
  end
  return result
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(nlogn), when build the hash table, it's O(n), next I turn the hash to an array and sort it, it could be O(nlogn). 
#                            Last, for the worst case scenario, if k equals to the size of the list, it would be another O(n).
#                            Total is O(n)+O(nlogn)+O(n), so it's O(nlogn) (n is the size of the list).
# Space Complexity: O(n), the worst case scenarios for hash table and sorted_array are O(n).
#                         So it will be O(n)*2 --> O(n) (n is the size of the list).
def top_k_frequent_elements(list, k)
  hash = {}
  list.each do |num|
    if hash[num]
      hash[num] += 1
    else
      hash[num] = 1
    end
  end

  sorted_array = hash.to_a.sort { |a, b| b[1] <=> a[1] }

  return sorted_array.take(k).map { |num| num[0] }
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
