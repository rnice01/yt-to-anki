# typed: true
require_relative './youtube_sub_dl/version.rb'

module YoutubeSubDl
  class Error < StandardError; end

  def self.run
    puts 'Enter the URL'
    url = gets.chomp()
    app_root = File.join(File.dirname(__FILE__), '../')
    Dir.chdir(File.join(app_root, 'bin')) do
      `./youtube-dl "#{url}" --sub-lang ja,en --sub-format vtt --write-sub -o '../downloads/%(title)s'`
    end
  end

  # Converts a video file to MP3
  #
  #@param [String] video_file path to the video file
  #@return [String] path to the MP3, same name as the video file
  def video_to_mp3(video_file)
    base_name = File.basename(video_file, ".*")
    audio_file = "#{base_name}.mp3"
    `ffmpeg -i "#{video_file}" -vn -ab 128k -ar 44100 -y "#{audio_file}"`

    audio_file
  end
end