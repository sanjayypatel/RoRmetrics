class RegisteredApplicationsController < ApplicationController

  def index
    @registered_applications = current_user.registered_applications
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @grouped_events = @registered_application.events.group_by(&:name)
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @user = current_user
    @registered_application = @user.registered_applications.build(registered_application_params)
    if @registered_application.save
      flash[:notice] = "Application successfully registered."
      redirect_to @registered_application
    else
      flash[:error] = "There was an error registering application. Please try again."
      render :new
    end
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.update_attributes(registered_application_params)
      flash[:notice] = "Application successfully updated."
      redirect_to @registered_application
    else
      flash[:error] = "There was an error updating application. Please try again."
      render :edit
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
      flash[:notice] = "Application successfully removed."
      redirect_to registered_applications_path
    else
      flash[:error] = "There was an error removing application. Please try again."
      render :edit
    end
  end

  private

  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end

end
