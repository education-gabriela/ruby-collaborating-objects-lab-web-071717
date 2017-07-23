require 'pry'
class Song
  @@all_songs = []

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
    self.save
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all_songs
  end

  def self.new_by_filename(filename)
    # binding.pry
    song_array = filename.split(" - ")
    song = self.new(song_array[1])
    # binding.pry
    artist =  Artist.find_or_create_by_name(song_array[0])
    # binding.pry
    song.artist = artist
    artist.add_song(self)

    # binding.pry
    song
  end
end
