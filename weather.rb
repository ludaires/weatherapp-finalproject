require "yahoo_weatherman"
require "pry"  # debugging

def get_condition(location)
  client = Weatherman::Client.new
  client.lookup_by_location(location).condition
end

def get_message (condition)
  temperature = condition['temp']
  msg = condition['text']
  case
    when temperature>= 20
    message = "It is #{temperature}˚ degrees. #{msg}, it's an amazing weather. Enjoy"
    when temperature >= 30
    message = "It is #{temperature}˚ degrees. #{msg}, it's to hot. Drink a lot of water"
    when temperature >= 10
    message = "It is #{temperature}˚ degrees. #{msg}, it's cold. Remember to take a jacket"
    when temperature >= 1
    message = "It is #{temperature}˚ degrees. #{msg}, it's freezing. Stay warm"
    when temperature >= 0
    message = "It is #{temperature}˚ degrees. #{msg}, Ok! It's freaking cold. Let's travel to a warm place"
  end
  message
end

puts "Where are your location? (You can use zip code, city, state, etc)"
location = gets.chomp
condition = get_condition(location)
puts get_message(condition)

