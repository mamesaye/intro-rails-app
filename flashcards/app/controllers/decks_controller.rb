class DecksController < ApplicationController
	before_filter :authenticate

	def index
		#deck that belong to user
		@decks = current_user.decks
	end

	def show
		@deck = Deck.find(params[:id])
		@cards = @deck.cards
	end

	def new
		@deck = Deck.new
	end

	def create
		@deck = Deck.new(params[:deck])
		@deck.save
		redirect_to decks_path
	end

	#def create
 	# @zombie = Zombie.create(params[:zombie])
  	#redirect_to zombie_path(@zombie)
	#end

	def edit
		@deck = Deck.find(params[:id])
	end

	def update
		@deck = Deck.find(params[:id])
		@deck.update_attributes(params[:deck])
		#redirect_to decks_path(@deck.id)
		redirect_to @deck
	end

	def destroy
		@deck = Deck.find(params[:id])
		@deck.destroy
		redirect_to decks_path
	end
end


