class OrganizationsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @organizations = Organization.where(approved: true)
  end

  def show
    @organization = Organization.find(params[:id])
    @events = @organization.events.with_future_occurrences
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        UserOrganization.create(user: current_user, organization: @organization, manager: true)
        format.html { redirect_to root_path, notice: 'New Organization proposed' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @organization = Organization.find(params[:id])
    authorize! :manage, @organization
  end

  def update
    @organization = Organization.find(params[:id])
    authorize! :manage, @organization

    respond_to do |format|
      if @organization.update_attributes(organization_params)
        format.html { redirect_to @organization, notice: 'Organization Updated' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Removed Organization' }
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :description, :twitter_url, :facebook_url, :contact_name, :contact_phone, :contact_email, :website, :image_url)
  end
end
