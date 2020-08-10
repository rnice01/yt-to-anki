require "bundler/gem_tasks"
require "rspec/core/rake_task"
require_relative './lib/youtube_sub_dl'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :get_subs do
  YoutubeSubDl.run()
end

task :convert_subs do
  caps = Captions.VTT.new('./downloads/結局どうやったら日本語を話せるようになるの？.en.vtt')
  caps.export_to_srt('./downloads/結局どうやったら日本語を話せるようになるの？.en.srt')
end
