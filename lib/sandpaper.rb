require 'dotenv/load'
require 'discordrb'

sleeping = []
bot = Discordrb::Bot.new token: ENV['TOKEN']
bot.send_message(803178831330148413, 'Updated!')

bot.message() do |event|
    if event.message.content.casecmp('sandpaper') == 0
      event.respond 'My name is Sandpaper, I am still under development.
Command list:```
/test-sandpaper
/sandpaper-id
/sleeping```'
  end
end

bot.message(content: '/test-sandpaper') do |event|
  #if event.author.id == 765140200438366209
    event.respond "It's working"
  #else
  #  event.respond "Fuck you"
  #end
end

bot.message(content: '/sandpaper-id') do |event|
  #if event.author.id == 765140200438366209
    event.respond "Your ID is #{event.author.id} and your username is #{event.author.username}"
  #else
  #  event.respond event.author.username + " is a dumb fuck"
  #end
end

bot.message() do |event|
  if event.author.role?('803707745017659434')
    if sleeping.index(event.author.username) == nil
      event.respond bot.send_message(event.channel, "Donna schiava zitta e lava", tts = true)
      sleeping.push(event.author.username)
      sleep 300
      sleeping.delete(event.author.username)
    end
  #elsif event.author.role?('803707745017659434') && event.author.id == 765140200438366209
  #  if sleeping.index(event.author.username) == nil
  #    event.respond "Carlo e' una brutta puttana"
  #    sleeping.push(event.author.username)
  #    sleep 300
  #    sleeping.delete(event.author.username)
  #  end
  end
end

bot.message(content: '/sleeping') do |event|
  event.respond "Sleeping list: #{sleeping.join(', ')}"
end

bot.message(content: '/annoy') do |event|
  bot.voice_connect(700393476210163772)
end

=begin
bot.message(content: '/speak') do |event|
  "hello".to_file "it"
  event.respond "1"
  voice_bot = event.voice
  voice_bot.play_file('hello')
end
=end




bot.run

