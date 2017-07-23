class Artist
  @@all = []

  attr_accessor :songs, :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    self.songs << song
  end

  def save
    self.class.all << self
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end

  def self.find_by_name(name)
    self.all.find do |artist|
      artist.name == name
    end
  end

  def self.find_or_create_by_name(name)
    artist = self.find_by_name(name)

    unless !!artist
      artist = self.new(name)
      artist.save
    end

    artist
  end

  def self.all
    @@all
  end

  def self.reset_all
    self.all.clear
  end

end
