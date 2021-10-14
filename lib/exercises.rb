
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(nm) where n is array length(words) and m is word length(letters)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  return [] if strings.nil?
  return [] if strings.empty?

  hash = {}

  strings.each do |word|
    letters = word.split("").sort

    if hash[letters] # if it has the sorted letters
      hash[letters] << word
    else
      hash[letters] = [word]

    end
  end

  return hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O (n log n) for using sort
# Space Complexity: O (n)
def top_k_frequent_elements(list, k)

  return [] if list.nil? || list.empty?

  if k.nil?
    raise ArgumentError,"k was not provided"
  end

  frequent = Hash.new(0)

  list.each do |num|
    frequent[num] += 1
  end

  results = frequent.sort_by{|num , frequency| -frequency }
  results[0...k].map{|num , frequency| num }
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