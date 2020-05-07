class CustomizedReportsController < InheritedResources::Base
  layout "clinic_management"

  private

    def customized_report_params
      params.require(:customized_report).permit()
    end

end
