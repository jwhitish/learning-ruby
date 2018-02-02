#csv parser that pulls out information from a file
#env must have google-api-client installed

require "csv"
require "google/apis/civicinfo_v2"

# def clean_zipcode(zipcode)
#   #check for nil
#   if zipcode.nil?
#     zipcode = "00000"
#   #if zip less than 5 add 0 to front until 5
#   elsif zipcode.length < 5
#     zipcode = zipcode.rjust 5, "0"
#   #if zip more than 5 truncate to first 5
#   elsif zipcode.length > 5
#     zipcode = zipcode[0..4]
#   #if zip is 5 digits assume ok
#   end
# end

#refactoring the clean_zipcode mmethod
def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    legislators = civic_info.representative_info_by_address(
                                  address: zip,
                                  levels: 'country',
                                  roles: ['legislatorUpperBody', 'legislatorLowerBody'])
    legislators = legislators.officials
    legislator_names = legislators.map(&:name)
    legislators_string = legislator_names.join(", ")
  rescue
    "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
  end
end

puts "EventManager Initialized."

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

contents.each { |row|
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  puts "#{name} #{zipcode} #{legislators}"
}
