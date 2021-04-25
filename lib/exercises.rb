
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) where n is the number of chars
# Space Complexity: O(n) where n is the number of words
def grouped_anagrams(strings)
  frequency_hash_to_words = Hash.new

  strings.each do |word|
    frequency_hash = word.each_char.with_object(Hash.new(0)) { |letter, count| count[letter] += 1 }

    if frequency_hash_to_words.include?(frequency_hash)
      frequency_hash_to_words[frequency_hash] << word
    else
      frequency_hash_to_words[frequency_hash] = [ word ]
    end
  end

  return frequency_hash_to_words.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n log n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  count = Hash.new(0) 

  list.each do |num|
    count[num] += 1
  end

  count = count.sort_by { |k, v| -v }.to_h

  return count.keys[0...k]
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
