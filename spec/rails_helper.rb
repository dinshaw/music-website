# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'support/auth_steps.rb'
require 'support/password_helper'

ActiveRecord::Migration.maintain_test_schema!

ActiveRecord::FixtureSet.context_class.send :include, PasswordHelper

WebMock.disable_net_connect!(allow_localhost: true)

Capybara.javascript_driver = :webkit
Capybara::Screenshot.prune_strategy = :keep_last_run

RSpec.configure do |config|
  config.global_fixtures = :all
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_spec_type_from_file_location!
  config.include Devise::TestHelpers, :type => :controller

  # Transactions will be handled by DatabaseCleaner
  config.use_transactional_fixtures = false
  config.before do |example|
    case
    when example.metadata[:js]
      DatabaseCleaner.strategy = :truncation
      Capybara.current_driver = Capybara.javascript_driver
    when example.metadata[:selenium]
      DatabaseCleaner.strategy = :truncation
      Capybara.current_driver = :selenium
    else
      DatabaseCleaner.strategy = :transaction
    end
    DatabaseCleaner.start
  end

  config.after(:each) do |example|
    DatabaseCleaner.clean
    Capybara.use_default_driver
  end

  config.append_after(:each) do
    Capybara.reset_sessions!
  end
end

def pause
  binding.pry
end
