class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
    end

    def new
    end

    def create
    end

    def show
        @user = User.where(id: current_user).find(params[:id])
    end

    def edit
    end

    def update
    end

    def destroy
    end
end
