class SellingsController < ApplicationController
    before_action :authenticate_user!
    def index
        @items = Item.all
        @count = 0
        @current_items = []
        for item in @items
            if item.user == current_user
                @count +=1
            end
        end
    end

    def home
        @items = Item.all
        @count = 0
        @users_items = []
        @active_user_items = []
        @active_user_items_count = 0
        for item in @items
            if item.user == current_user
                @count +=1
                @users_items << item
                if item.active == true
                    @active_user_items << item
                    @active_user_items_count += 1
                end
            end
        end
    end
    def sold
        items = Item.all
        @items = []
        for item in items
            if item.user == current_user
                if item.active == false
                    @items << item
                end
            end
        end
    end
end
