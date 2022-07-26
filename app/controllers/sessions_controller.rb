class SessionsController < ApplicationController
    def create
        @user = User.find_by(name: session_params[:name])
      
        if @user && @user.authenticate(session_params[:password])
          login!
          render json: {
            logged_in: true,
            user: @user
          }
        else
          render json: { 
            status: 401,
            errors: ['No se ingresó el usuario']
          }
        end
    end
    def is_logged_in?
        if logged_in? && current_user
          render json: {
            logged_in: true,
            user: current_user
          }
        else
          render json: {
            logged_in: false,
            message: 'no hay usuario'
          }
        end
    end
    def destroy
          logout!
          render json: {
            status: 200,
            logged_out: true
          }
    end
    private
    def session_params
          params.require(:user).permit(:name, :password)
    end

    def search
        @user = User.find(user_params[:name])
    end