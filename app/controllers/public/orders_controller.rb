class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!, except: [:new,:confirmation,:completion,:create,:index,:show]
 
    def new
        if current_customer.cart_items.blank?
            redirect_to root_path
        end
        @order = Order.new
    end
    def confirmation
         @cart_items = current_customer.cart_items
    @total = 0
    @order = Order.new(order_params)
    if params[:order][:address_select] == "1"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_select] == "2"
            @address = Address.find(params[:order][:address_select])
            @order.postal_code = @address.postal_code
            @order.address = @address.address
            @order.name = @address.name
    elsif params[:order][:address_select] == "3"
            @order.postal_code = params[:order][:postal_code]
            @order.address = params[:order][:address]
            @order.name = params[:order][:name]
    end
    
    end
   
    def completion
        
    end
    def create
        # binding.irb
        order = Order.new(order_params)
        order.save
        
        # binding.irb
        current_customer.cart_items.each do |cart_item|
            order_product = OrderProduct.new
            order_product.order_id = order.id
            order_product.item_id = cart_item.item_id
            order_product.amount = cart_item.amount
            order_product.price = cart_item.item.price * cart_item.amount
            order_product.save
        end
            current_customer.cart_items.destroy_all
        
        redirect_to  orders_completion_path
        
    end
    def index
        @orders = current_customer.orders
        
    end
    def show
        @order = Order.find(params[:id])
    end
    
    private 
    def order_params
        params.require(:order).permit(:customer_id, :postage, :payment_amount, :payment_method,:postal_code,:address,:name)
    end
end
