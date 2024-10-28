class ProductsController < ApplicationController


    
    def index
        @sho = Product.all
        @order = Order.new
    end

    def new
        @explain = User.find(params[:user_id])
        @gro = Product.new
    end

    def show
        @explain = Product.find(params[:id])
    end

    def edit
        @detec = Product.find(params[:id])
    end

    def create
        @explain = User.find(params[:user_id])
        @photosynthesis =  @explain.product.new(product_params)
        if @photosynthesis.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    def update
        @run =  Product.find(params[:id])
        if @run.update(product_params)
            redirect_to @run
        else
            render 'edit'
        end
    end

        def destroy
            @aloo = Product.find(params[:id])
            @aloo.destroy
            redirect_to user_path
        end

        def product_params
            params.require(:product).permit(:product_name, :user_id)
        end
           

end
