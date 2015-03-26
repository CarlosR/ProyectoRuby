class CompanysController < ApplicationController

  def index
    @companys = Company.all
    
  end

  def new
  end

  
end