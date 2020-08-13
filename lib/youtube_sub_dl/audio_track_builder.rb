module YoutubeSubDl
  class AudioTrackBuilder
    def initialize(video, target_lang, native_lang)
      @video = video
      @target_subs = video.get_subs(target_lang)
      @native_subs = video.get_subs(native_lang)
    end

    def save_as_csv
      @target_subs.each do |sub|
        puts "#{sub.time_start} #{sub.time_end}"
        puts sub.subs
      end
      @native_subs.each do |sub|
        puts "#{sub.time_start} #{sub.time_end}"
        puts sub.subs
      end
    end
  end
end