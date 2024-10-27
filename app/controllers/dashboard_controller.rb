class DashboardController < ApplicationController

    def index
        @sho = User.all
    end

    def show
        # @explain = User.find(params[:id])
        # @orders = @explain.order.includes(:product) 


        @user=User.find(params[:id])
        @orders=@user.order

        # @orders=Order.find(params[:id])
        # user = @orders.user
        # user_id= user.id
    end
    

end
