class OrdersController < ApplicationController


    
    # def new
    #     @user=Product.find(params[:id])
    #     @orders=@user.order.new
    # end

          @products = Product.all.includes(:user)
      
            @product = Product.find(params[:order_product_id])
            @order = Order.new(user: current_user, product: @product) # Assuming you have a current_user method
      

    before_action :set_product

    def create
      @order = Order.new(user: current_user, product: @product)
  
      if @order.save
        redirect_to dashboard_path, notice: 'Order was successfully created.'
      else
        redirect_to dashboard_path, alert: 'Failed to create order.'
      end
    end
  
    private
  
    def set_product
      @product = Product.find(params[:product_id])
    end
  

end
