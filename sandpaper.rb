require 'dotenv/load'
require 'discordrb'


sleeping = []
caesar = []
#bot = Discordrb::Bot.new token: ENV['TOKEN']
bot = Discordrb::Commands::CommandBot.new token: ENV['CLIENT_TOKEN'], prefix: '.'
bot.send_message(805394228464844810, 'Updated!')

tts = false
timer = 300

bot.message() do |event|
  if event.author.role?('805467338052075590') && event.message.content != 'sandpaper'
    event.message.delete
    bot.send_message(event.channel, "#{event.author.username} said: #{caesar_cipher(event.message.content, 5)}")
    #if caesar.index(event.author.username) == nil
      #caesar.push(event.author.username)
      #sleep timer
      #caesar.delete(event.author.username)
    #end
  end
end

bot.message() do |event|
    if event.message.content.casecmp('sandpaper') == 0
      event.respond 'My name is Sandpaper, I am still under development.
Command list:```
.test
.id
.sleeping
.timer
.ts
.annoy
.selfdestruct <-- do NOT use this
Caesar role encrypts messages.```'
  end
end

bot.command :test do |event|
  event.respond "It's working"
end

bot.command :id do |event|
  event.respond "Your ID is #{event.author.id} and your username is #{event.author.username}"
end

bot.message() do |event|
  if event.author.role?('803707745017659434') && event.message.content.start_with?('.') == false && event.message.content != 'sandpaper'
    if sleeping.index(event.author.username) == nil
      event.message.delete
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

#bot.command :selfdestruct do |event|
#  bot.send_message(event.channel, "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent semper ipsum quis lorem imperdiet consequat. Phasellus iaculis et nisl non viverra. Donec sit amet laoreet augue. Morbi vitae blandit orci, quis pellentesque justo. Aliquam scelerisque volutpat magna, ut eleifend ligula blandit eu. Etiam eleifend, eros sed vestibulum iaculis, odio nulla tempus lacus, non tincidunt ante elit at lorem. Nunc ut eleifend lectus. Quisque purus turpis, suscipit vitae turpis ut, sollicitudin faucibus orci. In venenatis, odio nec commodo volutpat, dolor neque hendrerit lacus, non aliquet magna enim ut erat. Nullam non facilisis metus, non volutpat magna. Aliquam sagittis tempus sollicitudin. Morbi placerat cursus orci eu dictum. Fusce quis nibh consectetur dui interdum ultricies in vitae tellus. Sed convallis eros ut turpis elementum finibus at id enim. Nunc at nisl et mi tempor ullamcorper. Sed sagittis lorem diam, vel tincidunt arcu dignissim at.", tts = true)
#end

=begin
bot.message(content: '/sleeping') do |event|
  event.respond "Sleeping list: #{sleeping.join(', ')}"
end
=end
bot.command :sleeping do |event|
  event.respond "Sleeping list: #{sleeping.join(', ')}"
end


bot.command :annoy do |event|
  if event.user.voice_channel == nil
    event.respond "You have to be in a voice channel"
  else
    bot.voice_connect(event.user.voice_channel.id)
  end  
end

=begin
bot.command :leave do |event|
  event.bot.voices.keys
end
bot.command :leave do |event|
  event.bot.voices.keys
end
=end


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


def caesar_cipher(string, num)
  alphabet = ('a'..'z').to_a
  phrase = string.split("")

  until num < 26 do
    num -= 26
  end

  sentence = phrase.map do |n|
    if alphabet.include?("#{n}")
     phrase[phrase.index("#{n}")] = if (alphabet.index("#{n}") + num) > 25 then
       alphabet[alphabet.index("#{n}") + num - 26]
     else
       alphabet[alphabet.index("#{n}") + num]
     end
    elsif alphabet.include?("#{n.downcase}")
       phrase[phrase.index("#{n}")] = alphabet[alphabet.index("#{n.downcase}") + num - 26].upcase
    else
      phrase[phrase.index"#{n}"] = n
    end
  end
  sentence.join
end

=begin
bot.message(content: '/speak') do |event|
  "hello".to_file "it"
  event.respond "1"
  voice_bot = event.voice
  voice_bot.play_file('hello')
end
=end

bot.command :motivate do |event|
  event.respond "https://www.youtube.com/watch?v=KxGRhd_iWuE"
end


bot.run
