class SuppliesController < ApplicationController

  def index
    @supplies = Supply.all
  end

  def show
    @supply = Supply.find params[:id]
    @supplies = Supply.all
  end

  def new
    @supply = Supply.new
  end

  def create
    @supply = Supply.new supply_params
    if @supply.save
      puts "*" * 80
      puts "GOT HERE"
      puts "*" * 80
      redirect_to supplies_path, notice: 'Supply item was successfully created.'
    else
      render :new
      puts @supply.errors.full_messages
    end
  end

  def edit
    @supply = Supply.find params[:id]
  end

  def update
    @supply = Supply.find params[:id]
    if @supply.update supply_params
      redirect_to supplies_path, notice: 'Supply item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @supply = Supply.find params[:id]
    @supply.destroy!
    redirect_to supplies_path, notice: 'Supply item was successfully deleted.'
  end

  private

  def supply_params
    params.require(:supply).permit :name, :brand, :quantity, :store_id
  end
end
