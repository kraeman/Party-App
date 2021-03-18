class PartiesController < ApplicationController
    
    def index
        @parties = Party.order
        render :index, layout: false
    end

    def show
        @party = Party.find(params[:id])
    end

    def new
        @party = Party.new
        @party.build_category
        @categories = Category.all
    end

    def create
        @party = Party.create(party_params(:name, :date, :budget, :category_id, :private, category_attributes: [:name], supplies_attributes: [:name]))
        if @party.valid?
            redirect_to party_path(@party)
        else
            render :new
        end
    end

    def edit
        @party = Party.find(params[:id])
    end

    def update
        party = Party.find(params[:id])
        if party.update(party_params(:name, :date, :budget, :private))
            redirect_to party_path(party)
        else
            render :new
        end
    end

    private

    def party_params(*args)
        params.require(:party).permit(*args)
    end
end
