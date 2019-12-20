require 'rspec'
require 'album'
require 'song'
require 'pry'

describe '#Word' do

  # before(:each) do
  #   Album.clear
  #   Song.clear
  # end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end
