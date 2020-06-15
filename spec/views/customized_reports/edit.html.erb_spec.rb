require 'rails_helper'

RSpec.describe "customized_reports/edit", type: :view do
  let!(:user) { create(:user) }
  before(:each) do
    @customized_report = assign(:customized_report, CustomizedReport.create!(user: User.last))
  end

  it "renders the edit customized_report form" do
    render

    assert_select "form[action=?][method=?]", customized_report_path(@customized_report), "post" do
    end
  end
end
