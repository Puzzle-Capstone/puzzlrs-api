require 'spec_helper'
RSpec.describe MailerWorker, type: :worker do
  it { is_expected.to be_processed_in :my_queue }
  it { is_expected.to be_retryable false }
  it { is_expected.to be_unique }
  it { is_expected.to be_expired_in 1.hour }
end
