require 'rails_helper'

RSpec.describe "public/kit/new", type: :view do
  let(:clinic) { create(:clinic) }

  before(:each) do
    assign(:patient, Patient.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      middle_initial: ("A".."Z").to_a.sample,
      email: "new_kit@example.com",
      date_of_birth: Faker::Date.birthday,
      address: "3440 Brookhaven Road",
      city: "Pasadena",
      state: "MD",
      zip_code: 21122,
      county: COUNTIES.sample,
      phone_number: Faker::PhoneNumber.cell_phone
    ))
  end

  it "renders new kit(patient) form" do
    render

    assert_select "form[action=?][method=?]", "/kit/create", "post" do
      assert_select "input[name=?]", "patient[first_name]"
      assert_select "input[name=?]", "patient[last_name]"
      assert_select "input[name=?]", "patient[middle_initial]"
      assert_select "input[name=?]", "patient[email]"
      assert_select "input[name=?]", "patient[date_of_birth]"
      assert_select "input[name=?]", "patient[address]"
      assert_select "input[name=?]", "patient[city]"
      assert_select "select[name=?]", "patient[state]"
      assert_select "input[name=?]", "patient[zip_code]"
      assert_select "select[name=?]", "patient[county]"
      assert_select "input[name=?]", "patient[phone_number]"
    end
  end
end
