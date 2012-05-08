require 'spec_helper'

describe User do

  before do 
     @user = User.new(name: "Steven Bhadran", email: "sbhadran@yahoo.com", 
                      password: "steven123", password_confirmation: "steven123")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  
  it {should be_valid}
end