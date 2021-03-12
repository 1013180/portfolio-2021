class SearchesController < ApplicationController
  before_action :set_search
def set_search
  @search = Product.ransack(params[:q])
  @search_products = @search.result
end
end
