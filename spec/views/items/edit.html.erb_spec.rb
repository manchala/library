require 'spec_helper'

describe "items/edit" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :title => "MyString",
      :description => "MyText",
      :price => "9.99",
      :image_url => "MyString"
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => items_path(@item), :method => "post" do
      assert_select "input#item_title", :name => "item[title]"
      assert_select "textarea#item_description", :name => "item[description]"
      assert_select "input#item_price", :name => "item[price]"
      assert_select "input#item_image_url", :name => "item[image_url]"
    end
  end
end
