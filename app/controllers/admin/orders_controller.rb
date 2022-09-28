class Admin::OrdersController < ApplicationController
    before_action :authenticate_admin!
    def new
        @order = current_customer
    end
    def show
 @order = Order.find(params[:id])
    end
end
