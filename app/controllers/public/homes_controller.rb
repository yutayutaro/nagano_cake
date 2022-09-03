class Public::HomesController < ApplicationController
    def top
        @new_items = Item.all.order(id: "DESC")
        @new_items.limit(4)
    end    
    def about
    end    
    def index

end
end
