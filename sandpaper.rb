require 'dotenv/load'
require 'discordrb'
sl = false

sleeping = []


bot = Discordrb::Bot.new token: ENV['TOKEN']



bot.message() do |event|
    if event.message.content.casecmp('sandpaper') == 0
      event.respond 'My name is Sandpaper, I am still under development. Accepting commands only from: Dopamiine.
Command list:```
/test-sandpaper
/sandpaper-id```'
  end
end

bot.message(content: '/test-sandpaper') do |event|
  if event.author.id == 765140200438366209
    event.respond "It's working"
  else
    event.respond "Fuck you"
  end
end

bot.message(content: '/sandpaper-id') do |event|
  if event.author.id == 765140200438366209
    event.respond "Your ID is #{event.author.id} and your username is #{event.author.username}"
  else
    event.respond event.author.username + " is a dumb fuck"
  end
end



bot.message() do |event|
  if event.author.role?('803707745017659434') && event.author.id != 765140200438366209
    if sleeping.index(event.author.username) == nil
      event.respond "Donna schiava zitta e lava"
      sleeping.push(event.author.username)
      sleep 300
      sleeping.delete(event.author.username)
    end
  elsif event.author.role?('803707745017659434') && event.author.id == 765140200438366209
    if sleeping.index(event.author.username) == nil
      event.respond "Carlo e' una brutta puttana"
      sleeping.push(event.author.username)
      sleep 300
      sleeping.delete(event.author.username)
    end
  end
end

=begin
#TESTING FOR PER-USER TIMER FOR LAVATRICE
bot.message() do |event|
  if event.author.role?('803707745017659434')
    #event.respond "Working. Added to sleep?"
      if sleeping.index(event.author.username)
        bot.send_message(803178831330148413, "Already in. Sleeping list: #{sleeping.join(', ')}")
      else #for the elsif just put the condition == nil
        sleeping.push(event.author.username)
        bot.send_message(803178831330148413, "Added. Sleeping list: #{sleeping.join(', ')}")
        sleep 5
        sleeping.delete(event.author.username)
        bot.send_message(803178831330148413, "Time's up, deleted. Sleeping list: #{sleeping.join(', ')}")
    end
  end
end
=end

=begin TEST TO SEE HOW RUBY TIMER WORKS
bot.message() do |event|
  event.respond "Working..."
  if event.author.role?('803707745017659434') && sl == false 
    event.respond "It worked, will work again in 5 seconds."
    sl = true
    sleep 5.minutes
    sl = false
  end
end
=end

#how to make the 5 minute timer work only for specific users?
#for example if user1 triggers is, the function still has to work
#for user2 if he types in chat.

bot.run
#bot.send_message(803178831330148413, 'Bot is now active!')
