require 'rails_helper'
require 'spec_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it 'name, price, quantity and category should exist for each record' do
      @category = Category.new(:name => 'New Category')
      @category.save

      @product = Product.new(:name => 'Product 1', :price => 100, :quantity => 2, :category_id => @category.id)

      expect(@product).to be_valid
    end

    it 'name should exist for each record' do
      @category = Category.new(:name => 'New Category')
      @category.save

      @product = Product.new(:name => nil, :price => 100, :quantity => 2, :category_id => @category.id)

      expect(@product).to_not be_valid
    end

    it 'price should exist for each record' do
      @category = Category.new(:name => 'New Category')
      @category.save

      @product = Product.new(:name => 'Product 1', :price => nil, :quantity => 2, :category_id => @category.id)

      expect(@product).to_not be_valid
    end

    it 'quantity should exist for each record' do
      @category = Category.new(:name => 'New Category')
      @category.save

      @product = Product.new(:name => 'Product 1', :price => 100, :quantity => nil, :category_id => @category.id)

      expect(@product).to_not be_valid
    end

    it 'category should exist for each record' do
      @category = Category.new(:name => 'New Category')
      @category.save

      @product = Product.new(:name => 'Product 1', :price => 100, :quantity => 2, :category_id => nil)

      expect(@product).to_not be_valid
    end

  end

end