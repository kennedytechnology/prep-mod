require 'rails_helper'

RSpec.describe "customized_reports/new", type: :view do
  before(:each) do
    assign(:customized_report, CustomizedReport.new())
  end

  it "renders new customized_report form" do
    render

    assert_select "form[action=?][method=?]", customized_reports_path, "post" do
    end
  end
end
