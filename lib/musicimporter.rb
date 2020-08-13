class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    Dir.chdir @path do
      @files = Dir.glob('*.mp3')
    end
  end

end
