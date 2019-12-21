
class Word
  attr_accessor :name
  attr_reader :id

  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1

  end

  def save
    @@words[self.id] = Word.new({ :name => self.name, :id => self.id })
  end
