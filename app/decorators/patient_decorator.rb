class PatientDecorator < Draper::Decorator
  delegate_all

  def formatted_phone_number
    Phonelib.parse(phone_number).national
  end
end
