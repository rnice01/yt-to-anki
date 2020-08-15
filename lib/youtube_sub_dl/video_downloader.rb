require 'open3'
require 'json'
require_relative './storage.rb'

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
      langs = "#{target_lang},#{native_lang}"

      Dir.chdir("#{Storage::APP_ROOT}/bin") do
        cmd = "./youtube-dl --sub-lang #{langs} --sub-format vtt --write-sub --no-warnings --print-json -o '#{Storage::path_for(:video, "")}%(title)s' #{url}"
        Open3.popen3(cmd) do |stdin, stdout, stderr|
          json_output = JSON.parse(stdout.read)

          return Storage::path_for(:video, "#{json_output['fulltitle'].encode('utf-8')}.#{json_output['ext']}")
        end
      end
    end
  end
end