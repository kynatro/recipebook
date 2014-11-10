#ruby-gemset=recipebook

source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.1.2'

gem 'rails', '4.1.7'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'puma'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'spring-commands-rspec'
  gem 'rspec-rails', '~> 3.0.0'
  gem 'guard-rspec'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'terminal-notifier-guard'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'database_cleaner'
  gem 'faker'
end

group :assets do
  # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
  gem 'turbolinks'
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'
  # Use CoffeeScript for .js.coffee assets and views
  gem 'coffee-rails', '~> 4.0.0'
  # Use jquery as the JavaScript library
  gem 'jquery-rails', '~> 3.1.2'
  # Bootstrap SASS distribution
  gem 'bootstrap-sass', '~> 3.3.0'
  # Automatic CSS prefixer
  gem 'autoprefixer-rails'

  gem 'rails-assets-angular'
end
