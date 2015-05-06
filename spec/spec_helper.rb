ENV['environment'] ||= 'test'
require 'coveralls'
Coveralls.wear!

require 'bundler/setup'
Bundler.setup

require 'hydra/pcdm'
require 'pry'
require 'active_fedora'
require 'active_fedora/cleaner'

Dir['./spec/support/**/*.rb'].each { |f| require f }

# require 'http_logger'
# HttpLogger.logger = Logger.new(STDOUT)
# HttpLogger.ignore = [/localhost:8983\/solr/]
# HttpLogger.colorize = false
# HttpLogger.log_headers = true

RSpec.configure do |config|
  config.color = true
  config.tty = true

  # Uncomment the following line to get errors and backtrace for deprecation warnings
  # config.raise_errors_for_deprecations!

  # Use the specified formatter
  config.formatter = :progress

  config.before :each do |example|
    unless example.metadata[:no_clean]
      ActiveFedora::Cleaner.clean!
    end
  end
end
