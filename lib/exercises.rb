
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: ?
# Space Complexity: ?

def grouped_anagrams(strings)
  grouped_anagrams = []
  meta_hash = {}
  hashes = []
  strings.each_with_index do |word, i|
    word_hash = {}
    word = word.chars.sort
    word.each do |char|
      if word_hash[char]
        word_hash[char] += 1
      else
        word_hash[char] = 1
      end
    end
    hashes << word_hash
  end

  hashes.each_with_index do |word_hash, i|
    if meta_hash[word_hash]
      meta_hash[word_hash] << i
    else
      meta_hash[word_hash] = [i]
    end
  end

  meta_hash.each do |word_hashes, word_indices|
    anagram_group = []
    word_indices.each do |index|
      anagram_group << strings[index]
    end
    grouped_anagrams << anagram_group
  end

  return grouped_anagrams
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  elements = {}

  list.each do |element|
    if elements[element]
      elements[element] += 1
    else
      elements[element] = 1
    end
  end

  elements_by_frequency = sort_hash(elements);

  return elements_by_frequency[0..k-1]
end

def sort_hash(hash)
  # todo: implement a sort
  sorted_keys = hash.sort_by { |key, value| -value}.map {|pair| pair[0]}
  return sorted_keys
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
