class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!, except: [:new,:confirmation,:completion,:create,:index,:show]
 
    def new
        
    end
    def confirmation
    
    end
    def completion
        
    end
    def create
        
    end
    def index
    
    end
    def show
        
    end
end
