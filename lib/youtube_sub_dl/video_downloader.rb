require 'open3'
require 'json'
require 'pathname'

module YoutubeSubDl
  class VideoDownloader

    # Fetches the video from the provided URL
    # and saves the file in the configured directory.
    #
    # @param [String] url
    # @param [String] target_lang
    # @param [String] native_lang
    #
    # @return [String] the path to the saved file
    def fetch_and_save(url, target_lang, native_lang)
      app_root = Pathname.new(__FILE__).join('../../../').to_path()
      downloads_path = "#{app_root}/downloads"
      langs = "#{target_lang},#{native_lang}"

      Dir.chdir("#{app_root}/bin") do
        Open3.popen3("./youtube-dl #{url} --sub-lang #{langs} --sub-format vtt --write-sub --no-warnings --print-json -o '#{downloads_path}/%(title)s'") do |stdin, stdout, stderr|
          json_output = JSON.parse(stdout.read)

          return "#{downloads_path}/#{json_output['fulltitle'].encode('utf-8')}.mkv"
        end
      end
    end
  end
end