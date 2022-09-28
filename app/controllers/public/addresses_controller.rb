class Public::AddressesController < ApplicationController
    before_action :authenticate_customer!, except: [:index,:edit,:create,:update,:destroy]
    def index
        @address_new = Address.new
        @address = Address.all
    end
    def edit
    @address = Address.find(params[:id])
    end
    def create
        address = Address.new(address_params)
        address.customer_id = current_customer.id
        address.save
        redirect_to addresses_path
    
    end
    def update
        address = Address.find(params[:id])
        address.update(address_params)
        redirect_to addresses_path
    
    end
    def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
    end
    def address_params
        params.require(:address).permit(:name,:postal_code,:address)
    end    
end
