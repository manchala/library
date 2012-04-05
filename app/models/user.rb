# == Schema Information
#
# Table name: users
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  before_save :create_remember_token
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, :presence => true, :length => { :minimum => 6, :maximum => 50}
  
  validates :email, :presence =>true, 
		    :uniqueness => { :case_sensitive => false}, 
		    :format => { :with => email_regex }
  validates :password, :presence => true, :length => { :minimum => 6}
  
  private
  
  
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end  
end
