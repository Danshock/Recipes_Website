class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]
	
	def index
		if params[:category].blank?
			@recipes = Recipe.all.order("created_at DESC")

			respond_to do |format|
				format.html 
				format.json { render json: @recipes }
			end
		else
			@category_id = Category.find_by(name: params[:category]).id
			@recipes = Recipe.where(:category_id => @category_id).order("created_at DESC")

			respond_to do |format|
				format.html 
				format.json { render json: @recipes }
			end
		end 
	end

	def show
		if @recipe.reviews.blank?
			@average_review = 0
		else
			@average_review = @recipe.reviews.average(:rating).round(2)
		end
	end

	def new
		@recipe = current_user.recipes.build
		@categories = Category.all.map{ |c| [c.name, c.id] }
		
		respond_to do |format|
			format.html
			format.json { render json: @recipe }
		end
	end

	def create
		@recipe = current_user.recipes.build(recipe_params)
		@recipe.category_id = params[:category_id]
		
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
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def update
		@recipe.category_id = params[:category_id]
		
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
		params.require(:recipe).permit(:title, :description, :category_id, :recipe_img)
	end

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end
end
