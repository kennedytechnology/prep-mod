require 'rails_helper'

RSpec.describe "news_signups/edit", type: :view do
  before(:each) do
    @news_signup = assign(:news_signup, NewsSignup.create!(
      name: "MyString",
      email: "MyString"
    ))
  end

  it "renders the edit news_signup form" do
    render

    assert_select "form[action=?][method=?]", news_signup_path(@news_signup), "post" do

      assert_select "input[name=?]", "news_signup[name]"

      assert_select "input[name=?]", "news_signup[email]"
    end
  end
end
