# == Schema Information
#
# Table name: books
#
#  id          :integer(4)      not null, primary key
#  title       :string(32)      not null
#  price       :float
#  subject_id  :integer(4)
#  description :text
#  created_at  :datetime
#

class Book < ActiveRecord::Base
    attr_accessible :title, :description, :price, :authors, :subject_id
    has_many :cart_items
    has_many :carts, :through => :cart_items
    belongs_to :subject
    validates_presence_of :title
    validates_numericality_of :price, :message=>"Error Message"
end
