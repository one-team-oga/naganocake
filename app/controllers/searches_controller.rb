class SearchesController < ApplicationController
    def search
        if params[:name].present?
            @items = Item.where('name LIKE ?', "%#{params[:name]}%")
        else
            @items = Item.none
        end
    end
end
