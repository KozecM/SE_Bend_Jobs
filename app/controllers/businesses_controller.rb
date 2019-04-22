class BusinessesController < ApplicationController
    def new
        @business = Business.new
    end 

    # def index 
    #     @businesses = Business.all
    # end

    def create
        @workflow = CreatesBusiness.new(name: params[:business][:name])
        workflow.create
        redirect_to business_path
    end
end
