class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end


  def self.create
   song = self.new
   @@all << song
   song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
def self.create_by_name(name)
    song = self.new 
    song.name = name
    @@all << song
    song
  end
  
  
  def self.find_by_name(name)
    @@all.find{|x| x.name == name}
  end
  
  def self.find_or_create_by_name(name)
    x = self.find_by_name(name)
    if x
      x
    else self.create_by_name(name)
  end
end
  
def self.alphabetical
  @@all.sort_by{|song| song.name}
end


def self.new_from_filename(filename)
   song_array = filename.split(" - ")
   song_array[1] = song_array[1].chomp(".mp3")
   song = self.new
   song.name = song_array[1]
   song.artist_name = song_array[0]
   song
end


def self.create_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    @@all << song
  end
  
  
def self.destroy_all
  @@all.clear
end
  
end
