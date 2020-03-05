class CocktailsController < ApplicationController
  before_action :create_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    ingredients = Ingredient.all
    @ingredient_array = []
    ingredients.each do |ingredient|
      @ingredient_array << ingredient.name
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  private

  def create_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :image_url)
  end
end
