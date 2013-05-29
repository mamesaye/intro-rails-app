module Flashcards 

class Application
	def initialize 
		@decks = []
	end
	def << deck
		@decks << deck
	end
	def play
		display_decks
		puts "Pick a deck: "
		deck = get_deck
		deck.play
	end
	def display_decks
		@decks.each { |deck| puts deck.name }
		#replace the do block
		#@decks.each do |deck|
			#puts deck.name
		#end
	end
	def get_deck
		name = gets.chomp 
		@decks.detect do |deck|
			deck.name == name
		end
	end

end


class Card
	attr_accessor :front, :back

	def initialize(front, back)
		@front = front
		@back = back
	end

	def correct? guess
		guess == @back
	end

	def play
		puts "#{front} > "
		guess = gets.chomp

		if correct? guess
			puts "correct"
		else
			puts "incorrect. the answer was #{back}."
		end
	end
end

class MultipleAnswerCard < Card
	def correct? guess 
		answers = @back.split(",")
		answers.any? {|answer| answer == guess}
	end
end

class Deck
	attr_reader :cards, :name
	def initialize name
		@name = name
		@cards = []
	end

def << card
	@cards << card
end

def play
	puts "Playing the #{name} deck."
	shuffle
	@cards.each(&:play)
	#replace the do block
	#@cards.each do |card|
	#	card.play
	#end
end

def shuffle
	  @cards.shuffle!  #<=> @cards = @cards.shuffle
end

end
end

#card = MultipleAnswerCard.new("violon", "baiorin, viiorin")
cardd = Flashcards::MultipleAnswerCard.new("manger", "boire, dormir")
card1 = Flashcards::Card.new("cat", "neko")
card2 = Flashcards::Card.new("dog", "inu")
card3 = Flashcards::Card.new("snake", "hebi")

deck = Flashcards::Deck.new ("japanese")
#deck << card
deck << card1
deck << card2
deck << card3

deck2 = Flashcards::Deck.new ("russian")
deck2 << cardd

app = Flashcards::Application.new
app << deck
app << deck2
app.play


=begin
deck.shuffle

deck.cards.each do |card|
	front = card.front
	back = card.back
	print "#{front} > "
	guess = gets.chomp

	if card.correct? guess
		puts "correct"
	else
		puts "incorrect. the answer was #{back}."
	end
end
=end

