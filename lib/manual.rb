require 'dotenv/load'
require 'discordrb'

bot = Discordrb::Bot.new token: ENV['TOKEN']

puts "input channel"
channel = gets
loop do 
  puts "message?"
  mess = gets
  bot.send_message(channel, mess)
  end
end


bot.run
