source 'https://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3'
gem 'squeel'
gem 'pg'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

#gem "browsercms", :path => "/Users/davidvezzani/rails-app/browsercms"
gem "browsercms", :git => "git@github.com:dcvezzani/browsercms.git"
gem "bcms_blog"
# gem "browsercms", "4.0.0.a", git: 'git@github.com:browsermedia/browsercms.git'
# gem "bcms_blog", git: 'git@github.com:dcvezzani/bcms_blog.git'
# gem "bcms_blog", :path => "/Users/davidvezzani/rails-app/bcms_blog"

group :test do
  gem 'factory_girl_rails', '3.3.0'
  gem 'test-unit', '2.1.1'
  # :require=>false allows mocha to correctly modify the test:unit code to add mock() and stub()
  gem "mocha", '=0.9.8', :require=>false
  #gem "sqlite3-ruby", :require => "sqlite3"

  # Cucumber and dependencies
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails', require: false
  gem 'cucumber'
  gem 'launchy'
  gem 'ruby-prof'
  gem 'aruba'

  gem 'spork'
  #gem 'spork', :git => 'git://github.com/timcharper/spork.git'
  gem 'spork-testunit'
  gem 'watchr'
  #gem 'ruby-fsevent'
end


group :development, :test do
  gem 'jasmine'

  gem 'nifty-generators', git: 'http://github.com/dcvezzani/nifty-generators.git'
  gem 'debugger'
end

