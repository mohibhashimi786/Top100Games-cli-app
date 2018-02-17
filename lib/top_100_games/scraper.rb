class Top100Games::Scraper

	
	#gets the html page for us using Nokogiri
	def get_page
		Nokogiri::HTML(open("https://gamefaqs.gamespot.com/games/topgamesrollup"))
	end

	#scrape the website to get names and top level attributes of top games
	def scrape_top_games_index
		self.get_page.css(".pod_topgames ol li")
		binding.pry
	end

	#scrape individual game's attributes
	def create_game_profile
		scrape_top_games_index.each do |games|
		Top100Games::Game.new_from_index(games)
		end
			
	end




end
