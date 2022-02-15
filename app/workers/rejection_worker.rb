class RejectionWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(user_id, puzzle_id)
    RejectionMailer.with(user: User.find(user_id.to_i), puzzle: Puzzle.find(puzzle_id.to_i)).rejection_email.deliver_now
  end
end