class SearchController < ApplicationController
  def index
    @users = User.where('account_id LIKE(?)', "%#{params[:keyword]}%")
  end
end
