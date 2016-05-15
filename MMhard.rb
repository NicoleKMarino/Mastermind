$hard_counter=0

def play_hard(secret)
  matches= []
  misses= []
  $hard_counter+=1
  puts "I have generated a sequence with six elements made up of:(r)ed,(g)reen,(b)lue,(pink),and (y)ellow. Use (q)uit at any time to end the game. What's your guess? (If you want to cheat, type C)"
  user_guess= gets.chomp
  if (user_guess=="C" || user_guess=="c")
    puts secret.join(",")
    play_hard secret
  elsif (user_guess=="q" || user_guess=="Q")
    puts "That's too bad, goodbye"
    master_mind
  elsif user_guess.length < 4
    puts "That's not long enough"
    play_hard secret
  else
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
    puts "Congratulations! You guessed the sequence #{secret}.Do you want to play again?Y/N"
    user_choice=gets.chomp.upcase
    if user_choice=="Y"
      master_mind
    else
      puts "That's too bad,"
      abort("goodbye")
    end
  elsif (misses.length != 0)
    puts "You have #{matches.length} in the right place"
    puts "You have #{misses.length} in the wrong place"
    puts "Youve have guessed #{$hard_counter} times"
    puts "I am going to start again, please stand by....."
    play_hard secret
  else
    puts "Test"
  end
end
