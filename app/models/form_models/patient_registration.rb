module PatientRegistration
  class Base
    include ActiveModel::Model
    attr_accessor :patient

    delegate *::Patient.attribute_names.map { |attr| [attr, "#{attr}="] }.flatten, to: :patient

    def initialize(patient_attributes)
      @patient = ::Patient.new(patient_attributes)
    end
  end

  class StepOne
    validates_presence_of :first_name
  end
end