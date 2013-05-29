class DecksController < ApplicationController
	before_filter :authenticate

	def index
		#deck that belong to user
		@decks = current_user.decks
	end

	def show
		@deck = find_deck  #current_user.decks.find(params[:id])
		#@deck = Deck.find(params[:id])
		@cards = @deck.cards
	end

	def new
		@deck = current_user.decks.new
	end

	def create
		@deck = current_user.decks.new(params[:deck])
		@deck.save
		redirect_to decks_path
	end

	#def create
 	# @zombie = Zombie.create(params[:zombie])
  	#redirect_to zombie_path(@zombie)
	#end

	def edit
		@deck = find_deck
	end

	def update
		@deck = find_deck
		@deck.update_attributes(params[:deck])
		#redirect_to decks_path(@deck.id)
		redirect_to @deck
	end

	def destroy
		@deck = find_deck
		@deck.destroy
		redirect_to decks_path
	end

	private  #make sure it is nor an action
	def find_deck
		current_user.decks.find(params[:id])
		#Deck.find(params[:deck_id])
	end
end


