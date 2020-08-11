module SubsParsers
  class VttParser
    # Parses VTT formatted files and returns
    # an array of SubTrack
    #
    # @param [File]
    # @return [Array(SubTrack)]
    def get_subs(file)
      subs = []
      track_line = ''
      track_subs = []

      file.each_line do |line|
        if /^((\d\d:)?\d\d:\d\d\.\d+\s-->\s)/.match?(line)
          track_line = line
        elsif !track_line.empty? && line.eql?("\n")
          subs.push(create_sub_track(track_line, track_subs))
          track_line = ''
          track_subs = []
        elsif !track_line.empty?
          track_subs.push(line)
        else
          track_line = ''
          track_subs = []
        end
      end

      if !track_subs.empty? && !track_subs.empty?
        subs.push(create_sub_track(track_line, track_subs))
      end

      subs
    end

    private

    def create_sub_track(track_line, subs)
      case track_line.split('-->')
        in [start_time, end_time]
          SubTrack.new(start_time.strip(), end_time.strip(), subs.join("").strip())
      end
    end
  end
end