
  $secret=["g","y","r","b"].shuffle

  def master_mind
    puts "Welcome to MASTERMIND. Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    userInput= gets.chomp.upcase
  case
    when userInput== "P" then play_time
    when userInput== "I" then puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. You have to guess what that sequence is. I will tell you when you are right and when you are wrong"
    master_mind
    when userInput=="Q" then puts "That's too bad, Goodbye"
    end
  end

def play_time
  puts "I have generated a beginner sequence with four elements made up of:(r)ed,(g)reen,(b)lue,and (y)ellow. Use (q)uit at any time to end the game. What's your guess? (If you want to cheat, type C)"
  user_guess= gets.chars.to_a
  user_guess.each do |letter|
    if (letter=="C" or letter=="c")
      puts $secret.join(",")
      play_time
    elsif (letter=="q" or letter=="Q")
      puts "That's too bad, goodbye"
    else
	     matches = Array.new
       misses = Array.new
       $secret.each_with_index do |letter, index|
  		     if(letter == user_guess[index])
  			        matches.push(index)
           else
                misses.push(index)
              end
            end
          end
    if (misses.length==0)
             puts "Congratulations! You guessed the sequence #{$secret}.Do you want to play again?Y/N"
             winner
    elsif (misses.length != 0)
          puts "You have #{matches.length} in the right place"
          puts "You have #{misses.length} in the wrong place"
          puts "I am going to start again, please stand by....."
          play_time
        end
  end
end

def winner
  player_choice=gets.upcase
 if (player_choice == "Y")
     puts"hi"
 else
     "goodye"
 end
  end
master_mind
