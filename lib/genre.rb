class Genre
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    created_genre = self.new(name)
    created_genre.save
    created_genre
  end

  def songs
    @songs
  end

end
