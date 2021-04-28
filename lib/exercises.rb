
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * klog(k)) where n is the number of strings and k is the length of each string. 
# Space Complexity: O(n) - using hash to store each word. 
# Does having an array as a key increase the space complexity?

def grouped_anagrams(strings)
  # Create a hash table
  anagrams = {}
  # Keys will be sorted word
  # values will be the arrays of words that are anagrams of sorted word. 
  strings.each do |word|
    sorted_word = word.split('').sort.join
    if anagrams.has_key?(sorted_word)
      anagrams[sorted_word].push(word)
    else
      anagrams[sorted_word] = [word]
    end
  end
  return anagrams.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(nlog(n)) - due to using sort_by
# Space Complexity: O(n) - hash could potentially hold n unique values. 
def top_k_frequent_elements(list, k)
  return list if list.length == k
  
  frequency = {}
  list.each do |val|
    if frequency.has_key?(val)
      frequency[val] += 1
    else
      frequency[val] = 1
    end
  end
  return frequency.sort_by.with_index { |k, idx| [-k[1], idx] }.map {|pair| pair[0]}.first(k)
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: O(1) because the grid is a fixed size. 
# Space Complexity: O(1) even though we're using multiple hashes it's O(1) because the grid is a fixed size 
def valid_sudoku(table)
  return check_row(table) && check_column(table) && check_square(table)
end

# validate that any array won't have any duplicate values 
def is_valid(array)
  count = Hash.new(0)
  array.each do |value|
    if value != '.' && count.has_key?(value)
      return false
    else
      count[value] += 1
    end
  end
  return true
end

def check_row(table)
  table.each do |row|
    unless is_valid(row)
      return false
    end
  end
  return true
end

def check_column(table)
  9.times do |column|
    column_array = []
    9.times do |row|
      column_array << table[row][column]
    end
    return false unless is_valid(column_array)
  end
  return true
end

def check_square(table)
  range = (0...3).to_a.map {|num| num * 3}
  range.each do |row|
    range.each do |column|
      sq_array = []
      (row...(row + 3)).each do |row_index|
        (column...(column + 3)).each do |column_index|
          sq_array << table[row_index][column_index]
        end
      end
      return false unless is_valid(sq_array)
    end
  end
  return true
end

      
