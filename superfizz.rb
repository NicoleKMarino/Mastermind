

def super_fizz(number)
fizzThree = (number % 3 == 0)
fizzFive = (number % 5 == 0)
fizzSeven = (number % 7 == 0)
case
  when fizzThree then puts 'Fizz'
  when fizzThree && fizzSeven && fizzFive then puts 'Super FizzBuzz'
  when fizzThree && fizzSeven then  puts 'Super Fizz'
  when fizzFive && fizzSeven then  puts 'Super Buzz'
  when fizzFive && fizzThree then puts 'FizzBuzz'
  when fizzFive then puts 'Buzz'
  else puts number
end
  end

(1..1000).each {|n| super_fizz n}
#for each number, n is the current number and I'm passing n into super_fizz
