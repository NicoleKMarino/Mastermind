require "~/Documents/mod1/MMhard.rb"
require "~/Documents/mod1/MMsuper.rb"


def get_secret(difficulty)
  secret = case difficulty
  when "easy" then get_random(["g","y","r","b"], 4)
  when "hard" then get_random(["g","y","r","b","p","r"], 6)
  when "super" then get_random(["g","y","r","b","p","r","p","a"], 8)
  end
  return secret
end

def get_random(letters, length)
  return Array.new(length){letters.sample}
end

def master_mind
  start_time = Time.now
  counter=0
  puts "Welcome to MASTERMIND. Would you like to play on (e)asy, play on (h)ard, or play on (s)uper hard. Read the (i)nstructions, or (q)uit?"
  userInput= gets.chomp.upcase
  case userInput
  when "E" then play_time(get_secret("easy"),start_time, counter)
  when "H" then play_hard(get_secret("hard"), start_time, counter)
  when "S" then play_super(get_secret("super"), start_time, counter)
  when "I"
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. You have to guess what that sequence is. I will tell you when you are right and when you are wrong"
    master_mind
  when "Q" then   abort("That's too bad, goodbye")
  else
    puts "That's not an option."
    master_mind
  end
end

def play_time(secret, start_time, counter)
  matches= []
  misses= []
  puts "I have generated a beginner sequence with four elements made up of:(r)ed,(g)reen,(b)lue,and (y)ellow. Use (q)uit at any time to end the game. What's your guess? (If you want to cheat, type C)"
  user_guess= gets.chomp
  if (user_guess=="C" || user_guess=="c")
    puts secret.join(",")
    play_time(secret, start_time, counter)
  elsif (user_guess=="q" || user_guess=="Q")
    puts "That's too bad, I'll re-route you to the main menu"
    master_mind
  elsif user_guess.length < 4
    counter+=1
    puts "That's not long enough, remember, 4 characters"
    play_time(secret, start_time, counter)
  elsif user_guess.length > 4
    counter+=1
    puts "That's too long. Remember, only 4 characters."
    play_time(secret,start_time, counter)
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
    play_time(secret,start_time,counter)
  else
    puts "test"
  end
end

def find_correct(secret, user_guess)
  correct_answers = 0
  secret.each do |letter|
    letter_index = user_guess.index(letter)
    if(letter_index != nil)
      correct_answers += 1
      user_guess.delete_at(letter_index)
    end
  end
  return correct_answers
end

def convert_time(time_taken)
  mm, ss = time_taken.divmod(60)
  return "%d minutes and %d seconds" % [mm,ss]
end


master_mind
