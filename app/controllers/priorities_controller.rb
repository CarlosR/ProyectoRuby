class PrioritiesController < ApplicationController

	def index
		@priorities = Priority.all
	end

	def new
		@priority = Priority.new
	end

	def create

	end

	def edit
	end
end
