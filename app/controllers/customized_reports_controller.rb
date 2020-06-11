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
    @clinic = Clinic.find(customized_report_params[:clinic_id]) if customized_report_params[:clinic_id]

    @patients_screened = Patient.limit(5) if customized_report_params[:patient_screened]
    @patients_tested = Patient.limit(5) if customized_report_params[:patient_tested]
    @patients_safety_kit = Patient.limit(5) if customized_report_params[:safety_kit]
    @patients_by_county = Patient.where(county: customized_report_params[:county]) if customized_report_params[:county]

    @age = true if customized_report_params[:age]
    @gender = true if customized_report_params[:gender]
    @race = true if customized_report_params[:race]
    @zip_code = true if customized_report_params[:zip_code]
    @insurance_type = true if customized_report_params[:insurance_type]
    @date_of_birth = true if customized_report_params[:date_of_birth]
    @vacine_name_and_lot_number = true if customized_report_params[:vacine_name_and_lot_number]
    @county = true if @patients_by_county

    respond_to do |format|
      format.pdf do
        render pdf: "Customized report",
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
      params.require(:customized_report).permit(
        :patient_screened, :patient_tested, :safety_kit, 
        :age, :gender, :race, :clinic_id, :zip_code,
        :insurance_type, :date_of_birth, :vacine_name_and_lot_number,
        :county
      )
    end

end
