
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
  rows_and_columns_valid = true
  i = 0
  while rows_and_columns_valid && i < 9
    rows_and_columns_valid = check_row(table, i) && check_column(table, i)
    i += 1
  end
  subgrid_valid = check_subgrid(table)

  return rows_and_columns_valid && subgrid_valid
end

def check_row(table, row_index)
  row_hash = {}
  9.times do |i|
    value = table[row_index][i]
    if row_hash[value] && value != "."
      return false
    else
      row_hash[value] = true
    end
  end
  return true
end

def check_column(table, column_index)
  column_hash = {}
  9.times do |i|
    value = table[i][column_index]
    if column_hash[value] && value != "."
      return false
    else
      column_hash[value] = true
    end
  end
  return true
end

def check_subgrid(table)
  subgrid_values = collect_all_subgrid_values(table)
  subgrid_values.each do |subgrid|
    subgrid_hash = {}
    subgrid.each do |value|
      if subgrid_hash[value] && value != "."
        return false
      else
        subgrid_hash[value] = true
      end
    end
  end
  return true
end

def collect_all_subgrid_values(table)
  subgrid_values = []
  3.times do |row_index|
    row_index *= 3
    3.times do |column_index|
      column_index *= 3
      # puts "coord [#{row_index}, #{column_index}]"
      subgrid_values <<  [table[row_index][column_index], table[row_index][column_index+1], table[row_index][column_index+2],
                          table[row_index+1][column_index], table[row_index+1][column_index+1], table[row_index+1][column_index+2],
                          table[row_index+2][column_index], table[row_index+2][column_index+1], table[row_index+2][column_index+2]]
      # p subgrid_values[-1]
    end
  end
  return subgrid_values
end