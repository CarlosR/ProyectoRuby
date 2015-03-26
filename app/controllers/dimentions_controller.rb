class DimentionsController < ApplicationController
	def index
  		@dimentions = Dimention.includes(:priority)
  		
  		if params[:keyword].present?
    		q = params[:keyword]
      		@dimentions = @dimentions.joins(:priority).where("dimentions.title LIKE '%#{q}%' OR priorities.title LIKE '%#{q}%'")
    	end

	    if request.xhr?
	      	render partial: "table", locals: {dimentions: @dimentions}, status: 200
	    end
  	end

	def new
		@dimention = Dimention.new
	end

  	def create
  		#@priority = Priority.find(params[:priority_id])

  		@dimention = Dimention.new(dimention_params)

    	if @dimention.save
      		redirect_to dimentions_path
    	else
      		render :new
    	end 
  	end

	def show
		@priority = Priority.find(params[:id])
  	end

  	private

  	def dimention_params
      	params.require(:dimention).permit!
    end
end
