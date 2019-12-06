class CarModelsController < ApplicationController
    def index 
        @car_models = CarModel.all
    end

    def new
        @car_model = CarModel.new
        @manufacturers = Manufacturer.all 
        @car_categories = CarCategory.all 
    end

    def create
        @car_model = CarModel.new(params.require(:car_model).permit(:name, :year, :motorization, :fuel_type, 
                                                                    :car_category_id, :manufacturer_id))
        @car_model.save
        flash[:alert] = 'Modelo registrado com sucesso'
        redirect_to @car_model
    end

    def show
        @car_model = CarModel.find(params[:id])

    end
end