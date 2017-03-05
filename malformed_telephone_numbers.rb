require "CSV"

formatted_numbers = []

File.open("import_telephone_numbers.csv") do |csv|
  csv.each do |line|
    new_number = line.gsub(/[^0-9]/, "")[-10..-1]
    formatted_numbers.push("1-#{new_number[0..2]}-#{new_number[3..5]}-#{new_number[6..9]}")
  end
end

CSV.open("formatted_numbers.csv", "wb") do |csv|
  formatted_numbers.each do |line|
    csv << [line]
  end
end
