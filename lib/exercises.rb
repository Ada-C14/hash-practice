# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) where n is the total number of characters in all strings
# >> Go through each character in every string by visiting each string in array
# and each character in each string
# >> O(1) for ord
# >> O(k), where k == num strings in input array, to get all hash values
# Space Complexity: O(n)
#
# Notes:
# >> considered just assigning score using ord,
# but this doesn't account for diff combinations of letters that sum to same score
# >> FIX:
# >> keep track of individual alphabet chars using array w/ 26 indices
# >> index into that array using ch.ord - 'a'.ord (to baseline 'a' to 0)

def grouped_anagrams(strings_arr)
  anagrams_hash = {}
  strings_arr.each do |str|
    char_counts = [0] * 26
    str.each_char { |ch| char_counts[ch.ord - 'a'.ord] += 1 }
    if anagrams_hash[char_counts]
      anagrams_hash[char_counts] << str
    else
      anagrams_hash[char_counts] = [str]
    end
  end

  return anagrams_hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occurring element.

# Time Complexity: O(n)
# >> item_cts hash & first_seen_nums array: O(n); iterate through ever item in input list
# >> inverted_cts hash: O(m) where m is the number of unique elems in list; at worst this is n
# >> top_k output array: O(k)

# Space Complexity: O(n)
# >> item_cts hash: O(m) where m is the number of unique elems in list; at worst this is n
# >> first_seen_nums array: O(m) where m is the number of unique elems in list; at worst this is n
# >> inverted_cts hash: O(m) where m is the number of unique elems in list; at worst this is n
# >> top_k output array: O(k)

# PSEUDOCODE:
# >> if k == 1, just return first item in list
# >> iterate through all elems in list and populate hash with count -- O(n)
# >> can't ensure hash will preserve order; also create an array that stores nums as they first appear
# >> invert char count hash + store max appearance count
# >> starting from the max count, check for inclusion in inverted hash
# >> if member, then for each item in value array (which is in order of first appearance)
# decrement k and include in top_k output array (keep going until k == 0)

# ASSUMPTIONS:
# >> input list will have at least k unique elements to return top k

def top_k_frequent_elements(list, k)
  return [] if list.empty?
  return [list[0]] if k == 1

  item_cts = {}
  first_seen_nums = []
  list.each do |it|
    if item_cts[it]
      item_cts[it] += 1
    else
      item_cts[it] = 1
      first_seen_nums << it
    end
  end

  inverted_cts = {}
  max_ct = 0
  first_seen_nums.each do |it|
    ct = item_cts[it]
    max_ct = ct if ct > max_ct
    if inverted_cts[ct]
      inverted_cts[ct] << it
    else
      inverted_cts[ct] = [it]
    end
  end

  top_k = []
  max_ct.times do |i|
    if inverted_cts[max_ct - i] && k > 0
      inverted_cts[max_ct - i].each do |it|
        if k > 0
          top_k << it
          k -= 1
        end
      end
    end
  end

  return top_k
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
