class MusicLibraryController

  def initialize(path = './db/mp3s')
    music = MusicImporter.new(path)
    music.import
  end

  def call
    loop do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.chomp
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      elsif input == "exit"
        break
      end
    end
  end

  def list_songs
    @song_array = []
    abc_songs = Song.all.sort_by{ |song| song.name}

    counter = 1
    abc_songs.collect do |song|
    @song_array << "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end

    @song_array.each do |song|
      puts "#{song}"
    end
  end

  def list_artists
    artist_array =[]

    Artist.all.each do |artist|
      artist_array << artist.name
    end

    abc_artists = artist_array.sort

    counter = 1
    abc_artists.each do |artist|
      puts "#{counter}. #{artist}"
      counter += 1
    end
  end
end
