# This file is copied to spec/ when you run 'rails generate rspec:install'

require 'faker'
require 'factory_bot_rails'
FactoryBot::SyntaxRunner.send(:include, FactoryBot::Syntax::Methods)

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/rails_helper.rb'
end

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|

  config.include FactoryBot::Syntax::Methods
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://rspec.info/features/6-0/rspec-rails
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# Dummy Tea Data for test
@teas = []
teas_data = [
  {
    title: 'English Breakfast Tea',
    description: 'A classic black tea blend known for its robust and full-bodied flavor. It\'s often enjoyed with milk and sugar.',
    temperature: 200,
    brew_time: 3
  },
  {
    title: 'Green Tea',
    description: 'A light and refreshing tea with a grassy, vegetal flavor. Green tea is rich in antioxidants and is known for its health benefits.',
    temperature: 175,
    brew_time: 2
  },
  {
    title: 'Chamomile Tea',
    description: 'A caffeine-free herbal tea made from dried chamomile flowers. It has a refreshing and minty taste.',
    temperature: 212,
    brew_time: 5
  },
  {
    title: 'Oolong Tea',
    description: 'Oolong tea is a partially oxidized tea with a flavor profile that falls between green and black teas. It has a complex taste with floral and fruity notes.',
    temperature: 185,
    brew_time: 3
  },
  {
    title: 'Earl Grey Tea',
    description: 'A black tea infused with the essence of bergamot oranges, resulting in a fragrant and citrusy flavor.',
    temperature: 212,
    brew_time: 3
  },
  {
    title: 'Peppermint Tea',
    description: 'A caffeine-free herbal tea made from dried peppermint leaves. It has a refreshing and minty taste.',
    temperature: 212,
    brew_time: 4
  },
  {
    title: 'Darjeeling Tea',
    description: 'Known as the "Champagne of Teas," Darjeeling tea is a light and delicate black tea with floral and fruity notes.',
    temperature: 200,
    brew_time: 3
  },
  {
    title: 'Jasmine Tea',
    description: 'A green tea scented with jasmine flowers, resulting in a fragrant and floral infusion.',
    temperature: 175,
    brew_time: 2
  },
  {
    title: 'Chai Tea',
    description: 'A spiced black tea often brewed with a mixture of spices like cinnamon, cardamom, and cloves. It has a warm and spicy flavor.',
    temperature: 212,
    brew_time: 5
  },
  {
    title: 'White Tea',
    description: 'A subtle and delicate tea made from young tea leaves and buds. It has a mild and slightly sweet flavor.',
    temperature: 175,
    brew_time: 2
  }
]

# Create teas and store them in the @teas array
teas_data.each do |tea_data|
  @teas << Tea.create!(tea_data)
end