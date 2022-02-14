require 'rails_helper'
RSpec.describe MailerWorker, type: :worker do
  it { is_expected.to be_processed_in :default }
  it { is_expected.to be_retryable false }
end
