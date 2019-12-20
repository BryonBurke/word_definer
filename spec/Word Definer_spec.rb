
    require('rspec')
    require('Word Definer')

    describe(word) do
    describe('#my_method') do
      it('test') do
        test = word.new()
        expect(test.my_method()).to(eq('test'))
      end
    end
  end
  