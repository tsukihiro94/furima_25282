class ItemsController < ApplicationController
  
  before_action :authenticate_user!, only: :new
  before_action :set_item, only: [:show, :edit, :update, :destroy]
    def index
      @items = Item.all
    end
  

    def new
      @item = Item.new
    end
  
    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to items_path
      else
        render :new
      end
    end

    def show
      
    end

    def edit
      
    end

    def update
      @item.update(item_params)
      if @item.save
        redirect_to action: :show
      else
        render :edit
      end
    end

    def destroy
      @item.destroy
      if @item.delete
        redirect_to action: :index
      else
        render :show
      end
    end
  private

    def item_params
      params.require(:item).permit(:name, :info, :category_id, :item_status_id, :delivery_fee_id, :region_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
    end
   
    def set_item
      @item = Item.find(params[:id])
    end
end
