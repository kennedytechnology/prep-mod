require 'rails_helper'

RSpec.describe "patients/new.html.erb", type: :view do
  before(:each) do
    assign(:patient, Patient.new(attributes_for(:patient)))
  end

  it "renders new patient form" do
    render

    assert_select "form[action=?][method=?]", patients_path, "post" do
      assert_select "input[name=?]", "patient[first_name]"
      assert_select "input[name=?]", "patient[last_name]"
      assert_select "input[name=?]", "patient[email]"
      assert_select "input[name=?]", "patient[middle_initial]"
      assert_select "select[name=?]", "patient[date_of_birth(1i)]"
      assert_select "select[name=?]", "patient[date_of_birth(2i)]"
      assert_select "select[name=?]", "patient[date_of_birth(3i)]"
      assert_select "input[name=?]", "patient[address]"
      assert_select "input[name=?]", "patient[city]"
      assert_select "select[name=?]", "patient[state]"
      assert_select "input[name=?]", "patient[zip_code]"
      assert_select "select[name=?]", "patient[county]"
      assert_select "input[name=?]", "patient[phone_number]"
    end
  end
end
