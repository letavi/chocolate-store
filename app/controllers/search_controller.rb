class SearchController < ApplicationController

  def search
    @search_products = params[:q].nil? ? [] : Product.search(params[:q])
  end

end
