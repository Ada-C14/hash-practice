
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n^2)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  hash = Hash.new
  strings.each do |string|
    if hash[str_to_int(string)]
      hash[str_to_int(string)] << string
    else
      hash[str_to_int(string)] = [string]
    end
  end

  return hash.values
end

def str_to_int(string)
  return string.chars.map { |char| char.ord }.sum
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  return list if list.empty? || list.length == 1

  hash = Hash.new(0)
  list.each { |int| hash[int] += 1 }

  max_count = 0
  inverted_hash = Hash.new
  hash.each do |key, value|
    if inverted_hash[value]
      inverted_hash[value] << key
    else
      inverted_hash[value] = [key]
    end

    max_count = value if value > max_count 
  end

  k_dup = k.dup
  k_most_frequent = []
  max_count.downto(1) do |count|
    if inverted_hash[count]
      inverted_hash[count].each do |int| 
        k_most_frequent << int if k_dup > 0
        k_dup -= 1
      end
    end
  end

  return k_most_frequent
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: O(1) because the table has nine rows and columns
# Space Complexity: O(1) because each hash will store up to nine cells
def valid_sudoku(table)
  return valid_rows(table) && valid_columns(table) && valid_boxes(table)
end

def valid_cell(char)
  return char != "." && /[1-9]/.match(char)
end

def valid_rows(table)
  hash_row = Hash.new
  table.each do |row|
    # Each row is an array
    row.each do |cell|
      return false if hash_row[cell] && valid_cell(cell)
      hash_row[cell] = true
    end
    hash_row.clear
  end

  return true
end

def valid_columns(table)
  hash_column = Hash.new
  i = 0
  j = 0
  while j < table[i].length
    # Checks column
    while i < table.length
      return false if hash_column[table[i][j]] && valid_cell(table[i][j])
      hash_column[table[i][j]] = true
      i += 1
    end
    hash_column.clear
    # Reset row number back to zero
    i = 0
    j += 1
  end

  return true
end

def valid_boxes(table)
  hash_box = Hash.new
  3.times do |row_corner|
    3.times do |col_corner|
      3.times do |row|
        3.times do |col|
          box_row = row + 3 * row_corner
          box_col = col + 3 * col_corner
          return false if hash_box[table[box_row][box_col]] && valid_cell(table[box_row][box_col])
          hash_box[table[box_row][box_col]] = true
        end
      end
      hash_box.clear
    end
  end

  return true
end
