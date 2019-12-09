class ManufacturersController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin, only: [:edit, :update, :new, :create]
    before_action :set_manufacturer, only: [:edit, :update, :show]

    def index
        @fabricantes = Manufacturer.all
    end

    def show
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
    end

    def update
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

    def set_manufacturer
        @manufacturer = Manufacturer.find(params[:id]) 
    end

    def authorize_admin
        redirect_to root_path unless current_user.admin?
    end
end
