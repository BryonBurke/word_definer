require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_name', :with => 'Fireplace')
    click_on('Add word')
    expect(page).to have_content('Fireplace')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates an word and then goes to the word page') do
    word = Word.new({:name => "Fireplace", :id => nil})
    word.save
    visit("/words/#{word.id}")
    fill_in('definition_name', :with => 'A place to make smores')
    click_on('Add definition')
    expect(page).to have_content('A place to make smores')
  end
end
