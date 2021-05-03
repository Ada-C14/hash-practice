
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * m * log m) 
	#	where n is the number of strings in the array to iterate over, 
	# and m is the number of characters to sort in a string (m log m), 
# Space Complexity: O(n * m) from sorting characters (m) and returning a new array (n)
# where n is the number of strings in the array
# and m is the number of characters in a string 
def grouped_anagrams(strings)
  sorted_strings_hash = Hash.new([])  

  strings.each do |word|
    word.chars.sort.join

    if sorted_strings_hash[word]
      sorted_strings_hash[word].push(word)
		end
	end

	puts sorted_strings_hash.values
	return sorted_strings_hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n + m log m) where n is the number of elements in the list and 
	# and m is the number of unique elements to sort (m log m)
# Space Complexity: O(m * k) where m is the number of unique elements to put in hash
	# and k is the number of elements to return
def top_k_frequent_elements(list, k)
	return [] if list.empty?

	frequency_hash = Hash.new(0)

	list.each do |num|
		frequency_hash[num] += 1
	end

	sorted_frequency_hash = frequency_hash.sort_by { |num, frequency| -frequency }

	k_frequent_elements = []

	k.times do |i|
		num_frequency_pair = sorted_frequency_hash[i]
		k_frequent_elements << num_frequency_pair[0]
	end

	return k_frequent_elements
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: O(1) constant time to iterate over table that is always 9x9
# Space Complexity: O(1)
def valid_sudoku(table)
	seen_in_rows = []
	seen_in_columns = []

	# array index represents the row/column number
	10.times do |i|
		seen_in_rows[i] = {}
		seen_in_columns[i] = {}
	end
	# Example seen_in_rows  = [
	# 	{"5"=>true, "3"=>true, "7"=>true},    					row 0
	# 	{"6"=>true, "1"=>true, "9"=>true, "5"=>true}, 	row 1
	# 	{"9"=>true, "8"=>true, "6"=>true}, 							row 2
	# 	...
	# ]

	seen_in_subgrids = 
	[
		[{}, {}, {}],
		[{}, {}, {}],
		[{}, {}, {}],
	]

	num_rows = table.length
	num_columns = table[0].length
	
	num_rows.times do |row|
		num_columns.times do |col|
			current_cell_value = table[row][col]

			next if current_cell_value == "."

			# find position of hash in seen_in_subgrids
			subgrid_col = col / 3
			subgrid_row = row / 3

			if seen_in_rows[row][current_cell_value] || seen_in_columns[col][current_cell_value] || seen_in_subgrids[subgrid_row][subgrid_col][current_cell_value]
				return false
			end	

			# Add value to all look-up hashes
			seen_in_rows[row][current_cell_value] = true
			seen_in_columns[col][current_cell_value] = true
			seen_in_subgrids[subgrid_row][subgrid_col][current_cell_value] = true
		end
	end

	return true
end