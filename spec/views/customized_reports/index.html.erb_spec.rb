require 'rails_helper'

RSpec.describe "customized_reports/index", type: :view do
  before(:each) do
    assign(:customized_reports, [
      CustomizedReport.create!(),
      CustomizedReport.create!()
    ])
  end

  it "renders a list of customized_reports" do
    render
  end
end
