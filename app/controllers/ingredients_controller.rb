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
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      render json: @ingredient
    else
      render json: @ingredient.errors.messages
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :amount)
  end

end
