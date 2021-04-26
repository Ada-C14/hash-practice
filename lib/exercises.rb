
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  # raise NotImplementedError, "Method hasn't been implemented yet!"
  return [] if strings.empty?
  
  hash = Hash.new

  strings.each do |word|
    array_letters = word.split("").sort

    if hash[array_letters]
      hash[array_letters] << word
    else
      hash[array_letters] = [word]
    end
  end

  return hash.values


end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(nlogn)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  # raise NotImplementedError, "Method hasn't been implemented yet!"
  return [] if list.empty?

  hash = Hash.new(0)

  list.each do |num|
    hash[num] += 1
  end

  sorted_hash = hash.sort_by {|key, value| -value}
  
  return sorted_hash[0..k-1].map { |num, count| num}
  

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
