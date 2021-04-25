
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

def get_sub_box(row, col)
  return 0 if row <= 2 && col <= 2
  return 1 if row <= 2 && col >= 3 && col <= 5
  return 2 if row <= 2 && col >= 6

  return 3 if row >= 3 && row <= 5 && col <= 2
  return 4 if row >= 3 && row <= 5 && col >= 3 && col <= 5
  return 5 if row >= 3 && row <= 5 && col >= 6

  return 6 if row >= 6 && col <= 2
  return 7 if row >= 6 && col >= 3 && col <= 5
  return 8
end

# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: O(1)
# Space Complexity: O(n)
def valid_sudoku(table)
  row_number_frequencies = [ {}, {}, {}, {}, {}, {}, {}, {}, {} ]
  column_number_frequencies = [ {}, {}, {}, {}, {}, {}, {}, {}, {} ]
  sub_box_number_frequencies = [ {}, {}, {}, {}, {}, {}, {}, {}, {} ]

  table.each_with_index do |row, r|
    row.each_with_index do |column, c|
      cell = table[r][c]
      next if cell == '.'

      # check/update row
      return false if row_number_frequencies[r].include?(cell)
      row_number_frequencies[r][cell] = true

      # check/update column
      return false if column_number_frequencies[c].include?(cell)
      column_number_frequencies[c][cell] = true

      # check/update sub-box
      sub_box = get_sub_box(r, c)
      return false if sub_box_number_frequencies[sub_box].include?(cell)
      sub_box_number_frequencies[sub_box][cell] = true
    end
  end

  return true
end
