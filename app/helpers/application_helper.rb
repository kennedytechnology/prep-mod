module ApplicationHelper
  def school_mode?
    return (ENV["SCHOOL_VACCINATION_MODE"] && (ENV["SCHOOL_VACCINATION_MODE"] == "true")) ? true : false
  end
end
