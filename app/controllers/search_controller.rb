class SearchController < ApplicationController
  def index
    @word = params[:keyword]
    @users = User.where('account_id LIKE(?)', "%#{params[:keyword]}%")
    @nil = "見つかりませんでした" if @users.empty?
  end
end
