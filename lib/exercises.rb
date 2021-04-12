
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: ?
# Space Complexity: ?

def grouped_anagrams(strings)
  raise NotImplementedError, "Method hasn't been implemented yet!"
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  return [] if list.empty? 
  tracker = {}
  list.each do |num|
    tracker.has_key?(num) ? tracker[num] += 1 : tracker[num] = 1
  end

  return [list[0]] if tracker.values.sum == tracker.length && k == 1

  return tracker.sort_by { |key, value| value }.map { |key_val| key_val[0] }.drop(tracker.length - k)
end

# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: O(1)
# Space Complexity: O(1)
def valid_sudoku(table)
  rows = Array.new(9) { {} }
  columns =  Array.new(9) { {} }
  box = Array.new(9) { {} }

  table.each_with_index do |row, i|
    row.each_with_index do |column, j|
      number = table[i][j]
      sub_box = (i / 3) * 3 + j / 3
      if number != '.'
        if rows[i].has_key?(number) || columns[j].has_key?(number) || box[sub_box].has_key?(number)
          return false
        else
          rows[i][number] = true
          columns[j][number] = true
          box[sub_box][number] = true
        end
      end
    end
  end
  return true
end
