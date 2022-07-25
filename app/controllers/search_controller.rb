class SearchController < ApplicationController
    def create
        key = "%#{params[:keyword]}%";

        @users = User.where("name LIKE ? OR address LIKE ?",key,key);

        respond_to do |format|
            format.html { redirect_to users_url }
            format.json { render json: @users}
            format.js
        end
    end
end