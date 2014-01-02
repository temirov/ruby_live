module Concerns::Sseable
  def to_sse object, options = {}
    (options.map{|k,v| "#{k}: #{v}" } << "data: #{JSON.dump object}").join("\n") + "\n\n"
  end
end