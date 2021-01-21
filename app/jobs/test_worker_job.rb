class TestWorkerJob < ActiveJob::Base
  queue_as :default

  def perform(source)
    puts '>>>>>>>>>>>>>>>>>>>>>>::::::::: received job from: ', source
  end
end
