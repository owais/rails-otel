class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
    puts 'sidekiq job performed'
  end
end