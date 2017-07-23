class MP3Importer
  attr_reader :path
  attr_accessor :files

  def initialize(path)
    @path = path
    @files = Dir.glob(self.path + "/*.mp3").collect  {|file| self.normalize_filename(file)}
  end

  def import
    self.files.each do |file|
      Song.new_by_filename(file)
    end
  end

  def normalize_filename(filename)
    rindex_file = filename.rindex("/") + 1
    filename[rindex_file..filename.length]
  end
end
