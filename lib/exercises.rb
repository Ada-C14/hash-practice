
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  words = Hash.new

  strings.each do |string|
    letter_count = Hash.new
    string.each_char do |c|
      letter_count[c] = letter_count[c] ? letter_count[c] + 1 : 1
    end

    if words[letter_count]
      words[letter_count].push(string)
    else
      words[letter_count] = [string]
    end
  end

  return words.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  element_count = {}
  
  list.each do |element|
    element_count[element] = element_count[element] ? element_count[element] + 1 : 1
  end

  return element_count.max_by(k) {|a| a[1]}.map {|a| a[0]}
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
