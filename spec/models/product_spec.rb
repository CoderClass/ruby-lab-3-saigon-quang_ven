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

  describe "discount amout" do
    it "Sale off 21% when price > 100,000 VND" do
      @product = Product.new(name:"c", description:"product c", price_vnd:101000, weight:90);
      @product.save
      expect(@product.discount_amount()).to eq(0.21)
    end

    it "Sale off 31% when price > 200,000 VND" do
      @product = Product.new(name:"c", description:"product c", price_vnd:201000, weight:90);
      @product.save
      expect(@product.discount_amount()).to eq(0.31)
    end

    it "Sale off 41% when price > 800,000 VND" do
      @product = Product.new(name:"c", description:"product c", price_vnd:801000, weight:90);
      @product.save
      expect(@product.discount_amount()).to eq(0.41)
    end

  end

  describe "Rounding final price" do
    it "Round up" do
      @product = Product.new(name:"c", description:"product c", price_vnd:146000, weight:90);
      @product.save
      expect(@product.final_price()).to eq(120000)
    end
    it "Round down" do
      @product = Product.new(name:"c", description:"product c", price_vnd:140000, weight:90);
      @product.save
      expect(@product.final_price()).to eq(110000)
    end
  end
end
