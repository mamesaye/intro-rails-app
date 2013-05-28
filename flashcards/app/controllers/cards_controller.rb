class CardsController < ApplicationController
	
	def show
		@deck = find_deck
		@card = find_card (@deck)
		#@card = Card.find(params[:id])
		#@cards = @deck.cards
	end

	def new
		@deck = find_deck
		@card = @deck.cards.new
		#@card = Card.new
	end

	def create
		@deck = find_deck
		@card = @deck.cards.new(params[:card])
		@card.save
		redirect_to @deck
	end

	def edit
		@deck = find_deck
		@card = @deck.cards.find(params[:id])
	end

	def update
		@deck = find_deck
		@card = find_card (@deck)
		#@card = @deck.cards.find(params[:id])

		@card.update_attributes(params[:card])

		#redirect_to cards_path(@card.id)
		#redirect_to deck_card_path
		redirect_to @deck
	end

	def destroy
		#@card = Card.find(params[:id])
		@deck = find_deck
		@card = find_card (@deck)
		@card.destroy
		redirect_to @deck
		#redirect_to decks_path + "/#{params[:deck_id]}"
	end

	private  #make sure it is nor an action
	def find_deck
		Deck.find(params[:deck_id])
	end
	def find_card deck
		deck.cards.find(params[:id])
	end
end



