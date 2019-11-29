class CarCategoriesController < ApplicationController
    
    http_basic_authenticate_with name: "admin", password: "secret"
    
    def index
        @categorias = CarCategory.all
    end
    def show
        @categoria = CarCategory.find(params[:id])
    end
end
