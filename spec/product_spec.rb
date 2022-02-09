require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'saves the product if the product is properly created with all valid values' do
      @category = Category.create(name:"Sport Clothes")
      product = Product.new(name: "Football boot", price: 24.90, quantity: 40, category_id: @category.id)
      expect(product).to (be_valid)
    end

    it 'doesnt save if product doesnt have a proper name' do
      @category = Category.create(name: "Heavy Tools")
      name = Product.new(name: nil, price: 8.90, quantity: 90, category_id: @category.id)
      expect(name).to_not (be_valid)
    end

    it 'doesnt save if product doesnt have a proper price' do
      @category = Category.create(name: "Makeup")
      price = Product.new(name: "Lipstick", price: nil, quantity: 100, category_id: @category.id)
      expect(price).to_not (be_valid)
    end

    it 'doesnt save if product doesnt have a proper quantity' do
      @category = Category.create(name: "Sport Clothes")
      quantity = Product.new(name: "Football kit", price: 89.90, quantity: nil, category_id: @category.id)
      expect(quantity).to_not (be_valid)
    end

    it 'doesnt save if product doesnt have a proper category ID' do
      @category = Category.create(name: "Heavy Tools")
      category_id = Product.new(name: "Drill", price: 49.90, quantity: 50, category_id: nil)
      expect(category_id).to_not (be_valid)
    end

  end
  
end