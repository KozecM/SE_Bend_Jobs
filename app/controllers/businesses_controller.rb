class BusinessesController < ApplicationController
    def new
        @business = Business.new
    end 

    def index 
        @businesses = Business.all
    end

    def create
        @workflow = CreatesBusiness.new(name: params[:business][:name],
        job_string: params[:business][:jobs])
        @workflow.create
        redirect_to businesses_path
    end
end
