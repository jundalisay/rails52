class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy, :upvote, :downvote, :cancel_account]

    def index
        @users = User.all
    end
  
  
    def show
        respond_to do |format|
          format.html { render :show }
          format.json { render :show, status: :created, location: @user }
        end      
    end
      
  
    private
  
      def set_user
        @user = User.find(params[:id])
      end
  

      def user_params
        params.require(:user).permit(
          :password,
          :email,
          :name,
          :kind,
          :gender, 
          :points, 
          :photo
        )
      end
  end