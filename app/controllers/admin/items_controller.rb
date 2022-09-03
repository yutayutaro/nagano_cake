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
end
      private
  def item_params
    params.require(:item).permit(:genre_id, :name, :image,:introductiion,:is_active,:price)  
  end
end
