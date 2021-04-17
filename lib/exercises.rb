
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

def grouped_anagrams(strings)

  hash = {}

  strings.each do |word| 
    char_arr = word.split("").sort

    if hash[char_arr]
      hash[char_arr] << word
    else
      hash[char_arr] = [word]
    end
  end

  return hash.values

end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n * k)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)

  return list if list.empty? 

  hash = {}
  
  list.each do |num|
    if hash[num]
      hash[num] += 1
    else
      hash[num] = 1
    end
  end

  result = []

  k.times do
    max = hash.values.max
    max_freq = hash.key(max)

    if max_freq
      result << max_freq
      hash.delete(max_freq)
    end

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
