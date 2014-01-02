class DashboardController < ApplicationController
  respond_to :html, :js
  
  def show
    @time = Time.now
    respond_with @time
  end
  
  def events
    response.headers['Content-Type'] = 'text/event-stream'

    User.on_change do |change|
      response.stream.write to_sse({ time: Time.now }, {event: 'Refresh'})
    end

    rescue IOError
      logger.info "Stream closed"
      # When the client disconnects, we'll get an IOError on write
    ensure
      logger.info "Events action is quitting and closing stream!"
      response.stream.close
  end
end
