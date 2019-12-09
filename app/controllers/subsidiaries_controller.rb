class SubsidiariesController < ApplicationController
    before_action :authenticate_user! #,only: [:show, :edit ....] for some actions
    before_action :authorize_admin

    def index
        @subsidiaries = Subsidiary.all
    end
    def show
        @subsidiary = Subsidiary.find(params[:id])
    end
    def new
        @subsidiary = Subsidiary.new
    end
    def create
        @subsidiary = Subsidiary.create(subsidiary_params)
        redirect_to @subsidiary
    end
    def edit
        @subsidiary = Subsidiary.find(params[:id])
    end
    def update
        @subsidiary = Subsidiary.find(params[:id])
        if @subsidiary.update(subsidiary_params)
            flash[:notice] = 'Filial atualizada com sucesso'
            redirect_to @subsidiary
        else
            render :edit
        end
    end
    def destroy
        @subsidiary = Subsidiary.find(params[:id])
        @subsidiary.destroy
        flash[:alert] = 'Filial apagada'

        redirect_to subsidiaries_path
    end
    
    private
    def subsidiary_params
        params.require(:subsidiary).permit(:name, :cnpj, :address)
    end
    def authorize_admin
        redirect_to root_path unless current_user.admin?
    end
end
