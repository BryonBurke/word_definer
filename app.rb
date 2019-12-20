require('sinatra')
    require('sinatra/reloader')
    require('./lib/words')
    also_reload('lib/**/*.rb')
    get('/') do
      "This is the home page"

    end
    get('/words') do
      "This route will show a list of words"

    end

    get('/words/new') do
      "This route will add a new word"

    end

    # get('/words/:id') do
    #
    # end
    # post('/words') do
    #
    # end
    #
    # get('/words/:id/edit') do
    #
    # end
    #
    # patch('/words/:id') do
    #
    # end
    #
    # delete('/words/:id') do
    #
    # end
    #
    # get('/custom_route') do
    #
    # end
    # 
