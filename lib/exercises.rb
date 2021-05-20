
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * mlogm) where n is the number of strings and m is the number of letters in a string
# Space Complexity: O(n) where n is the number of strings

def grouped_anagrams(strings)
  strings_hash = Hash.new{|hash, key| hash[key] = []}
  strings.each { |string| strings_hash[string.downcase.chars.sort.join] << string}
  return strings_hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(nlogn) (for the sort)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  return [] if list.empty?

  element_count = Hash.new(0)
  element_first_occur = Hash.new

  list.each_with_index do |num, i|
    element_count[num] += 1
    element_first_occur[num] = i unless element_first_occur[num]
  end

  sorted = element_count.keys.sort_by{|num| element_count[num]}.reverse
  last_num_count = element_count[sorted[k - 1]]

  if(last_num_count == element_count[sorted[k]])
    sorted[k - 1] = sorted
      .filter{|num| element_count[num] == last_num_count}
      .min_by{|num| element_first_occur[num]}
  end
  sorted[0...k]
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
