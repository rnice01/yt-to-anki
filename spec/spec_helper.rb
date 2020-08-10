# typed: strict
require "bundler/setup"
require "youtube_sub_dl"

require_relative '../lib/youtube_sub_dl/subs_parsers/sub_track'
require_relative '../lib/youtube_sub_dl/subs_parsers/vtt_parser'

module Helpers
  def file_stub(file_name)
    File.open(File.join(File.dirname(__FILE__), 'support', file_name))
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include Helpers
end
