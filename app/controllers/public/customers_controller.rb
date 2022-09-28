class Public::CustomersController < ApplicationController
before_action :authenticate_customer!, except: [:show,:edit,:update,:confirmation,:withdraw]
    def show
    end
    def update
    customer = current_customer
    customer.update(customer_params)
     redirect_to customers_mypage_path
    end
    def confirmation
    end
    def withdraw
         customer = current_customer
    customer.update(is_active: false)
    reset_session
     redirect_to root_path
    end
    def edit
        @customer = current_customer
    end    
    private
    def customer_params
        params.require(:customer).permit(:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:is_active)
    end
    end
