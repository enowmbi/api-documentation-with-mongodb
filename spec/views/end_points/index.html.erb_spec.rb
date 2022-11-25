require 'rails_helper'

RSpec.describe "end_points/index", type: :view do
  before(:each) do
    assign(:end_points, [
      EndPoint.create!(),
      EndPoint.create!()
    ])
  end

  it "renders a list of end_points" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
