
def play_super(secret,start_time,counter)
  matches= []
  misses= []
  puts "I have generated a sequence with 8 elements made up of:(p)ink, (a)qua,(r)ed,(g)reen,(b)lue,and (y)ellow. Use (q)uit at any time to end the game. What's your guess? (If you want to cheat, type C)"
  user_guess= gets.chomp
  if (user_guess=="C" || user_guess=="c")
    puts secret.join(",")
    play_super(secret, start_time,counter)
  elsif (user_guess=="q" || user_guess=="Q")
    puts "That's too bad, I'll re-route you to the main menu"
    master_mind
  elsif user_guess.length < 8
    counter+=1
    puts "That's not long enough, remember, 8 characters"
    play_super(secret, start_time,counter)
  elsif user_guess.length > 8
    counter+=1
    puts "That's too long. Remember, only 8 characters."
    play_super(secret,start_time,counter)
  else
    counter+=1
    user_guess= user_guess.chars.to_a
    user_guess.each_with_index do |letter, index|
      if(secret[index] == letter)
        matches.push(index)
      else
        misses.push(index)
      end
    end
  end
  if (misses.length==0)
    end_time = Time.now
    time_taken = end_time - start_time
    puts "Congratulations! You guessed the sequence #{secret} in #{counter} tries. It took you #{convert_time(time_taken)}. Do you want to play again?Y/N"
    user_choice=gets.chomp.upcase
    if user_choice=="Y"
      master_mind
    else
      puts "That's too bad,"
      abort("goodbye")
    end
  elsif (misses.length != 0)
    puts "You have guessed #{find_correct(secret, user_guess)} of the right elements, with #{matches.length} in the right place"
    puts "You have #{misses.length} in the wrong place"
    puts "You have guessed #{counter} times"
    puts "I am going to start again, please stand by....."
    play_super(secret, start_time,counter)
  else
    puts "test"
  end
end
