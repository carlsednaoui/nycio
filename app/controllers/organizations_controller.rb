class OrganizationsController < ApplicationController
  def index
  end

  def show
  	@organization = Organization.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
