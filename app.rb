require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('./lib/song')
require('pry')
gem('sinatra-contrib')
also_reload('lib/**/*.rb')


get('/') do
  redirect to('/words')
end

get('/words') do
  @words = Word.sort
  @words_sold = Word.all_sold
  erb(:words)
end

get('/words/search') do
  user_search = params[:search]
  @search = Word.search(user_search)
  erb(:search)
end


get ('/words/new') do
  erb(:new_word)
end

post ('/words') do
  name = params[:word_name]
  word = Word.new({:name => name, :id => nil})
  word.save()
  redirect to('/words')
end

get ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get ('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:name])
  redirect to('/words')
end

get ('/words/:id/buy') do

    @word = Word.find(params[:id].to_i())
    @word.sold
    redirect to('/words')
end

delete ('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  redirect to('/words')
end

get ('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end

post ('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new({:name => params[:definition_name], :word_id => @word.id, :id => nil})
  definition.save()
  erb(:word)
end

patch ('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:name], @word.id, params[:artist_name], params[:year_recorded])
  erb(:word)
end

delete ('/words/:id/definitions/:definition_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
