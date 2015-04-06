require 'test_helper'
require 'minitest-metadata'
require 'capybara/rails'
require 'capybara/poltergeist'

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Assertions
  include Minitest::Metadata

  Capybara.default_driver = :poltergeist
  # Transactions will be handled by DatabaseCleaner
  self.use_transactional_fixtures = false

  # Load all of the fixtures
  fixtures :all

# Enable Capybara's spec DSL
  # Metadata hooks to :it, so we'll alias :test
  class << self
    alias :background :before
    alias :scenario   :it
    alias :test       :it
    alias :given      :let
    alias :context    :describe
  end

  # Configure the driver using metadata
  before do
    if metadata[:js]
      Capybara.current_driver = Capybara.javascript_driver
      DatabaseCleaner.strategy = :truncation
    else
      Capybara.current_driver = Capybara.default_driver
      DatabaseCleaner.strategy = :transaction
    end
    DatabaseCleaner.start
  end

  # Reset sessions and driver
  after do
    DatabaseCleaner.clean
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  # Pause a test for debugging in an open browser with pry
  def pause
    binding.pry
  end

end
