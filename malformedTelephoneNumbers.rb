require "CSV"

formattedNumbers = []

File.open("import_telephone_numbers.csv") do |csv|
	csv.each do |line|
		x = line.gsub(/[^0-9]/, "")[-10..-1]
		formattedNumbers.push("1-#{x[0..2]}-#{x[3..5]}-#{x[6..9]}")
	end
end

puts formattedNumbers
