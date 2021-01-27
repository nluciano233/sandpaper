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
