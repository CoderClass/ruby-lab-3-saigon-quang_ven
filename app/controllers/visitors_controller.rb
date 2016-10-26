class VisitorsController < ApplicationController
  def index
    if params[:sort]
      @products = Product.alphabetical
    else
      @products = Product.all
    end
  end
end
