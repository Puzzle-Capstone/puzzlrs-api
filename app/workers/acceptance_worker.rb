class AcceptanceWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(user_id, puzzle_id)
    AcceptanceMailer.with(user: User.find(user_id.to_i), puzzle: Puzzle.find(puzzle_id.to_i)).acceptance_email.deliver_now
  end
end
