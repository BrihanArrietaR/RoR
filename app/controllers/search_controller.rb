class SearchController < ApplicationController
    def results
        @users = User.searching(params[:data]);
    end
end