class PatientDecorator < Draper::Decorator
  delegate_all

  def phone_number
    Phonelib.parse(phone_number).national
  end
end
