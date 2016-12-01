source 'https://rubygems.org'

ruby '2.3.3'
gem 'rails', '4.2.1'

gem 'pg', '~> 0.19'

gem 'foundation-rails', '~> 5.5.2'
gem 'foundation-icons-sass-rails', '3.0.0'
gem 'haml-rails', '~> 0.9'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails', '~> 4.0.3'
gem 'turbolinks', '~> 2.5.3'
gem 'devise', '~> 3.4.1'
gem 'actionview-encoded_mail_to', '~> 1.0.6'
gem 'aws-sdk', '~> 2'
gem 'figaro', '1.1.0'
gem 'dropbox-sdk', '1.6.5'

group :test do
  gem 'shoulda-matchers', '~> 2.8.0'
  gem 'capybara', '~> 2.4.4'
  gem 'capybara-webkit', '~> 1.5.1'
  gem 'selenium-webdriver', '~> 2.45.0'
  gem 'webmock', '~> 1.18.0'
  gem 'database_cleaner', '~> 1.4.1'
  gem 'timecop'
end

group :development do
  gem 'guard-rspec', require: false
  gem 'quiet_assets'
end

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'capybara-screenshot', '~> 1.0.9'
  gem 'rspec-rails', '~> 3.2.1'
  gem 'pry'
  gem 'rspec_junit_formatter', '0.2.2'

end

