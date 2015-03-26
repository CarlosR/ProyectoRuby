class PrioritiesController < ApplicationController

	def index
		@priorities = Priority.all
	end

	def show
		@priority = Priority.find(params[:id])
		#@dimentions = Dimentions.where(priority_id: params[:id] )
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
		@priority = Priority.find(params[:id])

	end

	def update
		@priority = Priority.find(params[:id])
    	if @priority.update(priority_params)
      		redirect_to priority_path        
    	else
      		render :edit
    	end
	end

	def destroy
		@priority = Priority.find(params[:id])
		@dimention = Dimention.where(priority_id: params[:id])
		if @dimention.present?
			render :edit
    	else 
    		@priority.destroy
    		redirect_to priorities_path
    	end
	end

	

	private

	def priority_params
    	params.require(:priority).permit!
    end
end
