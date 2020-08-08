require_relative 'lib/youtube_sub_dl/version'

Gem::Specification.new do |spec|
  spec.name          = "youtube_sub_dl"
  spec.version       = YoutubeSubDl::VERSION
  spec.authors       = ["Rob Nice"]
  spec.email         = ["rob.w.nice@gmail.com"]

  spec.summary       = %q{Script to use youtube-dl to download a video and JA subs, and convert VTT subs to SRT}
  spec.homepage      = "https://github.com/rnice01/yt_subs_dl"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
