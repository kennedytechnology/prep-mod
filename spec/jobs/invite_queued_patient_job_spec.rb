require 'rails_helper'

RSpec.describe InviteQueuedPatientJob, type: :job do
  describe "#perform_later" do
    it "enqueues a job for a patient" do
      patient = create(:patient)
      ActiveJob::Base.queue_adapter = :test
      expect {
        InviteQueuedPatientJob.perform_later(patient)
      }.to have_enqueued_job.with(patient).at(:no_wait)
    end
  end
end
