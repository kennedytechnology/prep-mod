require 'rails_helper'

RSpec.describe "news_signups/show", type: :view do
  before(:each) do
    @news_signup = assign(:news_signup, NewsSignup.create!(
      name: "Name",
      email: "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
  end
end
