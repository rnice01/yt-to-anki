require 'pathname'
require 'yaml'

module Storage
  class NotAStorageTypeError < StandardError; end
  extend self

  APP_ROOT = Pathname.new(__FILE__).join('../../../').to_path()
  CONFIG = File.exists?("#{APP_ROOT}/config.yml") ? YAML.load(File.read("#{APP_ROOT}/config.yml")) : {}

  def path_for(sym, file_name)
    audio_path = CONFIG.has_key?(:anki_media) ? CONFIG[:anki_media] : "#{APP_ROOT}/tmp"
    paths = {
      :audio => audio_path,
      :csv => "#{APP_ROOT}/tmp",
      :subs => "#{APP_ROOT}/downloads",
      :tmp => "#{APP_ROOT}/tmp",
      :video => "#{APP_ROOT}/downloads"
    }

    unless paths.has_key?(sym)
      raise NotAStorageTypeError.new("#{sym} is not a known storage type, try one of #{paths.keys.to_s}")
    end

    "#{paths[sym]}/#{file_name}"
  end

  def open(sym, file)
    File.open(path_for(sym, file))
  end

  def exists?(sym, file)
    File.exists?(path_for(sym, file))
  end
end