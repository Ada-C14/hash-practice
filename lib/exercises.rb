
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(nm(log m)) + O(n) (sort_by for each string + length of strings array)
# Space Complexity: O(n) (hash size increases with input array length, no other data structures made)

def grouped_anagrams(strings)
  anagrams = {}
  strings.each do |string|
    abc_string = string.chars.sort_by(&:downcase).join
    if !anagrams[abc_string]
      anagrams[abc_string] = []
    end
    anagrams[abc_string] << string
  end 
  puts anagrams
  return anagrams.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n) + O(n logn) ( sort is nlogn, list.each is n, map is n)
# Space Complexity: O(n) (multiple same sized arrays)
def top_k_frequent_elements(list, k)
  # raise NotImplementedError, "Method hasn't been implemented yet!"
  return list if list.empty?
  
  counted = {}
  list.each do |num|
    if counted[num] 
      counted[num] += 1
    else 
      counted[num] = 1
    end
  end

  sorted = counted.sort {|a,b| b[1]<=>a[1]}
  keys = sorted.map { |n| n[0] }

  return keys.slice(0, k)
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
