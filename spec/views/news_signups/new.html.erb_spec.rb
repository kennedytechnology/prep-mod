require 'rails_helper'

RSpec.describe "news_signups/new", type: :view do
  before(:each) do
    assign(:news_signup, NewsSignup.new(
      name: "MyString",
      email: "MyString"
    ))
  end

  it "renders new news_signup form" do
    render

    assert_select "form[action=?][method=?]", news_signups_path, "post" do

      assert_select "input[name=?]", "news_signup[name]"

      assert_select "input[name=?]", "news_signup[email]"
    end
  end
end
