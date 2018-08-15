class StoresController < ApplicationController

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find params[:id]
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new store_params
    if @store.save
      redirect_to @store, notice: 'Store was successfully created.'
    else
      render :new
    end
  end

  def edit
    @store = Store.find params[:id]
  end

  def update
    @store = Store.find params[:id]
    if @store.update store_params
      redirect_to @store, notice: 'Store was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @store = Store.find params[:id]
    @store.destroy!
    redirect_to stores_path, notice: 'Store was successfully deleted.'
  end

  private

  def store_params
    params.require(:store).permit :name, :description
  end
end
