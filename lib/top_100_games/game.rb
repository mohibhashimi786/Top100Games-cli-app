class Top100Games::Game 

	#attributes of a game
	attr_accessor :name, :rank, :consoles, :url, :category, :synopsis, :difficulty, :release_date, :esrb, :creator, :user_rating, :critic_score

	#an array of all top 100 games
	@@all = []

	#mass assignment initialization of attributes in case attributes are modified on the gamefaqs website.
	def initialize(name = nil, rank = nil, consoles = nil, url = nil)
		@name = name
		@rank = rank
		@consoles = consoles
		@url = url
		self.class.all << self
	end

	#all games created through scraper class 
	def self.create_from_index(game)
		name = game.css("span.name a").text
		rank = game.css("div.count").text
		consoles = game.css("span.sub").text
		url = "https://gamefaqs.gamespot.com#{game.css("a").attribute("href").text}"
		self.new(name, rank, consoles, url)
		doc ||= Nokogiri::HTML(open(url))
		category = doc.css("div.span8").css("ol.crumbs").css("li.crumb")[1].css("a").text
		synopsis = doc.css("div.desc").text
		difficulty = doc.css("div.rating.mygames_stats_diff.mygames_stat3").css("a").text
		release_date = doc.css("div.pod.pod_gameinfo").css("li")[3].css("a").text
		esrb = doc.css("span.esrb_logo").text.gsub(" - ", "")
		creator ||= doc.css("div.pod.pod_gameinfo").css("li")[2].css("a").text
		user_rating = doc.xpath("//*[@id='js_mygames_rate']/div[1]/div/div/a").text
		critic_score = doc.css("div.score.metacritic_high").text
		binding.pry
	end

	def self.all
		@@all 
	end

end

