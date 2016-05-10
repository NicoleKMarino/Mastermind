def super_buzz(number)
	resultString = ""
	if number % 3 == 0
		resultString = "Fizz"
	end
    #buzz is being added to an empty string
	if number % 5 == 0
		resultString = resultString + "Buzz"
	end
	if resultString.empty?
		puts number
	else
		if number % 7 == 0
			resultString = "Super " + resultString
		end
		puts resultString
	end
end

(1..1000).each {|n| super_buzz n}
