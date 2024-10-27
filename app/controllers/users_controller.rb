class UsersController < ApplicationController


    def dashboard
    
    end


    def index
        @sho = User.all
        @gro = Product.new
    end

    def new
        @grow = User.new
    end

    def show
        @explain = User.find(params[:id])
    end

    def edit
        @detect = User.find(params[:id])
    end

    def create
        @photosynthesis = User.new(user_params)
        if @photosynthesis.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    def update
        @run =  User.find(params[:id])
        if @run.update(user_params)
            redirect_to @run
        else
            render 'edit'
        end
    end

        def destroy
            @aloo = User.find(params[:id])
            @aloo.destroy
            redirect_to users_path
        end

        def user_params
            params.require(:user).permit(:name, :email, :phno)
        end
            
end
