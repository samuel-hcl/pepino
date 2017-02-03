require 'cucumber'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rspec/expectations'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.run_server = false
  config.default_max_wait_time = 5
end

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  caps = Selenium::WebDriver::Remote::Capabilities.firefox(firefox_profile: profile, marionette: false)
  Capybara::Selenium::Driver.new(app, :browser => :firefox, desired_capabilities: caps)
end
