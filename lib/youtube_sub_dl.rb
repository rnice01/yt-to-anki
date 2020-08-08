require_relative './youtube_sub_dl/version.rb'

module YoutubeSubDl
  class Error < StandardError; end

  def self.run
    app_root = File.join(File.dirname(__FILE__), '../')
    Dir.chdir(File.join(app_root, 'bin')) do
      `./youtube-dl https://www.youtube.com/watch?v=7Vk6CuA88O8 --sub-lang ja --sub-format vtt --write-sub -o '../downloads/%(title)s'`
    end
  end
end

YoutubeSubDl.run()
