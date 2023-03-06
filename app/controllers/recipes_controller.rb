class RecipesController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        @current_user = User.find_by(id: session[:user_id])

        if @current_user
        recipes = Recipe.all
        render json: recipes, include: :user
        else
            render json: { errors: ["a kind of Array"] }, status: :unauthorized
        end
    end

    def create
        user = User.find_by(id: session[:user_id])

        if user

        
        new_recipe = user.recipes.create!(recipe_params)

        render json: new_recipe, include: :user, status: :created

    else
        render json: { errors: ["a kind of Array"] }, status: :unauthorized
        end
    end

    def show 
    
    end
    
    private 

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete, :user_id)
    end

    def render_unprocessable_entity(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
        
    end
    
end
