class DogRegistrationsController < ApplicationController

  def index
    #needs activerecord query here to list all
    @dog_registrations = DogRegistration.all
  end

  def new
    @registration = DogRegistration.new
  end

  def create
    @registration = DogRegistration.new(dog_registration_params)
    if @registration.save
      redirect_to root_path, notice: "Dog Registration Created"
    else
      redirect_to root_path, notice: "Error: Registration Not Saved"
    end
  end

  private
  def dog_registration_params
    params.require(:dog_registration).permit(:first_name, :last_name, :email, :dog_name)
  end
end
