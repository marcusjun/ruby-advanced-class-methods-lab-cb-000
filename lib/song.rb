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
    new_song=self.new
    new_song.save
    new_song

    #@@all<<new_song#self.new
    #self.class.all<<self.new
  end

  def self.new_by_name (name)
    new_song=self.new
    new_song.name=name
    #@name=name
    new_song
  end

  def self.create_by_name(name)
    #TRYING TO SIMPLIFY CODE BUT CAN'T GET IT TO WORK
    #new_song=self.new_by_name(name)
    #new_song.save
    #self.create.name=name
    #self.new_by_name(name).save
    self.class.all<<self.new_by_name(name)

    #LONG VERSION
    #works but I could simplify by calling other methods?
    #new_song=self.new
    #new_song.name=name
    #new_song.save
    #new_song

    #self.class.all<<new_song
  end

  def self.find_by_name(name)
    self.all.detect {|music| music.name==name}
    #@@all.detect {|music| music.name==name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end

    #if self.all.include? {|music| music.name==name}
      #self.find_by_name(name)
      #music.find_by_name(name)
    #else
      #self.create_by_name(name)
      #music.create_by_name(name)
    #end
  end

  def self.alphabetical
    self.all.sort_by {|music| music.name}
    #self.all.sort
  end

  def self.new_from_filename(mp3_data)
    data=mp3_data.split(" - ")

    artist_name=data[0]
    name=data[1]#.split(".")[0]

    new_song=self.new
    new_song.artist_name=artist_name
    new_song.name=name.split(".mp3").join
    new_song
  end

  def self.create_from_filename(mp3_data)
    #easier to call the new_from_filename method
    #and then the save method
    self.new_from_filename(mp3_data).save

    ######################################
    #LONG VERSION OF CODE
    #data=mp3_data.split(" - ")

    #artist_name=data[0]
    #name=data[1]#.split(".")[0]

    #new_song=self.new
    #new_song.artist_name=artist_name
    #new_song.name=name.split(".mp3").join
    #@@all<<new_song


    ######################################
    #CODE THAT DIDN'T WORK
    #new_song
    #rows = mp3_data.split("\n")
    #music=rows.collect do |row|
      #data=row.split("-")
      #artist_name=data[0]
      #name=data[1]#.split(".")[0]

      #new_song=self.new
      #new_song.artist_name=artist_name
      #new_song.name=name
      #@@all<<new_song
      #new_song

      #musician=self.new
      #musician.name=name
      #musician.artist_name=artist_name
      #@@all<<musician
      #self.class.all<<musician
      #musician
    #end
    #music
  end

  def self.destroy_all
    self.all.clear
    #@@all.clear
  end

end
