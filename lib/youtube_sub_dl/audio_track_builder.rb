require 'open3'
require 'csv'
require_relative './storage.rb'

module YoutubeSubDl
  class AudioTrackBuilder
    def initialize(video, target_lang, native_lang)
      @video = video
      @audio_file = video.get_mp3()
      @target_subs = video.get_subs(target_lang)
      @native_subs = video.get_subs(native_lang)
    end

    def save_as_csv
      CSV.open(Storage::path_for(:csv, "#{@video.title}.csv"), "w") do |csv|
        csv << ["target", "native", "audio_file"]
        @target_subs.each_with_index do |sub, i|
          audio_track = slice_track(sub.time_start, sub.time_end, sub.subs.split("\n")[0])
          native_sub = @native_subs[i].nil?? "" : @native_subs[i].subs
          csv << [sub.subs, native_sub, "[sound:#{audio_track}]"]
        end
      end
    end

    def slice_track(start, stop, name)
      track_name = "#{name}.mp3"
      track_file = Storage::path_for(:audio, track_name)
      unless File.exists?(track_file)
        Open3.popen3("ffmpeg -ss #{start} -to #{stop} -i #{@audio_file} #{track_file}")
      end
      track_name
    end
  end
end