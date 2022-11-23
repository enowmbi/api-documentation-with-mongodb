require 'rails_helper'

RSpec.describe "resources/edit", type: :view do
  let(:resource) {
    Resource.create!(
      name: "MyString",
      description: "MyText"
    )
  }

  before(:each) do
    assign(:resource, resource)
  end

  it "renders the edit resource form" do
    render

    assert_select "form[action=?][method=?]", resource_path(resource), "post" do

      assert_select "input[name=?]", "resource[name]"

      assert_select "textarea[name=?]", "resource[description]"
    end
  end
end
