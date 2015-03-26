class PrioritiesController < ApplicationController

	def index
		@priorities = Priority.all
	end

	def show
		@priority = Priority.find(params[:id])
	end

	def new
		@priority = Priority.new
	end

	def create
		@priority = Priority.new(priority_params)

    	if @priority.save
      		redirect_to priorities_path
    	else
      		render :new
    	end

	end

	def edit
	end

	private

	def priority_params
    	params.require(:priority).permit!
    end
end
