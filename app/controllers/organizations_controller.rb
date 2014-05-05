class OrganizationsController < ApplicationController
  def index
  end

  def edit
  end

  def show
  	@organization = Organization.find(params[:id])
  end

  def new
  end
end
