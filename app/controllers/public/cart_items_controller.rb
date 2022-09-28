class Public::CartItemsController < ApplicationController
    before_action :authenticate_customer!, except: [:index,:update,:destroy,:destroy_all,:create]
def index
    @cart_items = current_customer.cart_items
    @total = 0

end
def update
    
end
def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
    
end
def destroy_all
 @cart_items = current_customer.cart_items
 @cart_items.destroy_all
 redirect_to cart_items_path
end
def create
    @cart_item = CartItem.find_by(item_id:cart_item_params[:item_id] ,customer_id:current_customer.id)
    if @cart_item
    @cart_item.update(amount: cart_item_params[:amount].to_i+@cart_item.amount)
    redirect_to '/cart_items'
    else
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.save
    redirect_to '/cart_items'
    end
    

end
def update
        cart_item = CartItem.find(params[:id])
        cart_item.update(cart_item_params)
        redirect_to cart_items_path
end
     private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer, :amount,)  
  end

end
