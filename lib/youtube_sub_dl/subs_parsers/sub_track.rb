module SubsParsers
  class SubTrack
    attr_reader :time_start, :time_end, :subs

    def initialize(time_start, time_end, subs)
      @time_start = time_start
      @time_end = time_end
      @subs = subs
    end
  end
end