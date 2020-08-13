class MusicLibraryController

  def initialize(path = './db/mp3s')
    music = MusicImporter.new(path)
    music.import
  end
end