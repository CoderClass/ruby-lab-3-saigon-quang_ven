require 'rails_helper'

RSpec.describe Product, type: :model do
  describe ".alphabetical" do
    it "Return [] when there are no Product" do
      expect(Product.alphabetical()).to eq([])
    end

    it "Return [a] when there is only one product" do
      @product = Product.new(name:"a", description:"product a", price_vnd:10000, weight:90);
      @product.save
      expect(Product.alphabetical).to eq([@product])
    end

    it "return [a,b,c] after creating 3 products c,b,a" do
      @productC = Product.new(name:"c", description:"product c", price_vnd:10000, weight:90);
      @productC.save
      @productB = Product.new(name:"b", description:"product b", price_vnd:10000, weight:90);
      @productB.save
      @productA = Product.new(name:"a", description:"product a", price_vnd:10000, weight:90);
      @productA.save
      expect(Product.alphabetical).to eq([@productA,@productB,@productC])
    end
  end
end
