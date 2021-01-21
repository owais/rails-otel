module Api
  class Core < Sinatra::Base
   get '/api' do
     TestWorkerJob.perform_later('sinatra')
     "Howdy, from your Sinatra API."
   end
  end
end
