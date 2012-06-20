require 'spec_helper'

describe CheckoutController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'place_order'" do
    it "returns http success" do
      get 'place_order'
      response.should be_success
    end
  end

  describe "GET 'thank_you'" do
    it "returns http success" do
      get 'thank_you'
      response.should be_success
    end
  end

end
