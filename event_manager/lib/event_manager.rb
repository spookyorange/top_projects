require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'date'
require 'time'



puts 'Event manager initialized'
times_count = Hash.new()
day_count = Hash.new()


File.open('times.txt', 'w') do |haha|
end

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end
def legislators_by_zipcode(zipcode)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  begin
    legislators = civic_info.representative_info_by_address(
      address: zipcode,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    "aaaah so sorry"
  end
end



def thanking_you(id, form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"
  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end



def clean_number(number)
  if number.to_s.rjust(9, '0').length < 10
    return number = 'invalid'
  else
    number_chars = number.chars
    clean_number = number_chars.each_with_index.map  do |no, index|
      if ((no.ord < 48) || (no.ord > 57))
        no = nil
      else
        no
      end
    end
    clean_number.compact!
    if (clean_number.length == 10)
      number = clean_number.join()
    elsif (clean_number.length == 11 && clean_number[0] = 1)
      clean_number.shift[0]
      number = clean_number.join()
    else
      number = 'invalid'
      puts clean_number
    end
  end
end


def get_hour(date)
  time = DateTime.strptime(date, "%m/%d/%y %H:%M")
  hour = time.hour
  hour = "#{hour}"
  hour
end

def time_to_txt(date, times_count)
  File.open('times.txt', 'a') do |file|
    file.puts date
    if times_count[date] == nil
      times_count[date] = 1
    else
      times_count[date] += 1
    end
  end
end



def get_day(date)
  time = DateTime.strptime(date, "%m/%d/%y %H:%M")
  day = time.wday
  day = "#{day}"
  day
end

def day_count(date, day_count)
  if day_count[date] == nil
    day_count[date] = 1
  else
    day_count[date] += 1
  end
end


template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

lines = CSV.readlines(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)
lines.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  number = clean_number(row[:homephone])
  hour = get_hour(row[:regdate])
  day = get_day(row[:regdate])
  
  legislators = legislators_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)
  thanking_you(id, form_letter)
  time_to_txt(hour, times_count)
  day_count(day, day_count)
end

print "\n\n#{times_count.sort_by {|key, value| value}.reverse.to_h}\n\n"
print "\n\n#{day_count.sort_by {|key, value| value}.reverse.to_h}\n\n"
