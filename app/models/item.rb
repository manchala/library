class Item < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  belongs_to :cart
  belongs_to :book
end
