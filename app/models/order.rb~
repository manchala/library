class Order < ActiveRecord::Base
  attr_accessible :customer_ip, :email, :error_message, :phone_number, :ship_to_address, :ship_to_city, :ship_to_country, :ship_to_first_name, :ship_to_last_name, :ship_to_postal_code, :status
  attr_accessor :card_type, :card_number, :card_expiration_month, :card_expiration_year, :card_verification_value
  has_many :order_items
  has_many :books, :through => :order_items
  
  validates_size_of :order_items, :minimum =>1
  validates_length_of :ship_to_first_name, :in => 2..255
  validates_length_of :ship_to_last_name, :in => 2..255
  validates_length_of :ship_to_address, :in => 2..255
  validates_length_of :ship_to_city, :in => 2..255
  validates_length_of :ship_to_postal_code, :in => 2..255
  validates_length_of :ship_to_country, :in => 2..255
  
  def process
    result = true
    self.status = 'processed'
    save!
    result
  end
end
