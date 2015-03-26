class DimentionsController < ApplicationController
	def index
		@dimentions = Dimention.includes(:priority).order(priority_id: :asc, weight: :desc)
		
		if params[:keyword].present?
  		q = params[:keyword]
    	@dimentions = @dimentions.joins(:priority).where("dimentions.title LIKE '%#{q}%'")
  	end

    if request.xhr?
      render partial: "table", locals: {dimentions: @dimentions}, status: 200
    end
  end

	def new
		@dimention = Dimention.new
	end

	def create
		@dimention = Dimention.new(dimention_params)

  	if @dimention.save
    		redirect_to dimentions_path
  	else
    		render :new
  	end 
  end



	def show
		@dimention = Dimention.find(params[:id])
  end

  def edit
    @dimention = Dimention.find(params[:id])
  end

  def update
    @dimention = Dimention.new(dimention_params)

      if @dimention.save
          redirect_to dimentions_path
      else
          render :edit
      end

  end

  def destroy
    @dimention = Dimention.find(params[:id])
    @factor = Factor.where(dimention_id: params[:id])
    if @factor.present?
      render :edit
      else 
        @dimention.destroy
        redirect_to dimentions_path
      end

  end

  

	private

	def dimention_params
    	params.require(:dimention).permit!
  end
end
