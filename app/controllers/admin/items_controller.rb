class Admin::ItemsController < ApplicationController
    before_action :authenticate_admin!
def new
    @item = Item.new
    @genres = Genre.all
end
def create
    item = Item.new(item_params)
    item.save
    redirect_to '/admin/items'
end
def index
    @items = Item.page(params[:page]).per(10)
end
def show
    @item = Item.find(params[:id])
end
def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
end
      private
  def item_params
    params.require(:item).permit(:genre_id, :name, :image,:introductiion,:is_active,:price)  
  end
end
