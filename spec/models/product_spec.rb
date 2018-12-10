require 'rails_helper'

RSpec.describe Product, type: :model do
  before :each do
    @category = Category.create name:'Test Category'
    @product = Product.new(
      name: "test",
      price_cents: 1,
      quantity: 1,
      category: @category
    )
  end

  describe 'Validations' do
    it 'new product returns true with all validations' do
      expect(@product).to be_valid
      puts @product.errors.full_messages
    end

    it 'return false if name is nil' do
      @product.name = nil
      expect(@product).not_to be_valid
      puts @product.errors.full_messages
    end

    it 'return false if price is nil' do
      @product.price_cents = nil
      expect(@product).not_to be_valid
      puts @product.errors.full_messages
    end

    it 'return false if quantity is nil' do
      @product.quantity = nil
      expect(@product).not_to be_valid
      puts @product.errors.full_messages
    end

    it 'return false if category is nil' do
      @product.category = nil
      expect(@product).not_to be_valid
      puts @product.errors.full_messages
    end

  end
end
