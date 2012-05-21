require 'spec_helper'

describe "User pages" do

  subject { page }

    describe "signup" do 
       before {visit signup_path }
      
       describe "page" do
	  it { should have_selector('title',  :content => 'Sign Up') }
	  it { should have_selector('h1',     :content => 'Sign Up') }
       end
      
      let(:submit) { "Create my account" }
 
      describe "with invalid information" do
	it "should not create a user" do
	  expect { click_button submit }.not_to change(User, :count)
	end
      end

      describe "with valid information" do
	before do
	  fill_in "Name",         with: "Patricia Neiditch"
	  fill_in "Email",        with: "pneiditch@acc.com"
	  fill_in "Password",     with: "patricia123"
	  fill_in "Confirmation", with: "patricia123"
	end

	#it "should create a user" do
	 # expect { click_button submit }.to change(User, :count).by(1)
	#end
      end

      
      
  end
  
    describe "edit" do
#      let(:user) {FactoryGirl.create(:user) }
      let(:user) { User.find(35) }
      let(:user_password) {"timothy123"}

      before { visit edit_user_path(user) }
    before do
#	visit signin_path
#	  fill_in :email,            with: user.email
#	  fill_in :password,         with: user_password
#	click_button :submit
#	visit edit_user_path(user)
      end

      describe "page" do
	it { should have_selector('title', :content => "Edit user") }
	it { should have_selector('h1',    :content => "Update your profile") }
      # it { should have_link('change', :href => 'http://gravatar.com/emails') }
      end
 
 
      describe "with valid information" do
	let(:new_name)  { "Ranjan R Thomas" }
	let(:new_email) { "rthomas@yahoo.com" }
	
	before do
	  fill_in :name,             with: new_name
	  fill_in "Email",            with: new_email
	  fill_in "Password",         with: user_password
	  fill_in :password_confirmation, with: user_password
	  click_button :submit
	end

	it { should have_selector('h1', text: new_name) }
	it { should have_selector('div.alert.alert-success') }
	it { should have_link('Sign out', {:href => signout_path}) }	
	specify { user.reload.name.should  == new_name }
	specify { user.reload.email.should == new_email }
	end
      end

    
  
      describe "profile page" do 
      #let(:user) { FactoryGirl.create(:user) }
      let (:user) {User.find(9)}
 
      before {visit user_path(user) }
      
      it { should have_selector('title',  :content => user.name) }
      it { should have_selector('h1',     :content => user.name) }
  end
  
end