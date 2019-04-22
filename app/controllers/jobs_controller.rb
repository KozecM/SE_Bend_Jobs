class JobsController < ApplicationController
    def new
        @job = Job.new
    end

    def index
        @jobs = Job.all
    end

    def create
        @workflow = CreatesJob.new( title: params[:job][:title],
            description_string: params[:job][:description])
        @workflow.create
        redirect_to jobs_path
    end
end
