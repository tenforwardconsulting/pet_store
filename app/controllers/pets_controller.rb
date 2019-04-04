class PetsController < ApplicationController

  def index
    @pets = Pet.all
    if params[:species].present?
      @pets = @pets.where(species: params[:species])
    end
  end

  def show
    @pet = Pet.find params[:id]
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new pet_params
    if @pet.save
      redirect_to @pet, notice: 'Pet was successfully created.'
    else
      render :new
    end
  end

  def edit
    @pet = Pet.find params[:id]
  end

  def update
    @pet = Pet.find params[:id]
    if @pet.update pet_params
      redirect_to @pet, notice: 'Pet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pet = Pet.find params[:id]
    @pet.destroy!
    redirect_to pets_path, notice: 'Pet was successfully deleted.'
  end

  private

  def pet_params
    params.require(:pet).permit :name, :species, :breed, :store_id
  end
end
