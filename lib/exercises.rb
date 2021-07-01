# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n log n)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  return [] if strings.empty?

  groups = {}
  strings.each do |string|
    sorted = string.chars.sort 

    if groups[sorted]
      groups[sorted] << string
    else
      groups[sorted] = [string]
    end
  end

  return groups.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)

  frequency_hash = {}
  list.each do |n|
    if frequency_hash[n] 
      frequency_hash[n] += 1
    else 
      frequency_hash[n] = 1
    end 
  end 

  answer = []
  k.times do 
    highest_freq = 0
    frequency_hash.each_value do |value|
      highest_freq = value if value > highest_freq
    end 
    most_frequent_ele = frequency_hash.key(highest_freq)
    answer << most_frequent_ele if most_frequent_ele
    frequency_hash.delete(most_frequent_ele)
  end 

  return answer
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
