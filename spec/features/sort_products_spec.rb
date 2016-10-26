require 'rails_helper'

RSpec.feature "SortProducts", type: :feature do
  def hat_link
    page.all(:css, "h4.product-name a").map(&:text)
  end

  scenario "visit click on Sort by Alphabetical" do
    @productC = Product.new(name:"c", description:"product c", price_vnd:10000, weight:90);
    @productC.save
    @productB = Product.new(name:"b", description:"product b", price_vnd:10000, weight:90);
    @productB.save

    visit root_path
    expect(hat_link).to eq ["c", "b"]

    click_link "Sort by Alphabetical"

    expect(current_url).to eq root_url(sort: "alphabetical")
    expect(hat_link).to eq ["b", "c"]
  end
end
