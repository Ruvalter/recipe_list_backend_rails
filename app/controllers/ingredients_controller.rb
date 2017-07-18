class IngredientsController < ApplicationController
  #método que define o endpoint
  def index
    #o @ é para criar variaveis de instancia (mandar para view)
    @ingredients = Ingredient.all #.all é um metodo para criar um vetor com os dados armazenados na base de dados relacionados
    render json: @ingredients #cria um Json com o vetor acima
  end

  def new
    @ingredients = Ingredient.new
  end

  def create
    @ingredients = Ingredient.new(ingredients_params)

    if @ingredients.save
      render json: @ingredients
    else
      render json: @ingredients.errors.messages
    end
  end

  def ingredients_params
    params.require(:ingrdients).permit(:id, :name, :amount)
  end

end
