#CLI Controller

class Top100Games::CLI


	def call
		#lists the games for user
		list_games
		#Requests which game user would like more information on.
		menu
		#exits the program
		exit
	end

	def list_games
		#welcome user
		puts "Welcome to TOP 100 GAMES!"
		#lists the games from website 
	  		puts "1. Game A"
			puts "2. Game B"
			puts "3. Game C"
			puts "Currently, based on user and editor ratings, the above are your TOP 100 GAMES!"
	end

	def menu
		
		input = nil
	  	while input != "exit"
	  	#Asks user for choice of game he/she wishes more information on.
		puts "Please enter the game number or the name of the game for a synopsis as well as additional information!  If you would like to leave the program, please type 'exit'"
			  #gets user input
			  input = gets.strip

			  
		end
	end

	def exit
		Top100Games::Scraper.new.scrape_top_games_index
		binding.pry
		#Informs user that the list changes frequently and to come
		puts "Please come back soon.  The list is continously updated based upon user and editor ratings."
	end





end
