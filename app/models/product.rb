class Product < ActiveRecord::Base
  before_save :set_default_image_path
  validates :name, presence: true

  def self.alphabetical
    order("name ASC")
  end

  def discount_amount
    if price_vnd > 800000
      return 0.41
    elsif price_vnd > 200000
      return 0.31
    elsif price_vnd > 100000
      return 0.21
    end
  end

  def final_price
    return (price_vnd - (price_vnd * discount_amount())).round(-4)
  end

  private

  def set_default_image_path
    self.image_path ||= "http://lorempixel.com/200/200/fashion"
  end
end
