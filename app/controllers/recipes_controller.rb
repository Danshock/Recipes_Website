class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:show, :index]
	
	def index
		@recipes = Recipe.all.order("created_at DESC")

		respond_to do |format|
			format.html 
			format.json { render json: @recipes }
		end 
	end

	def show
	end

	def new
		@recipe = current_user.recipes.build

		respond_to do |format|
			format.html
			format.json { render json: @recipe }
		end
	end

	def create
		@recipe = current_user.recipes.build(recipe_params)
		
	    respond_to do |format|
		    if @recipe.save
			    format.html { redirect_to root_path, notice: "Recipe was successfully created." }
			    format.json { render json: @recipe, status: :created, location: @recipe }
		    else
			    format.html { render action: "new" }
			    format.json { render json: @recipe.errors, status: :unprocessable_entity }
		    end
	    end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @recipe.update(recipe_params)
				format.html { redirect_to @recipe, notice: "Recipe was successfully updated." }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @recipe.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		  @recipe.destroy

		  respond_to do |format|
		  	format.html { redirect_to root_path }
		  	format.json { head :no_content }
		  end
	end

	private

	def recipe_params
		params.require(:recipe).permit(:title, :description)
	end

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end
end
