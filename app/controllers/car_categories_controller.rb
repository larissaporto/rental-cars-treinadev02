class CarCategoriesController < ApplicationController
    before_action :authenticate_user! 
    before_action :authorize_admin   
    
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
    def edit
        @category =CarCategory.find(params[:id])
    end
    def update
        @category = CarCategory.find(params[:id])
        if @category.update(category_params)
            flash[:notice] = 'Categoria atualizada com sucesso'
            redirect_to @category
        else
            render :edit
        end
    end

    private
    def category_params
        params.require(:car_category).permit(:name, :daily_rate, 
                                             :car_insurance, 
                                             :third_party_insurance )
    end
    def authorize_admin
        redirect_to root_path unless current_user.admin?
    end
end
