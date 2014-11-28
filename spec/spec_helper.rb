# -*- encoding : utf-8 -*-
require 'simplecov'
require 'coveralls'
require 'factory_girl'

SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter, Coveralls::SimpleCov::Formatter]

SimpleCov.start do
  add_filter 'spec'
  coverage_dir 'docs/coverage'
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.include FactoryGirl::Syntax::Methods
  config.mock_with :rr

  config.disable_monkey_patching!

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed
end
