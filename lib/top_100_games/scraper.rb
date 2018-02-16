class GamesTopTen::Scraper

	
	#gets the html page for us using Nokogiri
	def get_page
		Nokogiri::HTML(open("https://gamefaqs.gamespot.com/games/topgamesrollup"))
	end

	#scrape the website to get names and attribute of top games
	def scrape_top_games_index
		doc = self.get_page.css(".pod_topgames ol li")
		doc.each do |items|
			rank = items.css("div.count").text
			name = items.css("span.name a").text
			consoles = items.css("span.sub").text
			url = "https://gamefaqs.gamespot.com#{items.css("a").attribute("href").text}"
			binding.pry
	end

		
	end

	def single_game_profile
		
	end




end
