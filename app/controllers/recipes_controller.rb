class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new

  end

  def create
    recipe = Recipe.new(
                        title: params[:title],
                        chef: params[:chef],
                        ingredients: params[:ingredients],
                        directions: params[:directions]
                        )
     recipe.save
     flash[:success] = "Recipe Successfully Created"
     redirect_to "/recipes/#{recipe.id}"
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])

    recipe.assign_attributes(
                        title: params[:title],
                        chef: params[:chef],
                        ingredients: params[:ingredients],
                        directions: params[:directions]
                        )

    #recipe.update does assign_attributes and save

    # recipe.title = params[:title]
    # recipe.chef = params[:chef]
    # recipe.ingredients = params[:ingredients]
    # recipe.directions = params[:directions]
    recipe.save
    flash[:success] = "Successfully updated"
    redirect_to "/recipes/#{ recipe.id }"
  end
  def delete
    @recipe = Recipe.find(params[:id])

    @recipe.destory
    flash[:success] = "Successfully deleted"
    redirect_to '/recipes'
  end
end


