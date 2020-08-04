class ItemsController < ApplicationController
before_action :move_to_index, only: :new


  def index
    
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
private

def item_params
  params.require(:item).permit(:name, :info, :category_id, :item_status_id, :delivery_fee_id, :region_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
end

  def move_to_index
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
end
