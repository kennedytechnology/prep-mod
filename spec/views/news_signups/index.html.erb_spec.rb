require 'rails_helper'

RSpec.describe "news_signups/index", type: :view do
  before(:each) do
    assign(:news_signups, [
      NewsSignup.create!(
        name: "Name",
        email: "Email"
      ),
      NewsSignup.create!(
        name: "Name",
        email: "Email"
      )
    ])
  end

  it "renders a list of news_signups" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
