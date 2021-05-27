# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n*mlog(m)) where n is the number of words and m is
# is the size of the longest word in string O(mlogm) is the result of the sorting
# Space Complexity: n * m (worst case has to create a new array/key for each string and takes m space to sort it)

def grouped_anagrams(strings)
  result_array = []
  anagram_hash = {}

  if strings.length == 0 || strings.nil?
    return result_array
  end
  # iterate through strings to build a hash table
  # the hash table where key is the sorted string and value is the array of group anagrams
  strings.each_with_index do |string, index|
    # split strings into chars
    # sort chars and rejoin to create stored string
    sorted_string = string.chars.sort.join
    if anagram_hash.key?(sorted_string)
      # if sorted string is already in the array
      # add word to the group anagram array
      anagram_hash[sorted_string].push(strings[index])
    else
      # otherwise, set anagram hash value to a new empty array
      # to account for potential anagrams
      anagram_hash[sorted_string] = [strings[index]]
    end
  end
  # iterate through anagram hash and return anagram array
  anagram_hash.values.each do |anagrams|
    result_array.push(anagrams)
  end
  return result_array
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Build a requency hash table, sort by most to least
# Return only the nums = k
# Time Complexity: O(n) to build the frequency table, O(nlogn) to sort the frequency table 
# Space Complexity: O(n)

def top_k_frequent_elements(list, k)
  # frequency hash table with key = num, value = counts of num
  num_freq = {}
  result = []

  return [] if list.empty?

  list.each do |element|
    # increment value if key already exits
    if num_freq.key?(element)
      num_freq[element] += 1
    else
      # set value to 1 if key not yet exits
      num_freq[element] = 1
    end
  end

  # return a sorted by value descending hash 
  freq_list = num_freq.sort_by {|k, v| -v }.to_h
  puts freq_list


  freq_list.each do |num, frequency|
    result.push(num)
    if result.length >= k
      break
    end
  end

  return result

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
