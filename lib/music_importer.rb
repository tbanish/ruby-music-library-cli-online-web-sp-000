class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.chdir(@path) do |path|
      Dir.glob("*.mp3")
    end
  end
  
  def import
    imported_files = self.files
    imported_files.each do |file|
      new_song = Song.create_from_filename(file)
    end
  end
  
end