class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/recipes"
  end

  #index
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # code actions here!
  get '/recipes/new' do
    @recipe_list = Recipe.new(params)
    # binding.pry
    erb :new
  end

  #edit
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    # binding.pry
    erb :edit
  end

  #create
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  #show
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  #update
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{ @recipe.id }"
  end

  # delete "recipes/:id" do
  #   Recipe.destroy(params[:id])
  #   redirect to "/recipes"
  # end

  delete '/recipes/:id' do #destroy action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end
