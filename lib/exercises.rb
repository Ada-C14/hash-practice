
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * s * log(s)) , where s = string length
# Space Complexity: O(n)



def grouped_anagrams(strings)
  return nil if strings == nil
  
  grouped = {}

  strings.each do |word|
    sorted = word.chars.sort.join
    if grouped[sorted] == nil
      grouped[sorted] = [word]
    else
      grouped[sorted] << word
    end
  end

  return grouped.values

end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  return nil if list == nil
  nums_count = {}

  list.each do |num|
    if nums_count.has_key?(num)
      nums_count[num] += 1
    else
      nums_count[num] = 1
    end
  end

  sorted_values = nums_count.sort_by{|num, value| value}

  p sorted_values
  
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
