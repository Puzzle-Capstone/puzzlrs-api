require 'rails_helper'
RSpec.describe AcceptanceWorker, type: :worker do
  it { is_expected.to be_processed_in :default }
  it { is_expected.to be_retryable false }
end
