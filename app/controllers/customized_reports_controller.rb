class CustomizedReportsController < InheritedResources::Base
  layout "clinic_management"

  def new
    @clinic = Clinic.find(params['clinic_id'])
    @customized_report = CustomizedReport.new
    @page_title = "New Customized Report"
  end

  private

    def customized_report_params
      params.require(:customized_report).permit()
    end

end
