require 'rails_helper'

RSpec.describe ClinicPrimaryGroup, type: :model do

  it { should have_and_belong_to_many :provider_enrollments }
  
  pending "add some examples to (or delete) #{__FILE__}"
end
