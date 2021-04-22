
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# n => number of strings, m => largest number of characters of a string
# Time Complexity: n * mlog(m) (sorting n strings: n * mlog(m); lookup, push, assign: O(1), iterating o(n))
# Space Complexity: n * m (worst case has to create a new array/key for each string, and takes m space to sort it)

def grouped_anagrams(strings)
  anagram_hash = Hash.new 
  grouped_anagrams = Array.new

  #build a hash table where key is the sorted string and value is an array of the anagrams
  strings.each_with_index do |string, index|
    sorted_str = string.chars.sort.join
    if anagram_hash.key?(sorted_str)
      anagram_hash[sorted_str] << strings[index]
    else
      anagram_hash[sorted_str] = [strings[index]]
    end
  end

  anagram_hash.values.each do |anagrams|
    grouped_anagrams << anagrams
  end

  return grouped_anagrams
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: Olog(n) for sorting
# Space Complexity: o(n)
def top_k_frequent_elements(list, k)
  elements_counter = Hash.new(0)

  list.each do |num|
    elements_counter[num] += 1
  end

  result_elements = []
  elements_counter.values.sort.reverse.take(k).each do |frequency|
    result_elements << elements_counter.key(frequency)
    elements_counter.delete(elements_counter.key(frequency))
  end

  return result_elements
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: O(1) fixed grid
# Space Complexity: O(1)
def valid_sudoku(table)

  #check rows
  9.times do |r|
    line_hash = Hash.new(0)
    9.times do |c|
      if table[r][c] != "."
        line_hash[table[r][c]] += 1
        return false if line_hash[table[r][c]] > 1
      end
    end
  end

  #check columns
  9.times do |c|
    column_hash = Hash.new(0)
    9.times do |r|
      if table[r][c] != "."
        column_hash[table[r][c]] += 1
        return false if column_hash[table[r][c]] > 1
      end
    end
  end

  #check sub-box
  3.times do |box_r|  
    3.times do |box_c|
      box_hash = Hash.new(0)
      3.times do |r|
        3.times do |c|
          row = r + box_r * 3
          col = c + box_c * 3
          if table[row][col] != "."
            box_hash[table[row][col]] += 1
            return false if box_hash[table[row][col]] > 1
          end
        end
      end
    end
  end

  return true
end
