require 'rubygems'
require 'spork'

Spork.prefork do

  ENV["RAILS_ENV"] ||= 'test'
  unless defined?(Rails)
    require File.dirname(__FILE__) + "/../config/environment"
  end

  require 'rspec/rails'

  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/autorun'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

    RSpec.configure do |config|

      config.fixture_path = "#{::Rails.root}/spec/fixtures"
      config.use_transactional_fixtures = true
      config.infer_base_class_for_anonymous_controllers = false
      config.order = "random"
      config.mock_with :rspec
      ActiveSupport::Dependencies.clear
    end
end

Spork.each_run do
end
