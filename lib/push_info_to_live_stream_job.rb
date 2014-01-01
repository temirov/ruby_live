class PushInfoToLiveStreamJob

  def perform
    sleep 1
  end

  def after job
    statuses = %w|Success Failure Rollback Refresh|
    current_status = statuses.sample
    p current_status
    # current_status = 'Refresh'
    ActiveSupport::Notifications.instrument("jobs.events", event: current_status)
  end

  def max_attempts
    3
  end
end