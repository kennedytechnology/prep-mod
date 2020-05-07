require 'rails_helper'

RSpec.describe "customized_reports/show", type: :view do
  before(:each) do
    @customized_report = assign(:customized_report, CustomizedReport.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
