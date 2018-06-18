def main 
	ran_num = rand(1..50).to_i
 	puts "Please Input number between 1-50 or 'hint' or 'secret'"
	secret_number(ran_num)
end

def secret_number(ran_num)
	round = 0
	answer_arr = []
	while round < 5
		check = 0
		print "Input : "
		user_input = gets.chomp
		if user_input.downcase == "hint"
			hint(ran_num)
		elsif user_input.downcase == "secret"
			puts "secret number is #{ran_num}"
		else 
			user_input = user_input.to_i
			if answer_arr.include? (user_input)
				puts "Your answer is duplicate"
        		next
			elsif user_input < 1 or user_input > 50
				puts "Please Input number between 1-50 or 'hint' or 'secret'"
        		next
			elsif user_input > ran_num
				puts "Your answer is upper than secret number"
			elsif user_input < ran_num
				puts "Your answer is lower than secret number"
			else user_input == ran_num
				puts "Your answer is Correct!! Secret number is #{ran_num}"
				break
			end
			answer_arr[round] = user_input
			round += 1
		end
		if round == 5 
			puts "Answer history is #{answer_arr}"
			puts "Your answer is incorrect!!! Secret number is #{ran_num}"
		end
	end
end

def hint(number)
  ran_num = rand(3..10).to_i
  low = number-ran_num
  high = number+ran_num
  if (low < 0) 
    low = 0
  end
  if (high > 50)
    high = 50
  end
  puts "hint : secret number (#{low} to #{high})"
end

main if _FILE_ = $0