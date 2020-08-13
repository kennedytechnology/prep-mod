module ApplicationHelper

  def cw_date_field(form, name, options = {}, args = {})
    if args["data-flatpickr-max-date"]
      date_options = {order: [:month, :day, :year], start_year: Date.current.year - 99, end_year: Date.current.year, include_blank: true}
    elsif args["data-flatpickr-min-date"]
      date_options = {order: [:month, :day, :year], start_year: Date.current.year, end_year: Date.current.year + 10, include_blank: true}
    else
      date_options = {order: [:month, :day, :year], include_blank: true}
    end

    ENV['DATEPICKER'] == "true" ? form.date_select(name, date_options, class: "form-select") : form.text_field(name, options.merge!(args))
  end

  def school_mode?
    return (ENV["SCHOOL_VACCINATION_MODE"] && (ENV["SCHOOL_VACCINATION_MODE"] == "true")) ? true : false
  end

  def public_logo
    ENV['PUBLIC_LOGO'] + "-logo.png"
  end

  def clinic_logo
    ENV['CLINIC_LOGO'] + "-logo.png"
  end

  def humanize_boolean(boolean)
    case boolean
    when true
      'Yes'
    when false
      'No'
    else
      boolean
    end
  end
end
