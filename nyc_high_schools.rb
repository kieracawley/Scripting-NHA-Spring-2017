require "CSV"
require 'json'

nyc_dictricts = CSV.read("School_District_Breakdowns.csv")
nyc_schools = CSV.read("DOE_High_School_Directory_2016.csv")

schools_formatted = []

nyc_schools.each do |school|
	if nyc_schools.index(school) > 0
		district = nyc_dictricts[school[0][0..1].to_i]
		schools_formatted.push({
			"school_name" => school[1],
			"school_phone_number" => school[5],
			"school_lowest_grade" => school[8],
			"school_highest_grade" => school[9],
			"school_address" => "#{school[15]}#{school[16]} #{school[17]} #{school[18]}",
			"district_name" => district[0],
			"district_code" => school[0],
			"district_percent_female" => district[3].to_f,
			"district_percent_male" => 1 - district[3].to_f
		})
	end
end

schools_object = {
    "all_schools" => schools_formatted
}
File.open("schools.json","w") do |f|
  f.write(schools_object.to_json)
end
