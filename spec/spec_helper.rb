ENV["RAILS_ENV"] = 'test'

require 'capybara/rspec'
require 'database_cleaner'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'devise'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

# check pending migrations
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer
  # config.include Sprockets::Helpers::RailsHelper
  config.include Devise::TestHelpers, type: :controller

  config.use_transactional_fixtures = true

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:suite) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed
end
