ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module AuthenticationHelpers
  def log_in_as(user)
    post session_url, params: { email_address: user.email_address, password: "password" }
    assert_redirected_to root_url
  end
end

class ActiveSupport::TestCase
  include AuthenticationHelpers

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
end
