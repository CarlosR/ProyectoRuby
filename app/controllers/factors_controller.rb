class FactorsController < ApplicationController
  def index
  	@factors = Factor.includes(:dimention)
		
		if params[:keyword].present?
  		q = params[:keyword]
    	@factors = @factors.joins(:dimention).where("dimentions.title LIKE '%#{q}%' OR factors.title LIKE '%#{q}%'")
  	end

    if request.xhr?
      render partial: "table", locals: {factors: @factors}, status: 200
    end
  end

  def new
  	@factor = Factor.new
  end

  def show
  	@factor = Factor.find(params[:id])

  end

  def edit
  	@factor = Factor.find(params[:id])
  end

  def create
  	@factor = Factor.new(factor_params)

  	if @factor.save
    	redirect_to factors_path
  	else
    	render :new
  	end 
  end

  def edit
  end

  def update
  end

  private

  def factor_params
    	params.require(:factor).permit!
  end
end
