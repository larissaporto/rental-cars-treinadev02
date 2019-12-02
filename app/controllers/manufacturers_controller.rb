class ManufacturersController < ApplicationController
    def index
        @fabricantes = Manufacturer.all
    end
    def show
        id = params[:id]
        @manufacturer = Manufacturer.find(id)
    end
    def new
        @manufacturer = Manufacturer.new
    end
    def create
        @manufacturer = Manufacturer.new(manufacturer_params)
        @manufacturer.save
        redirect_to manufacturer_path(@manufacturer.id)
    end

    private
    def manufacturer_params
        params.require(:manufacturer).permit(:name)
    end
end
