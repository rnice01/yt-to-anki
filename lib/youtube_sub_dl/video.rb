module YoutubeSubDl
  class Video
    attr_reader :video_file, :title

    # @param [String] path to a video file
    # @param [SubParser]
    def initialize(video_file, sub_parser)
      @video_file = video_file
      @sub_parser = sub_parser
      @title = File.basename(video_file, ".*")
    end

    # Returns the MP3 file for the video
    #
    # @return [String] path to the MP3
    def get_mp3
      base_name = File.basename(@video_file, ".*")
      audio_file = "#{base_name}.mp3"
      `ffmpeg -i "#{@video_file}" -vn -ab 128k -ar 44100 -y "#{audio_file}"`

      audio_file
    end

    # Returns an array of SubsParsers::SubTrack
    # from the parsed subs file for the video.
    # the subs files need to have the same title
    # as the video and the lang in the filename.
    #
    # @param [String] the language code (ex. ja for japanese, en for english)
    # @return [SubsParsers::SubTrack]
    def get_subs(lang)
      sub_file_name = "#{@title}.#{lang}.#{@sub_parser.format_name()}"
      sub_file = "#{File.dirname(@video_file)}/#{sub_file_name}"

      unless File.exist?(sub_file)
        raise YoutubeSubDl::SubFileNotExistError
      end

      @sub_parser.get_subs(File.open(sub_file))
    end
  end
end