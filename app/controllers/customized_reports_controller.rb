class CustomizedReportsController < InheritedResources::Base
  layout "clinic_management"

  def show
    @customized_report = CustomizedReport.find(params[:id])
    @clinic = @customized_report.clinic if @customized_report.clinic

    @patients_screened = Patient.joins(:clinic_events).where(clinic_events: {category: "Screened"}) if @customized_report.patients_screened
    @patients_tested = Patient.joins(:clinic_events).where(clinic_events: {category: "Tested"}) if @customized_report.patients_tested
    @patients_safety_kit = Patient.joins(:clinic_events).where(clinic_events: {category: "Safety Kit"}) if @customized_report.safety_kit
    @patients_by_county = Patient.where(county: @customized_report.county) if !@customized_report.county.blank?

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

      format.xlsx do
        render xlsx: 'customized_report', template: 'customized_reports/report_excel', 
                disposition: 'inline', filename: "customized_report_#{Date.today.strftime("%d_%m_%Y")}.xlsx",
                xlsx_author: @customized_report.user.name
      end
    end
  end

  def new
    @clinic = Clinic.find(params['clinic_id']) if params['clinic_id']
    @customized_report = CustomizedReport.new
    @page_title = "New Customized Report"
  end

  def create
    @customized_report = CustomizedReport.new(customized_report_params)
    @customized_report.user = current_user
    format_name = params[:pdf_file] ? :pdf : :xlsx

    if @customized_report.save
      redirect_to customized_report_path(id: @customized_report.id, format: format_name)
    else
      render :new
    end
  end

  private

    def customized_report_params
      params.require(:customized_report).permit(
        :patients_screened, :patients_tested, :safety_kit, 
        :pending_patients, :registration_date,
        :age, :gender, :race, :clinic_id, :zip_code,
        :insurance_type, :date_of_birth, :vaccine_name_and_lot_number,
        :county
      )
    end

end
