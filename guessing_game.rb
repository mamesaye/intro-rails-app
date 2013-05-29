puts "Welcome to my guesing game"
puts "_ " * 20
print "guess my number > "
number = 5
guess =  gets.to_i
puts guess.inspect
if guess == number
	puts "YOU WIN!!!"
else
	puts "You lost the number was " + number.to_s
	puts "You lost the number was #{number}" 
end