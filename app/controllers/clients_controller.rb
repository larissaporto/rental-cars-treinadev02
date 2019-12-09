class ClientsController < ApplicationController
    before_action :authenticate_user!
    def index
        @clients = Client.all
    end
    def new
        @client = Client.new
    end
    def show
        @client = Client.find(params[:id])
    end
    def create
        @client = Client.create(client_params)
        if @client.persisted?
            flash[:notice] = 'Cliente criado com sucesso'
            redirect_to client_path(@client.id)
        else
            flash.now[:alert] = 'Você deve preencher todos os campos'
            render :new
        end
    end

    private
    def client_params
        params.require(:client).permit(:name, :document, :email)    
    end
end