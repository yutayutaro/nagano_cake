class Public::CustomersController < ApplicationController
before_action :authenticate_customer!, except: [:show,:edit,:update,:confirmation,:withdraw]
    def show
    end
    def update
    
    end
    def confirmation
    end
    def withdraw
    
    end
    def edit
    end    
end
