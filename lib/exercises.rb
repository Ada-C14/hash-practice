
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n*k)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  hash = Hash.new { |k, v| k[v] = [] }
  strings.each do |word|
    hash[word.chars.sort.join] << word
  end
  return hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n*k)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  hash = {}
  list.each do |num|
    hash[num] ? hash[num] += 1 : hash[num] = 1
  end
  sorted = hash.sort_by{ |k, v| -v }
  sorted[0...k].map { |num, count| num }
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: ?
# Space Complexity: ?
def valid_sudoku(table)
  store = {
    rows: {},
    cols: {},
    square: {}
  }
  i = 0
  j = 0
  while i < 9
    while j < 9
      box = table[i][j]
      if !store[:rows][i] && box != "."
        store[:rows][i] = []
        store[:rows][i].push(box)
      elsif box != "." && !store[:rows][i].include?(box)
        store[:rows][i].push(box)
      elsif store[:rows][i] && store[:rows][i].include?(box)
        return false
      end
      if !store[:cols][j] && box != "."
        store[:cols][j] = []
        store[:cols][j].push(box)
      elsif box != "." && !store[:cols][j].include?(box)
        store[:cols][j].push(box);
      elsif store[:cols][j] && store[:cols][j].include?(box)
        return false
      end

      square_row = ((i+1).to_f / 3.0).ceil
      square_col = ((j+1).to_f / 3.0).ceil
      square_id = "#{square_row}-#{square_col}"
      # square_id = j+1
      puts store[:square]

      if !store[:square][square_id] && box != "."
        store[:square][square_id] = []
        store[:square][square_id].push(box)
      elsif box != "." && !store[:square][square_id].include?(box)
        store[:square][square_id].push(box)
      elsif store[:square][square_id] && store[:square][square_id].include?(box)
        return false
      end
      j += 1
    end
    i += 1
  end
  return true
end
