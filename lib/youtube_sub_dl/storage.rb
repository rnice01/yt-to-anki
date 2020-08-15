require 'pathname'

module Storage
  class NotAStorageTypeError < StandardError; end
  extend self

  APP_ROOT = Pathname.new(__FILE__).join('../../../').to_path()

  def path_for(sym, file_name)
    paths = {
      :audio => "#{APP_ROOT}/tmp",
      :video => "#{APP_ROOT}/downloads",
      :subs => "#{APP_ROOT}/downloads",
      :csv => "#{APP_ROOT}/tmp"
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