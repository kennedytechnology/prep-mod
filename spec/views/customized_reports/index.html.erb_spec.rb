require 'rails_helper'

RSpec.describe "customized_reports/index", type: :view do
  let!(:user) { create(:user) }
  before(:each) do
    assign(:customized_reports, [CustomizedReport.create!(user: User.last)])
  end

  it "renders a list of customized_reports" do
    render
  end
end
