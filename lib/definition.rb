class Definition
  attr_reader :id
  attr_accessor :name, :word_id, :artist_name, :year_recorded, :studio

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @word_id = attributes.fetch(:word_id)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def ==(definition_to_compare)
    (self.name() == definition_to_compare.name()) && (self.word_id() == definition_to_compare.word_id())
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new({:name => @name, :word_id => @word_id, :id => @id})
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(name, word_id, artist_name, year_recorded, studio)
    self.name = name
    self.word_id = word_id
    # self.artist_name = artist_name
    # self.year_recorded = year_recorded
    # self.studio = studio
    @@definitions[self.id] = Definition.new({:name => @name, :word_id => @word_id, :id => @id, :artist_name => @artist_name, :year_recorded => @year_recorded, :studio => @studio})
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.clear
    @@definitions = {}
  end

  def self.find_by_word(wrd_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == wrd_id
        definitions.push(definition)
      end
    end
    definitions
  end

  def word
    Word.find(self.word_id)
  end
end
