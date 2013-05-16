class DecksController < ApplicationController
	def index
		@decks = Deck.all
	end

	def show
		@deck = Deck.find(params[:id])
	end

	def new
		@deck = Deck.new
	end

	def create
		@deck = Deck.new(params[:deck])
		@deck.save
		redirect_to "/decks"
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
		redirect_to "/decks/#{@deck.id}"
	end

	def destroy
		@deck = Deck.find(params[:id])
		@deck.destroy
		redirect_to "/decks"
	end
end


