class SubsidiariesController < ApplicationController
    def index
        @filiais = Subsidiary.all
    end
    def show
        @filial = Subsidiary.find(params[:id])
    end
end
