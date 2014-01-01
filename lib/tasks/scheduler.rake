namespace :live_example do
  desc 'Refresh ECQ data cards'
  task test: :environment do
    Delayed::Job.enqueue PushInfoToLiveStreamJob.new
  end
end