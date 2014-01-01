require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'
include Clockwork

handler do |job|
  puts "Running #{job}"
end

every(5.seconds, 'Queueing PushInfoToLiveStreamJob job') { Delayed::Job.enqueue PushInfoToLiveStreamJob.new, queue: :live_stream }
