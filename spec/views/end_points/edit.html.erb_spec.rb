require 'rails_helper'

RSpec.describe "end_points/edit", type: :view do
  let(:end_point) {
    EndPoint.create!()
  }

  before(:each) do
    assign(:end_point, end_point)
  end

  it "renders the edit end_point form" do
    render

    assert_select "form[action=?][method=?]", end_point_path(end_point), "post" do
    end
  end
end
