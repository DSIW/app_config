$LOAD_PATH.unshift File.dirname(__FILE__)

require 'yaml'

require 'core_ext/hashish'

module ApiStore
  VERSION = '0.0.1'

  autoload :Base, 'api_store/base'
  autoload :Yaml, 'api_store/yaml'

  def self.to_version
    "#{self.class} v#{VERSION}"
  end

  # Access the configured <tt>key</tt>'s value.
  def self.[](key)
    error = "Must call '#{self}.configure' to setup storage!"
    raise error if @@storage.nil?
    @@storage[key]
  end

  # Accepts an +options+ hash or pass a block.
  # See ApiStore::Base for valid options.
  def self.configure(options = {}, &block)
    @@storage = ApiStore::Base.new(options, &block)
  end

end