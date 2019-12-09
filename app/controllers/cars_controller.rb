class CarsController < ApplicationController
    def index 
    end

    def new
        @car = Car.new
        @car_models = CarModel.all
        @subsidiaries = Subsidiary.all  
    end
    
    def create 
        @car = Car.new(params.require(:car).permit(:license_plate, :color,
                                                   :mileage, :car_model_id, 
                                                   :subsidiary_id))
        if @car.save!
            flash[:notice] = 'Carro criado com sucesso'
            redirect_to @car
        else
            @car_models = CarModel.all
            @subsidiaries = Subsidiary.all
            render :new 
        end
         
    end

    def show
        @car = Car.find(params[:id])
    end
end