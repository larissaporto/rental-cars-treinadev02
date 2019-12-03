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
        if @manufacturer.save
           redirect_to manufacturer_path(@manufacturer.id)
        else
            flash.now[:alert] = 'Você deve preencher todos os campos'           
            render :new
        end
    end
    def edit
        @manufacturer = Manufacturer.find(params[:id])
    end
    def update
        @manufacturer = Manufacturer.find(params[:id])
        if @manufacturer.update(manufacturer_params)
           flash[:notice] = 'Fabricante atualizada com sucesso'
           redirect_to @manufacturer
        else
            flash.now[:alert] = 'Você deve preencher todos os campos'
            render :edit
        end
    end

    private
    def manufacturer_params
        params.require(:manufacturer).permit(:name)
    end
end
