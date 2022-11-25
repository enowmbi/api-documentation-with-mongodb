require 'rails_helper'

RSpec.describe "end_points/new", type: :view do
  before(:each) do
    assign(:end_point, EndPoint.new())
  end

  it "renders new end_point form" do
    render

    assert_select "form[action=?][method=?]", end_points_path, "post" do
    end
  end
end
