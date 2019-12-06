class RentalsController < ApplicationController
    def index 
    end

    def new
        @rental = Rental.new
        @clients = Client.all 
        @car_categories = CarCategory.all
    end

    def create
        @rental = Rental.new(params.require(:rental).permit(:start_date, :end_date, 
                                                            :client_id, :car_category_id))
        if @rental.save
            flash[:notice] = 'Locação agendada com sucesso'
            redirect_to @rental
        else
            @clients = Client.all 
            @car_categories = CarCategory.all 
            render :new
        end
    end

    def show
        @rental = Rental.find(params[:id])
    end
end