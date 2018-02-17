class Top100Games::Scraper

	
	#gets the html page for us using Nokogiri
	def get_page
		Nokogiri::HTML(open("https://gamefaqs.gamespot.com/games/topgamesrollup"))
	end

	#scrape the website to get names and top level attributes of top games
	def scrape_top_games_index
		self.get_page.css(".pod_topgames ol li")
		rank = items.css("div.count").text
		name = items.css("span.name a").text
		consoles = items.css("span.sub").text
		url = "https://gamefaqs.gamespot.com#{items.css("a").attribute("href").text}"
	end

	#scrape individual game's attributes
	def create_game_profile
		
			
	end




end
