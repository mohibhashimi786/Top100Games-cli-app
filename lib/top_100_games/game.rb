class Top100Games::Game 

	#attributes of a game
	attr_accessor :name, :rank, :consoles, :url

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

	def self.create_from_index(game)
		self.new(game.css("span.name a").text)
		binding.pry
	end

	def self.all
		@@all 
	end

end

