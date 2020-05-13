require 'rails_helper'

RSpec.describe "news_signups/new", type: :view do
  before(:each) do
    assign(:news_signup, NewsSignup.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      date_of_birth: Faker::Date.birthday,
      zip_code: Faker::Address.zip_code,
      topics: ["Testing", "Screening", "Safety Kit", "Medication", "Other"],
      occupation: PATIENT_OCCUPATIONS.sample
    ))
  end

  it "renders new news_signup form" do
    render

    assert_select "form[action=?][method=?]", news_signups_path, "post" do
      assert_select "input[name=?]", "news_signup[first_name]"
      assert_select "input[name=?]", "news_signup[last_name]"
      assert_select "input[name=?]", "news_signup[email]"
      assert_select "input[name=?]", "news_signup[date_of_birth]"
      assert_select "input[name=?]", "news_signup[zip_code]"
      assert_select "input[name=?]", "news_signup[topics][]"
      assert_select "select[name=?]", "news_signup[occupation]"
    end
  end
end
