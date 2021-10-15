
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
#   row, column or the 9 3x3 subgrid
# Time Complexity: O(1) for a 9 block sudoku
# Space Complexity: O(n) for the hash table
def valid_sudoku(table)
  if table.nil? || table.empty?
    raise ArgumentError,'no table provided'
  end

  # row check
  table.each do |row|
    row_hash = {}
    row.each do |input|
      if validate_sudoku_input(input)
        if row_hash[input]
          false
        else
          row_hash[input] = true
        end
      end
    end
  end

  # column check
  i = 0
  while i < 9
    col_hash = {}
    table.each do |row|
      input = row[i]
      if validate_sudoku_input(input)
        if col_hash[input]
          false
        else
          col_hash[input] = true
        end
      end
    end
    i += 1
  end

  # 9 3x3 block
  [0,3,6].each do |rows| # created array for rows
    [0,3,6].each do |columns| # created array for columns
      return false unless sudoku_3x3_block(rows, columns, table)
    end
  end

  true
end


def validate_sudoku_input(value)
  if value != "." && value =~ /[^123456789]/
    false
  end
end

def sudoku_3x3_block(rows, columns, table)
  block_hash = {}
  (rows...rows+3).each do |row|
    (columns...columns+3).each do |column|
      input = table[row][column]
      return false unless validate_sudoku_input(input)
      if block_hash[input]
        false
      else
        block_hash[input] = true
      end
    end
  end
  true
end