class Admin::DashboardController < ApplicationController
  def show
    @product_qty = Product.count
    @category_qty = Category.count
  end
end
