class RecipesController < ApplicationController

  #método que define o endpoint
  def index
    #o @ é para criar variaveis de instancia (mandar para view)
    @recipes = Recipe.all #.all é um metodo para criar um vetor com os dados armazenados na base de dados relacionados
    render json: @recipes #cria um Json com o vetor acima
  end

  def new
    @recipes = Recipe.new
  end

  def create
    @recipes = Recipe.new(recipes_params)

    if @recipes.save
      redirect_to @recipes, notice: 'Recipe created!'
    else
      render 'new'
    end
  end

  def show
    @recipes = Recipe.find(params[:id])

    @product
  end

  def edit
    @recipes = Recipe.find(params[:id])

    @recipes
  end

  def update
    @recipes = Recipe.find(params[:id])

    if @recipes.update(recipes_params)
      redirect_to @recipes, notice: 'Recipe changed'
    else
      render 'edit'
    end
  end

  def destroy
    @recipes = Recipe.find(params[:id])

    if @recipes.destroy
      redirect_to recipes_path, notice: 'Recipe deleted'
    else
      redirect_to recipes_path, alert: 'Ops, something went wrong'
    end
  end

  private

  def recipes_params
    params.require(:recipes).permit(:id, :name, :description)
  end
end
