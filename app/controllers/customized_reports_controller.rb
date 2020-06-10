class CustomizedReportsController < InheritedResources::Base
  layout "clinic_management"

  def show
    @clinic = Clinic.find(params['clinic_id']) if params['clinic_id']
    respond_to do |format|
      format.pdf do
        render pdf: "Customized report for #{@clinic.name}",
                page_size: 'A4',
                template: "customized_reports/report_pdf.html.erb",
                layout: "clinic-print.pdf.erb",
                orientation: "Landscape",
                lowquality: true,
                zoom: 1,
                dpi: 75,
                encoding: 'utf8'
      end
    end
  end

  def new
    @clinic = Clinic.find(params['clinic_id']) if params['clinic_id']
    @customized_report = CustomizedReport.new
    @page_title = "New Customized Report"
  end

  def create
    # @customized_report = CustomizedReport.new(customized_report_params)
    @clinic = Clinic.find(customized_report_params[:clinic_id])

    # Name of patients screened
    if customized_report_params[:patient_screened]
      @patients_screened = Patient.limit(5)
    end

    # Name of tested patients
    if customized_report_params[:patient_tested]
      @patients_tested = Patient.limit(5)
    end 

    respond_to do |format|
      format.pdf do
        render pdf: "Customized report for #{@clinic.name}",
                page_size: 'A4',
                template: "customized_reports/report_pdf.html.erb",
                layout: "clinic-print.pdf.erb",
                orientation: "Landscape",
                lowquality: true,
                zoom: 1,
                dpi: 75,
                encoding: 'utf8'
      end
    end
  end

  private

    def customized_report_params
      params.require(:customized_report).permit(:patient_screened, :patient_tested, :clinic_id)
    end

end
