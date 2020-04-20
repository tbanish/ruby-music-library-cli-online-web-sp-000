class Genre
  attr_accessor :name, :songs, :artist
  extend Concerns::Findable
  
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
    Genre.new(name).tap {|genre| genre.save}
  end
  
  def artists
    artist_collection = []
    songs.map do |a|
      artist_collection << a.artist
    end
    artist_collection.uniq
  end

end