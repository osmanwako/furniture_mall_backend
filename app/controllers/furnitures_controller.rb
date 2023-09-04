class FurnituresController < ApplicationController
  before_action :authenticate_user!

  def index
    @furnitures = Furniture.all
    render json: @furnitures
  end

  def update
    @furniture = Furniture.find(params[:id])
    if @furniture.update(furniture_params)
      render json: { furnitures: @furniture, status: :ok, message: "Furniture Successfully updated" }
    else
      render json: { furniture: nil, status: :error, message: "Unable to update furniture." }
    end
  end

  def show
    @furniture = Furniture.find_by(id: params[:id])
    render json: @furniture
  end

  def create
    @furniture = Furniture.new(furniture_params)
    if @furniture.save
      render json: { furniture: @furniture, status: :ok, message: "Furniture Successfully created" }
    else
      render json: { furniture: nil, status: :error, message: @furniture.errors.full_messages }
    end
  end

  def destroy
    @furniture = Furniture.find(params[:id])
    if @furniture.destroy
      render json: { furniture: @furniture, status: :ok, message: "Furniture Successfully deleted" }
    else
      render json: { furniture: nil, status: :error, message: "Error" }
    end
  end

  private

  def furniture_params
    params.require(:furniture).permit(:name, :serial_number, :image, :description, :upfront_price, :total_price, :warranty_year).merge(user: current_user)
  end
end
