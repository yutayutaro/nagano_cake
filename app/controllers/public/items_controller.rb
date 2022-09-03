class Public::ItemsController < ApplicationController
           def index
           @items = Item.page(params[:page])
             end
             def top
 @new_item = Item.first(3)
 
 
  end
end
