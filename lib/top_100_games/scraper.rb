class Top100Games::Scraper

	
	#gets the html page for us using Nokogiri
	def get_page
		Nokogiri::HTML(open("https://gamefaqs.gamespot.com/games/topgamesrollup"))
	end

	#scrape the website to get names and attribute of top games
	def scrape_top_games_index
		self.get_page.css(".pod_topgames ol li")
	end

	def create_game_profile
		scrape_top_games_index.each { |game| Top100Games::Game.create_from_index(game)}
			binding.pry
	end




end
