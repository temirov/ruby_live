require 'reloader/sse'

class DashboardController < ApplicationController
  include ActionController::Live
  respond_to :html, :js
  
  def show
    @time = Time.now
    respond_with @time
  end
  
  def events
    response.headers['Content-Type'] = 'text/event-stream'

    sse = Reloader::SSE.new(response.stream)

    # ActiveSupport::Notifications.subscribe 'jobs.events' do |*args|
    #   event = args.extract_options![:event] 
    #   #   # p args.extract_options!
    #   # #   p args.extract_options![:event]
    #   # #   # sse.write({ time: Time.now }, event: 'Refresh') if args.extract_options![:event] == 'Refresh'
    #   # #   # sleep 1
    #   # #   # response.stream.write("messageType: '#{event}', data: #{data}\n\n")
    #   # #   response.stream.write({  }, )
    #   # #   response.stream.write("event: 'Refresh'\ndata: #{time: Time.now}\n\n")
    # end

    # loop do
    #   sse.write({ time: Time.now }, event: 'Refresh') 
    #   # response.stream.write "event: 'Refresh'\ndata: #{JSON.dump({ time: Time.now })}\n\n"
    #   sleep 1
    # end

    User.on_change do
      sse.write({ time: Time.now }, event: 'Refresh') 
    end

    rescue IOError
      logger.info "Stream closed"
      # When the client disconnects, we'll get an IOError on write
    ensure
      logger.info "Events action is quitting and closing stream!"
      sse.close
      # response.stream.close
  end
end
