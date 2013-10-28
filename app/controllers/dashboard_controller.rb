require 'reloader/sse'

class DashboardController < ApplicationController
  include ActionController::Live
  
  def show
    @time = Time.now
    
  end
  
  def update
    response.headers['Content-Type'] = 'text/event-stream'
    
    sse = Reloader::SSE.new(response.stream)
    
    # 100.times {
    #   response.stream.write "hello world\n"
    # }
    # response.stream.close
    
    begin
      loop do
        sse.write({ time: Time.now }, event: 'refresh')
        sleep 1
      end
    rescue IOError
      # When the client disconnects, we'll get an IOError on write
    ensure
      sse.close
    end
  end
  
end
