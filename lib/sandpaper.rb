require 'dotenv/load'
require 'discordrb'

sleeping = []
#bot = Discordrb::Bot.new token: ENV['TOKEN']
bot = Discordrb::Commands::CommandBot.new token: ENV['TOKEN'], prefix: '!'
bot.send_message(803178831330148413, 'Updated!')

tts = false
timer = 300

bot.message() do |event|
    if event.message.content.casecmp('sandpaper') == 0
      event.respond 'My name is Sandpaper, I am still under development.
Command list:```
!test
!id
!sleeping
!timer <value in seconds>
!ts <true/false>
!annoy```'
  end
end

bot.command :test do |event|
  event.respond "It's working"
end

bot.command :id do |event|
  event.respond "Your ID is #{event.author.id} and your username is #{event.author.username}"
end

bot.message() do |event|
  if event.author.role?('803707745017659434') && event.message.content.start_with?('!') == false && event.message.content != 'sandpaper'
    if sleeping.index(event.author.username) == nil
      bot.send_message(event.channel, "Donna schiava zitta e lava", tts)
      sleeping.push(event.author.username)
      sleep timer
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

=begin
bot.message(content: '/sleeping') do |event|
  event.respond "Sleeping list: #{sleeping.join(', ')}"
end
=end
bot.command :sleeping do |event|
  event.respond "Sleeping list: #{sleeping.join(', ')}"
end


bot.command :annoy do |event|
  if event.user.voice_channel.id == nil
    event.respond "You have to be in a voice channel"
  else
    bot.voice_connect(event.user.voice_channel.id)
  end
end



bot.command :timer do |event, args|
  if args == nil
    event.respond "This command sets the timer for Lavatrice.
Use it like `/timer 60`. The value is in seconds."
  else
    sleeping = []
    timer = args.to_i
    event.respond "Lavatrice timer set to #{timer}"
  end
end

bot.command :ts do |event, args|
  if args == 'true'
    tts = true
    event.respond "Lavatrice text to speech set to true"
  elsif args == "false"
    tts = false
    event.respond "Lavatrice text to speech set to false"
  elsif args == nil
    event.respond "This command activates text-to-speech for Lavatrice.
Use it like `/ts true` or `/ts false`"
  else
    event.respond "Text to speech value can only be true/false"
  end
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

