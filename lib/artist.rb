class Artist
  attr_accessor :name, :genre
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
    Artist.new(name).tap {|artist| artist.save}
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end
  
  def genres
    genre_collection = []
    songs.map do |g|
      genre_collection << g.genre
    end
    genre_collection.uniq
  end
  
end