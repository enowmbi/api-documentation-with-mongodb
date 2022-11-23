require 'rails_helper'

RSpec.describe "resources/new", type: :view do
  before(:each) do
    assign(:resource, Resource.new(
      name: "MyString",
      description: "MyText"
    ))
  end

  it "renders new resource form" do
    render

    assert_select "form[action=?][method=?]", resources_path, "post" do

      assert_select "input[name=?]", "resource[name]"

      assert_select "textarea[name=?]", "resource[description]"
    end
  end
end
