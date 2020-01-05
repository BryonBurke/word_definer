require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe '#Word' do

  before(:each) do
    Word.clear
    Definition.clear
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a word") do
      word = Word.new({:name => "catfish", :id => nil})
      word.save()
      word2 = Word.new({:name => "hushpuppies", :id => nil})
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new({:name => "catfiesh", :id => nil})
      word.save()
      word2 = Word.new({:name => "hushpuppies", :id => nil})
      word2.save()
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end



  describe('.find') do
    it("finds an word by id") do
      word = Word.new({:name => "catfiesh", :id => nil})
      word.save()
      word2 = Word.new({:name => "hushpuppies", :id => nil})
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates an word by id") do
      word = Word.new({:name => " catfish", :id => nil})
      word.save()
      word.update(" catfish")
      expect(word.name).to(eq(" catfish"))
    end
  end

  describe('#delete') do
    it("deletes an word by id") do
      word = Word.new({:name => " catfish", :id => nil})
      word.save()
      word2 = Word.new({:name => "hushpuppies", :id => nil})
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('#definitions') do
    it("returns an word's definitions") do
      word = Word.new({:name => " catfish", :id => nil})
      word.save()
      definition = Definition.new({:name => "a big fish that lives in the river", :word_id => word.id, :id => nil})
      definition.save()
      definition2 = Definition.new({:name => "the best fish for dinner by far", :word_id => word.id, :id => nil})
      definition2.save()
      expect(word.definitions).to(eq([definition, definition2]))
    end
  end


  describe('.sort') do
    it("sorts words by name") do
      word = Word.new({:name => "hushpuppies", :id => nil})
      word.save()
      word2 = Word.new({:name => " catfish", :id => nil})
      word2.save()
      word3 = Word.new({:name => "cole slaw", :id => nil})
      word3.save()
      expect(Word.sort()).to(eq([word2, word3, word]))
    end
  end

end
