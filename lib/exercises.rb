
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) * O(mlogm)
# Space Complexity: O(n+m) = O(n)

def grouped_anagrams(strings)

  hash_table = Hash.new([])
  strings.each do |word|                                      # time: O(n)
    hash_table[word.split("").sort.join("")] += [word]        # time: O(mlogm)  , space: o(m) for split, o(n) for hash
  end

  return hash_table.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(nlogn)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  # edge cases: k greater than length of string?

  hash_table = Hash.new(0)

  list.each do |int|                            # time: o(n)
    hash_table[int] += 1                        # space: o(n)
  end
  

  # sort by the values
  sorted = hash_table.sort_by{|k, v| -v}         # time: o(nlogn), space: o(n)

  # return top k
  top_k = []                                     # space: o(m)
  sorted[0..k-1].each do |pair|                  # time: o(m), space: o(m) for []
    top_k.push(pair[0])                          # time: o(1)
  end

  return top_k.sort                              # time: o(mlogm)
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
