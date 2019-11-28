class ManufacturersController < ApplicationController
    def index
        @fabricantes = Manufacturer.all
    end
    def show
        id = params[:id]
        @fabricante = Manufacturer.find(id)
    end
end
