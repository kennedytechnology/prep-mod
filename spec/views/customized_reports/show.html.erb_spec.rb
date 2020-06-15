require 'rails_helper'

RSpec.describe "customized_reports/show", type: :view do
  let!(:user) { create(:user) }
  before(:each) do
    @customized_report = assign(:customized_report, CustomizedReport.create!(user: User.last))
  end

  it "renders attributes in <p>" do
    render
  end
end
