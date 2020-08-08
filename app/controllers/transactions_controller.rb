class TransactionsController < ApplicationController
  before_action :set_item, only: :index


  def index
    if current_user.id == @item.user_id 
      redirect_to items_path
    end
  end


private  
    def set_item
      @item = Item.find(params[:item_id])
    end

end
