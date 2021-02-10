class Admin::DashboardController < ApplicationController

  include HttpAuthConcern
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD'] 

  def show
    @product_qty = Product.count
    @category_qty = Category.count
  end
end
