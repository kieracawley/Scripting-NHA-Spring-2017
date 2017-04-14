require "CSV"
require "json"
require "geocoder"

nyc_dictricts = CSV.read("School_District_Breakdowns.csv")
nyc_schools = CSV.read("DOE_High_School_Directory_2016.csv")

schools_formatted = []

nyc_schools.each do |school|
	if nyc_schools.index(school) > 0
		district = nyc_dictricts[school[0][0..1].to_i]
		address = "#{school[15]}#{school[16]} #{school[17]} #{school[18]}"
		schools_formatted.push({
			"school_name" => school[1],
			"school_phone_number" => school[5],
			"school_lowest_grade" => school[8],
			"school_highest_grade" => school[9],
			"school_address" => address,
			"school_coodinate" => Geocoder.coordinates(address),
			"district_name" => district[0],
			"district_code" => school[0]
		})
	end
end

File.open("schools.json","w") do |f|
  f.write(schools_formatted.to_json)
end
