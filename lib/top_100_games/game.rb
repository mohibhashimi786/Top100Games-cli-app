class Top100Games::Game 

	#attributes of a game
	attr_accessor :name, :rank, :consoles, :url

	#an array of all top 100 games
	@@all = []

	#mass assignment initialization of attributes in case attributes are modified on the gamefaqs website.
	def initialize(attributes)
		attributes.each {|key, value| self.send(("#{key}="), value)}
		self.class.all << self
	end

	def self.create_from_index(game_attributes)
		new_game = self.new(game_attributes)
		

	def self.all
		@@all 
	end

end

