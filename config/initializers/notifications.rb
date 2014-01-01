# ActiveSupport::Notifications.subscribe "jobs.events" do |name, start, finish, id, payload|
#   # Rails.logger.debug(["notification:", name, start, finish, id, payload].join(" "))
#   Rails.logger.debug "notification: #{payload[:event]}"
# end

ActiveSupport::Notifications.subscribe('jobs.events') do |*args|
  options = args.extract_options!
  DashboardController.stream_events << options[:event]
end

