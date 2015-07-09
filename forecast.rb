require "yahoo_weatherman"
require "pry" # debugging

def get_weather(location)
  weatherman = Weatherman::Client.new
  weatherman.lookup_by_location(location)
end

puts "Where are your location? (You can use zip code or city)"
location = gets.chomp

weather = get_weather(location)
forecasts = weather.forecasts

today = Time.now.strftime('%w').to_i

forecasts.each do |f|
  day = f['date']
  weekday = day.strftime('%w').to_i

  if weekday == today
    name_day = 'Today'
  elsif weekday == today + 1
    name_day = 'Tomorrow'
  else
    name_day = day.strftime('%A')
  end

  puts name_day + ' is goint to be ' + f['text'].downcase + ' with a low of ' + f['low'].to_s + ' and a high of '+ f['high'].to_s

end




