 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/customized_reports", type: :request do
  # CustomizedReport. As you add validations to CustomizedReport, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  before do
    clinic = create(:clinic)
  end

  describe "GET /index" do
    it "renders a successful response" do
      CustomizedReport.create! valid_attributes
      get customized_reports_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      customized_report = CustomizedReport.create! valid_attributes
      get customized_report_url(customized_report)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      clinic = create(:clinic)
      get new_customized_report_url(clinic_id: clinic)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      customized_report = CustomizedReport.create! valid_attributes
      get edit_customized_report_url(customized_report)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new CustomizedReport" do
        expect {
          post customized_reports_url, params: { customized_report: valid_attributes }
        }.to change(CustomizedReport, :count).by(1)
      end

      it "redirects to the created customized_report" do
        post customized_reports_url, params: { customized_report: valid_attributes }
        expect(response).to redirect_to(customized_report_url(CustomizedReport.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new CustomizedReport" do
        expect {
          post customized_reports_url, params: { customized_report: invalid_attributes }
        }.to change(CustomizedReport, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post customized_reports_url, params: { customized_report: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested customized_report" do
        customized_report = CustomizedReport.create! valid_attributes
        patch customized_report_url(customized_report), params: { customized_report: new_attributes }
        customized_report.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the customized_report" do
        customized_report = CustomizedReport.create! valid_attributes
        patch customized_report_url(customized_report), params: { customized_report: new_attributes }
        customized_report.reload
        expect(response).to redirect_to(customized_report_url(customized_report))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        customized_report = CustomizedReport.create! valid_attributes
        patch customized_report_url(customized_report), params: { customized_report: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested customized_report" do
      customized_report = CustomizedReport.create! valid_attributes
      expect {
        delete customized_report_url(customized_report)
      }.to change(CustomizedReport, :count).by(-1)
    end

    it "redirects to the customized_reports list" do
      customized_report = CustomizedReport.create! valid_attributes
      delete customized_report_url(customized_report)
      expect(response).to redirect_to(customized_reports_url)
    end
  end
end
