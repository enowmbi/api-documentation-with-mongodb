require 'rails_helper'

RSpec.describe "end_points/show", type: :view do
  before(:each) do
    assign(:end_point, EndPoint.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
