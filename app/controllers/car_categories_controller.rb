class CarCategoriesController < ApplicationController
    
#    http_basic_authenticate_with name: "admin", password: "secret"
    
    def index
        @categorias = CarCategory.all
    end
    def show
        @categoria = CarCategory.find(params[:id])
    end
    def new
        @category = CarCategory.new
    end
    def create
        @category = CarCategory.create(category_params)
        redirect_to @category 
    end
    private
    def category_params
        params.require(:car_category).permit(:name, :daily_rate, 
                                             :car_insurance, 
                                             :third_party_insurance )
    end

end
