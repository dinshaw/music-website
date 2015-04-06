ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

class ActiveSupport::TestCase
  include TestPasswordHelper
  fixtures :all
end

class ActionController::TestCase
  include Devise::TestHelpers
end

ActiveRecord::FixtureSet.context_class.send :include, TestPasswordHelper
