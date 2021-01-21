
class TestController < ApplicationController
  def hello
    TestWorkerJob.perform_later('rails-controller')
  end
end
