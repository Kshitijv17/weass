class OrdersController < ApplicationController
 
  def index
    @orders = Order.all
  end

  def show
    # @order= Order.find_by(params[:user_id])
    # @order= Order.find(params[:id])
   
    # @order = Order.all.includes(:product)
      @user=User.find(params[:id])

      # @order=Order.find_by(user_id: @user.id)
     @product=Product.where('user_id=?',@user.id)
  end

    
    # def new
    #     @user=Product.find(params[:id])
    #     @orders=@user.order.new
    # end

    #       @products = Product.all.includes(:user)
      
    #         @product = Product.find(params[:order_product_id])
    #         @order = Order.new(user: current_user, product: @product) # Assuming you have a current_user method
      

    # before_action :set_product

    def create
      @order = Order.new(user: current_user, product: @product)
  
      if @order.save
        redirect_to dashboard_path, notice: 'Order was successfully created.'
      else
        redirect_to dashboard_path, alert: 'Failed to create order.'
      end
    end
  
    private
  
    def show_ord
      params.require(:order).permit(:user_id, product_id)
    end


    def set_product
      @product = Product.find(params[:product_id])
    end
  

end
