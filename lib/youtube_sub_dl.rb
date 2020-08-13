# typed: true
require_relative './youtube_sub_dl/version.rb'
require_relative './youtube_sub_dl/subs_parsers/vtt_parser.rb'
require_relative './youtube_sub_dl/audio_track_builder.rb'
require_relative './youtube_sub_dl/video_downloader.rb'
require_relative './youtube_sub_dl/video.rb'

module YoutubeSubDl
  class Error < StandardError; end
  class SubFileNotExistError < Error; end

  def self.run
    #puts 'Enter the URL'
    #url = gets.chomp()
    #puts 'Target language sub'
    #target_language = gets.chomp()
    #puts 'Native language sub'
    #native_language = gets.chomp()
    url = "https://www.youtube.com/watch?v=QFeB4fjwv3o"
    target_language = "ja"
    native_language = "en"

    video_file = YoutubeSubDl::VideoDownloader.new.fetch_and_save(url, target_language, native_language)

    video = YoutubeSubDl::Video.new(video_file, SubsParsers::VttParser.new)

    YoutubeSubDl::AudioTrackBuilder.new(video, target_language, native_language).save_as_csv()
  end
end

YoutubeSubDl.run