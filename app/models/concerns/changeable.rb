module Concerns::Changeable
  def on_change
    loop do
      updated_recently = changed_field
      sleep check_interval
      updated_now = changed_field
      # yield self if updated_now != updated_recently 

      statuses = %w|Success Failure Rollback Refresh|
      current_status = statuses.sample
      yield self if current_status == "Success"
    end
  end

  protected
    def changed_field field: :updated_at
      pluck field
    end

    def check_interval interval: 1.second
      interval
    end
end