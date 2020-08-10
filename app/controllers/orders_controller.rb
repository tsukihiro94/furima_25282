class OrdersController < ApplicationController
    before_action :set_item, only: [:index, :create, :pay_item]
    before_action :go_to_index, only: :index
  
    def index
      
     if current_user.id == @item.user_id 
       redirect_to items_path
     end

      @order = OrderAddress.new
    end
    
  
    def create
      @order = OrderAddress.new(order_params)
      # binding.pry
      if @order.valid?
        pay_item
        @order.save
        return redirect_to root_path
      else
        render :index
      end
    end
    
  
  private  
      def set_item
        @item = Item.find(params[:item_id])
      end
  
    def order_params
       params.require(:order_address).permit(:price,:postal_code, :region_id, :city, :street_number, :building_name, :phone).merge(item_id: @item.id,user_id: current_user.id)
    end
  
    def pay_item
      @item = Item.find(params[:item_id])
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: params[:token],
        currency:'jpy'
      )
    end

    def go_to_index
      if @item.order != nil 
        redirect_to items_path
      end
    end

end
