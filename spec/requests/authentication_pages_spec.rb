require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h1',    text: 'Sign in') }
    it { should have_selector('title', text: 'Alpha Cypress Computing Bookstore App') }
    it { should have_selector('title', text: 'Sign in') }
  end

  
  
  describe "signin" do
    before { visit signin_path }
    
    describe "with invalid information" do
      before { click_button "Sign in" }
     
      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end # for invalid information
    
    
    describe "with valid information" do
      let(:user) { User.find(12) }
      before do
        fill_in "Email",    with: user.email #"jaustin@yahoo.com"
        fill_in "Password", with: "jane123" #user.password does not work as it is hashed
        click_button "Sign in" 
      end

      it { should have_selector('title', text: 'Alpha Cypress Computing Bookstore App') }
      it { should have_selector('title', text: 'Signed up') }

      it { should have_selector('h1', text: user.name) }

      it { should have_link('Users',    href: users_path) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Settings', href: edit_user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end # for valid information

  end # signin page
  
  describe "authorization" do
    
    describe "for non-signed-in users" do
      
      #let(:user) {FactoryGirl.create(:user)}
      let(:user) { User.find(12) }
       
      describe "in the Users controller" do
	
	describe "visiting the edit page" do
	  before { visit edit_user_path(user) }
	  it { should have_selector('title', text: 'Sign in')}
	end
	
	describe "submitting to the update action" do
	  before { put user_path(user) }
	  specify { response.should redirect_to(signin_path) }
	end
      end
    end # for non-signed-in users
  
  end #authorization
end #Authentication



   