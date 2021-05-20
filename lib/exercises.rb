
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: o(n)
# Space Complexity: o(n)

def grouped_anagrams(strings)
  return [] if strings.length == 0

  anagrams = Hash.new([])
  strings.each do |element|
    sorted_letters = element.sort
    if anagrams[sorted_letters]
      anagrams << element
    else
      anagrams[sorted_letters] = element
  end
  return anagrams.values
  # strings.each.with_index { |el, i| anagrams[el.downcase.chars.sort.join] += [i] }
  # anagrams.map { |key, indexes| indexes.map { |i| strings[i] } }
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: o(n)
# Space Complexity: o(n)
def top_k_frequent_elements(list, k)
  return [] if list.length == 0
  hash_list = {}

  list.each do |number|
    if hash_list[number]
      hash_list[number] += 1
    else
      hash_list[number] = 1
    end
  end

  sortedhash = Hash[hash_list.sort_by { |key, value| -value }[0...k]]

  return sortedhash.keys
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
