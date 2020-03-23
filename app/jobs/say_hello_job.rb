class SayHelloJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    GuestsCleanupJob.perform_later guest
  end
end
