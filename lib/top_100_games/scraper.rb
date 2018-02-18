class Top100Games::Scraper

	
	#gets the html page for us using Nokogiri
	def get_page
		Nokogiri::HTML(open("https://gamefaqs.gamespot.com/games/topgamesrollup"))
	end

	#scrape the website to get names and top level attributes of top games
	def scrape_top_games_index
		self.get_page.css(".pod_topgames ol li")
	end

	#scrape individual game and its required attributes through game class's 'create_from_index(game) class method'
	def create_game_profile
		scrape_top_games_index.each do |game| 
			Top100Games::Game.create_from_index(game) 
			binding.pry
		end
	end




end
