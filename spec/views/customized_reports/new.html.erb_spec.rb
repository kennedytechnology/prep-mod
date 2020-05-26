require 'rails_helper'

RSpec.describe "customized_reports/new", type: :view do
  before(:each) do
    assign(:customized_report, CustomizedReport.new())
    assign(:clinic, create(:clinic))
    assign(:page_title, "Title")
  end

  it "renders new customized_report form" do
    render

    assert_select "form[action=?][method=?]", customized_reports_path, "post" do
    end
  end
end
