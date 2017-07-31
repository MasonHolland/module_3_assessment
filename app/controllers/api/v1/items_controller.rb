class Api::V1::ItemsController < ApplicationController
  protect_from_forgery with: :null_session
  def show
    @item = Item.find(params["id"])
    render json: @item
  end

  def index
    @items = Item.all
    render json: @items
  end

  def destroy
    @item = Item.find(params["id"])
    render json: { success: "Item successfully deleted", status: 204 }, status: 204
    @item.delete
  end

  def create
    @item = Item.create!(item_params)
    @item.save
    render json: @item, status: 201
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end
end
